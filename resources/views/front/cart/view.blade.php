@extends('front.layouts.app')

@section('meta_title','Cart Page Schoengebraucht E commerce')
@section('meta_description','Cart Page Schoengebraucht E commerce')

@section('styles')
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet"/>
    <style>
        .checkbox {
            margin: 0;
        }
    </style>
@endsection

@section('content')
    <main>
        <section class="container stylization maincont">
            <ul class="b-crumbs">
                <li>
                    <a href="{{ route('home') }}">
                        Home
                    </a>
                </li>
                <li>
                    <a href="{{ route('cart.view') }}">
                        Warenkorb
                    </a>
                </li>
            </ul>
            <h1 class="main-ttl">
                <span>Warenkorb</span>
            </h1>
            @if(count($cartItems) <= 0)
                <p style="color:#fff;">{{ __('front.product-no-found') }}</p>
            @else
                <form method="post" action="{{ route('cart.update.delivery') }}" id="cart-form" style="border-radius: 4px; background-color: white; padding: 15px;">
                    {{ csrf_field() }}
                    <div class="cart-items-wrap">
                        <table class="cart-items">
                            <thead>
                                <tr>
                                    <td class="cart-image" style="text-align: center;">{{ __('front.photo') }}</td>
                                    <td class="cart-ttl">{{ __('front.product') }}/{{ __('front.package') }}</td>
                                    <td class="cart-price">{{ __('front.price') }}</td>
                                    <td class="cart-quantity" style="text-align: center">{{ __('front.quantity') }}</td>
                                    <td class="cart-summ">{{ __('front.total') }}</td>
                                    <td class="cart-del">&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $total = 0; $taxTotal = 0;$giftCouponAmount = 0; ?>
                                @foreach($cartItems as $cartKey => $cartItem)
                                    <?php $type = explode(':', $cartKey)[0]; ?>
                                    <input type="hidden" name="_method" value="post" />

                                    @if ($type == 'product')
                                        <tr>
                                            <td class="cart-image">
                                                <a href="{{ route('product.view', $cartItem['slug'])}}">
                                                    <img alt="{{ $cartItem['name'] }}"
                                                         class="{{\App\Models\Database\Product::where('id', $cartItem['id'])->first()->main_image->filters}}"
                                                         src="{{ asset( $cartItem['image']) }}"/>
                                                </a>
                                            </td>

                                            <td class="cart-ttl">
                                                <a href="{{ route('product.view', $cartItem['slug'])}}">{{ $cartItem['name'] }}</a>
                                                <p>Status: <span class="text-success"><strong>{{ __('front.in-stock') }}</strong></span></p>
                                            </td>
                                            <?php $total += ($cartItem['price'] * $cartItem['qty']) + $cartItem['delivery_price']; ?>

                                            <td class="cart-price price">
                                                <b>CHF <span style="color: #252525;">{{ number_format($cartItem['price'],2) }}</span></b>
                                            </td>
                                            <td class="cart-quantity">
                                                <p class="cart-qnt">
                                                    <input type="text" name="qty" id="qty{{ $cartItem['id'] }}"
                                                           value="{{ $cartItem['qty']}}">
                                                    <input type="hidden" name="type" value="{{ $type }}">
                                                    <input type="hidden" name="id" data-item-id="{{ $cartItem['id'] }}" data-token="{{ csrf_token() }}">
                                                    <a class="cart-plus prod-plus change-qty"><i class="fa fa-angle-up"></i></a>
                                                    <a class="cart-minus prod-minus change-qty"><i class="fa fa-angle-down"></i></a>
                                                </p>
                                                <div class="help-block" style="margin: 0; color: red;"></div>
                                            </td>
                                            <td class="cart-summ price-and-quantity">
                                                <b>CHF <span style="color: #252525;" class="paq">{{ number_format($cartItem['price'] * $cartItem['qty'] ,2)}}</span></b>
                                                <section class="single-tax">
                                                    <span style="color: #252525;">CHF</span>
                                                    <span style="color: #252525;">{{ $cartItem['delivery_price'] ? $cartItem['delivery_price'] : '' }}</span>
                                                </section>
                                            </td>
                                            <td class="cart-del">
                                                <a class="cart-remove" href="{{ route('cart.destroy', ['id' => $cartItem['id'], 'type' => $type])}}"></a>
                                            </td>
                                        </tr>
                                    @elseif ($type == 'package')
                                        <tr>
                                            <td class="cart-image">
                                                <a href="#">
                                                    <img alt="{{ $cartItem['name'] }}"
                                                         src="{{ asset( $cartItem['image']) }}"/>
                                                </a>
                                            </td>

                                            <td class="cart-ttl">
                                                <a href="#">{{ $cartItem['name'] }}</a>
                                                @foreach (\App\Models\Database\Package::where('id', $cartItem['id'])->first()->products as $product)
                                                    <p><span style="color: #aaa;">{{ $product->name }} - <del>CHF {{ $product->price }}</del></span></p>
                                                @endforeach
                                            </td>
                                            <?php $total += ($cartItem['price'] * $cartItem['qty']) + $cartItem['delivery_price']; ?>

                                            <td class="cart-price price">
                                                <b>CHF <span style="color: #252525;">{{ number_format($cartItem['price'],2) }}</span></b>
                                            </td>
                                            <td class="cart-quantity">
                                                <p class="cart-qnt">
                                                    <input type="text" name="qty" id="qty{{ $cartItem['id'] }}"
                                                           value="{{ $cartItem['qty']}}">
                                                    <input type="hidden" name="type" value="{{ $type }}">
                                                    <input type="hidden" name="id" data-item-id="{{ $cartItem['id'] }}" data-token="{{ csrf_token() }}">
                                                    <a class="cart-plus prod-plus change-qty"><i class="fa fa-angle-up"></i></a>
                                                    <a class="cart-minus prod-minus change-qty"><i class="fa fa-angle-down"></i></a>
                                                </p>
                                                <div class="help-block" style="margin: 0; color: red;"></div>
                                            </td>
                                            <td class="cart-summ price-and-quantity">
                                                <b>CHF <span style="color: #252525;" class="paq">{{ number_format($cartItem['price'] * $cartItem['qty'] ,2)}}</span></b>
                                                <section class="single-tax">
                                                    <span style="color: #252525;">CHF</span>
                                                    <span style="color: #252525;">{{ $cartItem['delivery_price'] ? $cartItem['delivery_price'] : '' }}</span>
                                                </section>
                                            </td>
                                            <td class="cart-del">
                                                <a class="cart-remove" href="{{ route('cart.destroy', ['id' => $cartItem['id'], 'type' => $type])}}"></a>
                                            </td>
                                        </tr>
                                    @endif
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <ul class="cart-total">
                        <li class="cart-summ">
                            {{ __('front.total') }}: <b>CHF <span style="color: #ff0000;" class="total-sum-price">{{ number_format(($total),2) }}</span></b>
                            <p class="cart_pdv">MwSt: 7.7%</p>
                        </li>
                    </ul>
                    <div class="cart-submit">
                        <button type="submit" id="button-checkout" class="cart-submit-btn" style="margin-bottom: 0;">{{ __('front.checkout') }}</button>
                        <a href="{{ route('home') }}" class="cart-clear" id="continue-shopping" style="color: #583520; margin-bottom: 0;">{{ __('front.continue-shopping') }}</a>
                    </div>
                </form>
            @endif
        </section>
    </main>
