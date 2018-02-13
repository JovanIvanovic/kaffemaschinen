@extends('front.layouts.app')

@section('meta_title','Cart Page Schoengebraucht E commerce')
@section('meta_description','Cart Page Schoengebraucht E commerce')

@section('styles')
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
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
            @if(count($cartProducts) <= 0)
                <p>{{ __('front.product-no-found') }}</p>
            @else
                <form method="post" action="{{ route('cart.update.delivery') }}" id="cart-form">
                    {{ csrf_field() }}
                    <div class="cart-items-wrap">
                        <table class="cart-items">
                            <thead>
                                <tr>
                                    <td class="cart-image cart-foto">{{ __('front.photo') }}</td>
                                    <td class="cart-ttl">{{ __('front.product') }}</td>
                                    <td class="cart-ttl">{{ __('front.delivery') }}</td>
                                    <td class="cart-price">{{ __('front.price') }}</td>
                                    <td class="cart-quantity" style="text-align: center">{{ __('front.quantity') }}</td>
                                    <td class="cart-summ">{{ __('front.total') }}</td>
                                    <td class="cart-del">&nbsp;</td>
                                </tr>
                            </thead>
                            <tbody class="cart_table_body">
                                <?php $total = 0; $taxTotal = 0;$giftCouponAmount = 0; ?>
                                @foreach($cartProducts as $product)
                                    <input type="hidden" name="_method" value="post" />

                                    <tr>
                                        <td class="cart-image">
                                            <div class="image-tooltip">
                                                <a href="{{ route('product.view', $product['slug'])}}">
                                                    <img alt="{{ $product['name'] }}"
                                                         class="{{\App\Models\Database\Product::where('id', $product['id'])->first()->main_image->filters}}"
                                                         src="{{ asset( $product['image']) }}"/>
                                                </a>
                                                <span>
                                                    <img src="{{ asset( $product['image']) }}" alt="{{ $product['name'] }}" width="150px" height="174px">
                                                </span>
                                            </div>
                                        </td>

                                        <td class="cart-ttl">
                                            <a href="{{ route('product.view', $product['slug'])}}">{{ $product['name'] }}</a>
                                            <p>Status: <span class="text-success"><strong>{{ __('front.in-stock') }}</strong></span></p>
                                        </td>
                                        <td>
                                            @if($product['delivery'] == 0)
                                                <div class="checkbox disabled" title="Dieses Produkt kann nicht geliefert werden">
                                                    <label>
                                                        <input class="toggle" name="delivery[]"  type="checkbox" disabled>
                                                    </label>
                                                </div>
                                            @else
                                                <div class="checkbox">
                                                    <label>
                                                        <input class="toggle" name="delivery[]" value="{{ $product['id'] }}" type="checkbox">
                                                    </label>
                                                </div>
                                            @endif
                                        </td>
                                        <?php $total += ($product['price'] * $product['qty']); ?>

                                        <td class="cart-price price">
                                            <b>CHF <span style="color: #252525;">{{ number_format($product['price'],2) }}</span></b>
                                        </td>
                                        <td class="cart-quantity">
                                            <p class="cart-qnt">
                                                <input type="text" name="qty" id="qty{{ $product['id'] }}"
                                                       value="{{ $product['qty']}}">
                                                <input type="hidden" data-product-id="{{ $product['id'] }}" data-token="{{ csrf_token() }}">
                                                <a class="cart-plus prod-plus change-qty"><i class="fa fa-angle-up"></i></a>
                                                <a class="cart-minus prod-minus change-qty"><i class="fa fa-angle-down"></i></a>
                                            </p>
                                            <div class="help-block" style="margin: 0; color: red;"></div>
                                        </td>
                                        <td class="cart-summ price-and-quantity">
                                            <b>CHF <span style="color: #252525;" class="paq">{{ number_format($product['price'] * $product['qty'] ,2)}}</span></b>
                                            <section class="single-tax" style="display: none;">
                                                <span style="color: #252525;">CHF</span>
                                                <span style="color: #252525;">{{ $product['delivery_price'] ? $product['delivery_price'] : '' }}</span>
                                            </section>
                                        </td>
                                        <td class="cart-del">
                                                <a class="cart-remove" href="{{ route('cart.destroy', $product['id'])}}"></a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <ul class="cart-total">
                        <li class="cart-summ">{{ __('front.total') }}: <b>CHF <span style="color: #3a89cf;" class="total-sum-price">{{ number_format(($total),2) }}</span></b></li>
                    </ul>
                    <div class="cart-submit">
                        <div class="cart-coupon">

                            <p style="margin: 0;">
                                <label>Abholungen haben innert 7 Tagen zu erfolgen.</label>
                            </p>
                            <p style="margin: 0;">
                                <label>Langere Lagerung nur auf Anfrage gegen Gebuhr.</label>
                            </p>

                        </div>
                        <input type="submit" id="button-checkout" value="{{ __('front.checkout') }}" class="cart-submit-btn" />
                        <a href="{{ route('home') }}" class="cart-clear" id="continue-shopping">{{ __('front.continue-shopping') }}</a>
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
                var qtyField = that.siblings('input[type="text"]');
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

                var hiddenField = that.siblings('input[type="hidden"]')
                var token = hiddenField.attr('data-token');
                var productId = hiddenField.attr('data-product-id');
                var data = { _token: token, productId: productId, qty: qty };

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
                    },
                });
            });

            $('p.cart-qnt input:text').on('keyup', function (e) {
                var that = $(this);
                var qty = that.val();

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

                var hiddenField = that.siblings('input[type="hidden"]')
                var token = hiddenField.attr('data-token');
                var productId = hiddenField.attr('data-product-id');
                var data = { _token: token, productId: productId, qty: that.val() };

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