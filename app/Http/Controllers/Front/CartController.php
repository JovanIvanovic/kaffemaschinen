<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\Database\Product;
use App\Models\Database\Package;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\JsonResponse;
use Stripe\{Charge, Customer};

class CartController extends Controller
{
    public function addToCart(Request $request)
    {
        $cart = (null === Session::get('cart')) ? Collection::make([]) : Session::get('cart');

        if ($request->get('type') == 'product') {
            $product = Product::where('id', '=', $request->get('id'))->first();
        } elseif ($request->get('type') == 'package') {
            $package = Package::where('id', '=', $request->get('id'))->first();
        }

        $qty = (null === $request->get('qty')) ? 1 : $request->get('qty');

        if ($request->get('type') == 'product') {
            if ($cart->has('product:'.$product->id)) {
                $item = $cart->pull($product->id);
                $item['qty'] = $qty;
                $cart->put($product->id, $item);
            } else {
                if ($product->discount == 1)
                    $price = $product->discount_price;
                else
                    $price = $product->price;

                $cart->put('product:'.$product->id, [
                    'id' => $product->id,
                    'qty' => $qty,
                    'price' => $price,
                    'image' => $product->image->smallUrl,
                    'name' => $product->name,
                    'slug' => $product->slug,
                    'delivery' => $product->delivery,
                    'delivery_price' => $product->delivery_price,
                ]);
            }
        } elseif ($request->get('type') == 'package') {
            if ($cart->has('package:'.$package->id)) {
                $item = $cart->pull($package->id);
                $item['qty'] = $qty;
                $cart->put($package->id, $item);
            } else {
                $price = $package->price;

                $cart->put('package:'.$package->id, [
                    'id' => $package->id,
                    'qty' => $qty,
                    'price' => $price,
                    'image' => asset('front/assets/img/package-default.png'),
                    'name' => $package->name,
                    'delivery_price' => $package->delivery_price,
                ]);
            }
        }

        Session::put('cart', $cart);
        return redirect()->back()->with('notificationText', 'Der Artikel/Angebot wurde erfolgreich in den Warenkorb hinzugefügt!');
    }

    public function view()
    {
        $cartItems = Session::get('cart');

        $allProducts = Product::select('id')->get();
        $allPackages = Package::select('id')->get();

        if($cartItems) {
            $arr = [];
            foreach ($allProducts as $product) {
                foreach ($cartItems as $cartKey => $cartItem) {
                    $type = explode(':', $cartKey)[0];

                    if ($type == 'product') {
                        if ($product->id == $cartItem['id']) {
                            $arr['product:'.$cartItem['id']] = $cartItem;
                        }
                    }
                }
            }
            foreach ($allPackages as $package) {
                foreach ($cartItems as $cartKey => $cartItem) {
                    $type = explode(':', $cartKey)[0];

                    if ($type == 'package') {
                        if ($package->id == $cartItem['id']) {
                            $arr['package:'.$cartItem['id']] = $cartItem;
                        }
                    }
                }
            }
            $cartItems = $arr;
        }
        return view('front.cart.view')
            ->with('cartItems', $cartItems);
            
    }

    public function update(Request $request)
    {
        $cartData = Session::get('cart');
        $qty = $request->get('qty');

        if ($request->get('type') == 'product') {
            $product = Product::find(request('productId'));

            if ($qty > $product->qty) {
                return JsonResponse::create([
                    'status' => false,
                    'error' => 'Out of Stock',
                ]);
            }

            if (!is_numeric($qty)) {
                $item = $cartData->pull($request->get('productId'));
                $item['qty'] = 1;
                $cartData->put($request->get('productId'), $item);
            } elseif ($qty == 0) {
                $cartData->pull($request->get('productId'));
            } else {
                $item = $cartData->pull($request->get('productId'));
                $item['qty'] = $qty;
                $cartData->put($request->get('productId'), $item);
            }
        } elseif ($request->get('type') == 'package') {
            $package = Package::find(request('productId'));

            if (!is_numeric($qty)) {
                $item = $cartData->pull($request->get('productId'));
                $item['qty'] = 1;
                $cartData->put($request->get('productId'), $item);
            } elseif ($qty == 0) {
                $cartData->pull($request->get('productId'));
            } else {
                $item = $cartData->pull($request->get('productId'));
                $item['qty'] = $qty;
                $cartData->put($request->get('productId'), $item);
            }
        }

        $product = Product::find(request('productId')); // TODO: Remove

        

        Session::put('cart', $cartData);

        //return redirect()->back();
        return JsonResponse::create(['status' => true, 'cart' => Session::get('cart')]);
    }

    public function updateDelivery(Request $request)
    {
        $cartData = Session::get('cart');
        $aDelivery = $request->input('delivery');
        if ($aDelivery == null) {
            $aDelivery = [];
        }
        $hasDelivery = false;
        $hasPickup = false;

        foreach ($cartData as $item) {
            if (in_array($item['id'], $aDelivery)) {
                $pom = $cartData->pull($item['id']);
                $pom['for_delivery'] = true;
                $cartData->put($pom['id'], $pom);
                $hasDelivery = true;
            }
            else {
                $pom = $cartData->pull($item['id']);
                $pom['for_delivery'] = false;
                $cartData->put($pom['id'], $pom);
                $hasPickup = true;
            }
            // $item = $cartData->pull($request->get('productId'));
            // $item['qty'] = request('qty');
            // $cartData->put($request->get('productId'), $item);
        }

        // dd($cartData);

        Session::put('cart', $cartData);
        Session::put('hasDelivery', $hasDelivery);
        Session::put('hasPickup', $hasPickup);

        //return redirect()->back();
        return redirect('/checkout');
    }

    public function destroy($id, $type)
    {
        $cartData = Session::get('cart');
        $cartData->pull($type.':'.$id);

        Session::put('cart', $cartData);

        return redirect()->back();
    }
}