@endsection

@section('scripts')
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
    <script>
        var totalPrice = $('.total-sum-price');
    </script>
    <script>
        $(function () {
            $('.change-qty').click(function () {
                var that = $(this);
                var qtyField = that.siblings('input[name="qty"]');
                var typeField = that.siblings('input[name="type"]');
                var type = typeField.val();
                var qty = parseInt(qtyField.val());

                if (qty <= 0 || isNaN(qty)) {
                    qty = 1;
                }
                qty = addOrSubstractQty(qty, that.attr('class'));
                qtyField.val(qty);

                var closestTd = that.closest('td');
                var price = closestTd.siblings('td.price').find('span');
                var closestPriceAndQuantity = closestTd.siblings('td.price-and-quantity').find('span.paq');
                var totalPrice = $('.total-sum-price');
                var singleProductTotal = toFloat(price.text()) * qty;
                closestPriceAndQuantity.text(number_format(singleProductTotal, 2));

                var priceAndQuantity = $('td.price-and-quantity').find('span.paq');

                var sum = 0;
                priceAndQuantity.each(function() {
                    var that = $(this);
                    var taxEl = that.closest('.price-and-quantity').find('.single-tax span:last-child')
                    var taxVal = toFloat(taxEl.text());
                    var thatPlusDelivery = toFloat(that.text());
                    if (taxEl.is(':visible')) {
                        var thatPlusDelivery = thatPlusDelivery + taxVal;
                    }
                    sum += thatPlusDelivery;
                });
                totalPrice.text(number_format(sum, 2));

                var idField = that.siblings('input[name="id"]')
                var token = idField.attr('data-token');
                var itemId = idField.attr('data-item-id');
                var data = { _token: token, id: itemId, qty: qty, type: type };

                $.ajax({
                    url: '{{ url('cart/update') }}',
                    data: data,
                    type: 'post',
                    success: function (data) {
                        var checkoutButton = $('#button-checkout');
                        var errorHelpBlock = that.parent('p.cart-qnt').siblings('.help-block');
                        if (data.status) {
                            checkoutButton.attr('disabled', false);
                            errorHelpBlock.text('');
                            return true;
                        } else {
                            errorHelpBlock.text(data.error);
                            checkoutButton.attr('disabled', true);
                            return false;
                        }
                        console.log(data);
                    },
                });
            });

            $('p.cart-qnt input:text').on('keyup', function (e) {
                var that = $(this);
                var qty = that.val();
                var typeField = that.siblings('input[name="type"]');
                var type = typeField.val();

                if (qty != '' && qty <= 0 || isNaN(qty)) {
                    qty = 1;
                }

                var closestTd = that.closest('td');
                var price = closestTd.siblings('td.price').find('span');
                var closestPriceAndQuantity = closestTd.siblings('td.price-and-quantity').find('span.paq');
                var totalPrice = $('.total-sum-price');
                var singleProductTotal = toFloat(price.text()) * qty;
                closestPriceAndQuantity.text(number_format(singleProductTotal, 2));

                var priceAndQuantity = $('td.price-and-quantity').find('span.paq');

                var sum = 0;
                priceAndQuantity.each(function() {
                    var that = $(this);
                    var taxEl = that.closest('.price-and-quantity').find('.single-tax span:last-child')
                    var taxVal = toFloat(taxEl.text());
                    var thatPlusDelivery = toFloat(that.text());
                    if (taxEl.is(':visible')) {
                        var thatPlusDelivery = thatPlusDelivery + taxVal;
                    }
                    sum += thatPlusDelivery;
                });
                totalPrice.text(number_format(sum, 2));

                var idField = that.siblings('input[name="id"]')
                var token = idField.attr('data-token');
                var itemId = idField.attr('data-item-id');
                var data = { _token: token, id: itemId, qty: that.val(), type: type };

                $.ajax({
                    url: '{{ url('/cart/update') }}',
                    data: data,
                    type: 'post',
                    success: function (data) {
                        var checkoutButton = $('#button-checkout');
                        var errorHelpBlock = that.parent('p.cart-qnt').siblings('.help-block');
                        if (data.status) {
                            checkoutButton.attr('disabled', false);
                            errorHelpBlock.text('');
                            return true;
                        } else {
                            errorHelpBlock.text(data.error);
                            checkoutButton.attr('disabled', true);
                            return false;
                        }
                    }
                });

                that.val(qty);
            });
        });
    </script>

    <script>
        $('.toggle').bootstrapToggle({
                on: 'JA',
                off: 'NEIN'
            }).on('change', function () {
                var that = $(this);
                var tax = that.closest('td').siblings('td.price-and-quantity').find('.single-tax');
                tax.toggle();
                var taxVal = toFloat(tax.find('span:last-child').text());
                var totalPriceVal = toFloat(totalPrice.text());
                if (tax.is(':visible')) {
                    totalPrice.text(number_format(totalPriceVal + taxVal, 2));
                } else {
                    totalPrice.text(number_format(totalPriceVal - taxVal, 2));
                }
        });
    </script>

    <script>
        var tooltips = document.querySelectorAll('.image-tooltip span');
        window.onmousemove = function (e) {
            var x = (e.clientX + 20) + 'px',
                    y = (e.clientY + 20) + 'px';
            for (var i = 0; i < tooltips.length; i++) {
                tooltips[i].style.top = y;
                tooltips[i].style.left = x;
            }
        };
    </script>
@endsection