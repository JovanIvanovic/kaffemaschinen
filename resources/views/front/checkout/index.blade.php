@extends('front.layouts.app')

@section('meta_title','Checkout Page')
@section('meta_description','Checkout Page')

@section('content')
<main>
<div class="container">
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
                <li>
                        Zur Kasse
                </li>
            </ul>
    <div class="main-ttl"><span>{{ __('front.checkout') }}</span></div>

    @if(count($cartItems) <=  0)
    <p>{{ __('front.product-no-found') }} <a href="{{ route('home') }}">{{ __('front.start-shopping') }}</a></p>
    @else

    <form id="place-order-form" method="post" action="{{ route('order.place') }}">
        {{ csrf_field() }}
        <div class="row">
            <div class="col-sm-6">
                <div class="card billing-address-wrapper">
                    <div class="card-header">
                        {{ __('front.personal-details') }}
                    </div>
                    <div class="card-body" style="margin-top: 10px">
                        <?php
                        $firstName = $lastName = $phone = "";
                        if (Auth::check()) {
                            $firstName = Auth::user()->first_name;
                            $lastName = Auth::user()->last_name;
                            $phone = Auth::user()->phone;
                        }
                        ?>
                        @if(!Auth::check())
                        <div class="row">
                            <div class="form-group col-sm-6">
                                {{--<label class="control-label" for="input-user-first-name">{{ __('front.account-first-name') }}*</label>--}}
                                <input type="text" name="billing_first_name" placeholder="{{ __('front.account-first-name') }}"
                                id="name" class="form-control checkout-input">
                            </div>
                            <div class="form-group  col-sm-6">
                                {{--<label class="control-label" for="input-user-last-name">{{ __('front.account-last-name') }}*</label>--}}
                                <input type="text" name="billing_last_name" placeholder="{{ __('front.account-last-name') }}"
                                id="name" class="form-control checkout-input">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <select onchange="checkCompany()" name="is_company" id="is_company" class="form-control checkout-input">
                                    <option selected disabled>{{ __('front.please-select') }}</option>
                                    <option value="0">{{ __('front.private-customer') }}</option>
                                    <option value="1">{{ __('front.business-customer') }}</option>
                                </select>
                            </div>
                            <div class="form-group col-sm-6" id="check_company" style="display: none;">
                                <input id="company_name" class="form-control checkout-input" placeholder="Firmenname" type="text" name="company_name" value="{{ old('company_name') }}">
                            </div>
                        </div>
                        <div class="form-group">
                            {{--<label class="control-label" for="input-user-email">E-Mail*</label>--}}
                            <input type="text" name="email" placeholder="E-Mail"
                            id="name" class="form-control checkout-input">
                        </div>

                        <div class="register-form">
                            <div class="row">
                                <div class="form-group  col-sm-6">
                                    {{--<label class="control-label" for="input-billing-password">{{ __('front.account-password') }}*</label>--}}
                                    <input type="password" name="password" placeholder="{{ __('front.account-password') }}"
                                    id="name" class="form-control checkout-input">
                                </div>
                                <div class="form-group  col-sm-6">
                                    {{--<label class="control-label" for="input-billing-confirm">{{ __('front.account-confirm-password') }}*</label>--}}
                                    <input type="password" name="password_confirmation"
                                    placeholder="{{ __('front.account-confirm-password') }}"
                                    id="name" class="form-control checkout-input">
                                </div>
                            </div>
                        </div>

                        @endif
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-body">
                        <div id="payment-address-new">
                            <?php
                            $address = NULL;
                            if (NULL !== $user) {
                                $address = $user->getBillingAddress();
                            }
                            ?>
                            @if(NULL === $address)
                            <div class="form-group">
                                {{--<label class="control-label" for="input-billing-address-1">{{ __('front.address') }}*</label>--}}
                                <input type="text" name="billing_address" value="" placeholder="{{ __('front.address') }}"
                                id="name" class="form-control checkout-input">
                            </div>

                            <div class="form-group">
                                {{--<label class="control-label" for="input-billing-address-2">{{ __('front.account-Address 2') }}</label>--}}
                                <input type="text" name="billing_address2" value="" placeholder="{{ __('front.account-Address 2') }}"
                                 id="name" class="form-control checkout-input">
                            </div>

                            <div class="row">
                                <div class="form-group col-sm-6">
                                    {{--<label class="control-label" for="input-billing-postcode">{{ __('front.account-zip') }}*</label>--}}
                                    <input type="text" data-name="postcode" name="billing_postcode" value=""
                                    placeholder="{{ __('front.account-zip') }}"
                                    id="name" class="form-control checkout-input">
                                </div>
                                <div class="form-group  col-sm-6">
                                    {{--<label class="control-label" for="input-billing-city">{{ __('front.account-city') }}*</label>--}}
                                    <input type="text" data-name="city" name="billing_city"
                                    placeholder="{{ __('front.account-city') }}"
                                    id="name" class="form-control checkout-input">
                                </div>
                            </div>
                            @else

                            <div class="form-group  col-sm-12">
                                <div class="card card-default">
                                    <div class="card-header">{{ __('front.account-billing-address') }}</div>
                                    <div class="card-body">

                                        <p style="color: #fff;">
                                            {{ $address->first_name }} {{ $address->last_name }}
                                            <br/>
                                            {{ $address->address1 }}<br/>
                                            {{ $address->address2 }}<br/>
                                            {{ $address->postcode }}<br/>
                                            {{ $address->city }}<br/>
                                            {{ $address->state }}<br/>
                                            {{ $address->phone }}<br/>
                                        </p>
                                        <input type="hidden" name="billing[id]" value="{{ $address->id }}"/>
                                    </div>
                                </div>
                            </div>

                            @endif


                            <div class="form-group col-sm-12" style="padding-left: 0px">
                                <label style="color: #fff;">
                                    <input type="checkbox" id="use_different_shipping_address" name="use_different_shipping_address">&nbsp;{{ __('front.different-shipping-address') }}
                                </label>
                                </div>

                            </div>
                            <?php
                            $addresses = NULL;
                            if (NULL !== $user) {
                                $addresses = $user->getShippingAddresses();
                            }
                            ?>

                            <div id="different-shipping-form" style="display: none; clear: both;">
                                <div class="radio shipping-address-wrapper">
                                    <div class="row">
                                        <div class="form-group  col-sm-6">
                                            {{--<label class="control-label" for="input-billing-firstname">{{ __('front.account-first-name') }}*</label>--}}
                                            <input type="text" name="shipping_first_name"
                                            value="" placeholder="{{ __('front.account-first-name') }}"
                                            id="name" class="form-control checkout-input">
                                        </div>
                                        <div class="form-group  col-sm-6">
                                            {{--<label class="control-label" for="input-billing-lastname">{{ __('front.account-last-name') }}*</label>--}}
                                            <input type="text" name="shipping_last_name"
                                            value="" placeholder="{{ __('front.account-last-name') }}"
                                            id="name" class="form-control checkout-input">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        {{--<label class="control-label" for="input-shipping-address-1">{{ __('front.account-address-1') }}*</label>--}}
                                        <input type="text" name="shipping_address" value="" placeholder="{{ __('front.account-address-1') }}"
                                        id="name" class="form-control checkout-input">
                                    </div>

                                    <div class="form-group">
                                        {{--<label class="control-label" for="input-shipping-address-2">{{ __('front.account-Address 2') }}</label>--}}
                                        <input type="text" name="shipping_address2" value="" placeholder="{{ __('front.account-Address 2') }}"
                                        id="name" class="form-control checkout-input">
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            {{--<label class="control-label" for="input-shipping-postcode">{{ __('front.account-zip') }}*</label>--}}
                                            <input type="text" data-name="postcode" name="shipping_postcode" value=""
                                            placeholder="{{ __('front.account-zip') }}"
                                            id="name" class="form-control checkout-input">
                                        </div>


                                        <div class="form-group  col-sm-6">
                                            {{--<label class="control-label" for="input-shipping-city">{{ __('front.account-city') }}*</label>--}}
                                            <input type="text" data-name="city" name="shipping_city" placeholder="{{ __('front.account-city') }}"
                                            id="name" class="form-control checkout-input">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            {{--<label class="control-label" for="input-shipping-phone">{{ __('front.phone') }}</label>--}}
                                            <input type="text" name="shipping_phone" value="" placeholder="{{ __('front.phone') }}"
                                            id="name" class="form-control checkout-input">
                                        </div>
                                    </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card mb-3">
                    <div class="card-header">{{ __('front.payment-option') }}</div>
                </div>
                <div class="card mb-3">
                    <div class="card-body">
                       <div style="overflow-x: auto;">
                        <table id="cart_table" class="table table-bordered table-hover table-responsive" style="margin-top: 10px">
                            <thead>
                                <tr>
                                    <th class="text-left">{{ __('front.product-name') }}</th>
                                    <th class="text-right">{{ __('front.quantity') }}</th>
                                    <th class="text-right">{{ __('front.unit-price') }}</th>
                                    {{--<th class="text-right">{{ __('front.delivery_option') }}</th>--}}
                                    <th class="text-right">{{ __('front.total') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $subTotal = 0;
                                $subTotal25 = 0;
                                $subTotal77 = 0;
                                $subTotalPickup = 0;
                                $subTotalDelivery = 0;
                                $totalTax25 = 0;
                                $totalTax77 = 0;
                                $shipping = 0;
                                ?>
                                @foreach($cartItems as $cartItem)
                                <tr>
                                    <td class="text-left">
                                        {{ $cartItem['name'] }}
                                    </td>
                                    <td class="text-right">{{ $cartItem['qty'] }}</td>
                                    <td class="text-right">
                                    CHF {{ number_format($cartItem['price'],2) }}</td>

                                    {{--<td class="text-center">--}}
                                        {{--{{ $cartItem['for_delivery'] ? __('front.delivery') : __('front.pick_up') }}--}}
                                    {{--</td>--}}

                                    <td class="text-right">
                                    CHF {{ number_format($cartItem['qty'] * $cartItem['price'], 2) }}</td>
                                </tr>

                                <?php
                                $shipping = (float)\App\Models\Database\Configuration::getConfiguration('delivery_price');

                                if ($cartItem['pdv'] == '2.5') {
                                    $subTotal25 += $cartItem['qty'] * $cartItem['price'];
                                } elseif ($cartItem['pdv'] == '7.7') {
                                    $subTotal77 += $cartItem['qty'] * $cartItem['price'];
                                }

                                ?>

                                <input type="hidden" name="products[]" value="{{ $cartItem['id'] }}"/>
                                @endforeach
                                <?php
                                    $subTotal = ($subTotal25 + $subTotal77);

                                    $totalTax25 = ($subTotal25 / 100) * 2.5;
                                    $totalTax77 = ($subTotal77 / 100) * 7.7;
                                ?>
                            </tbody>
                        </table>
                        </div>
                        <table class="table table-bordered table-hover table-responsive" style="background: #fff;">
                            @php 
                            $total = $subTotal > 100 ? $subTotal : $subTotal + $shipping;
                            $deliveryTotal = $subTotalDelivery + $shipping;
                            $pickupTotal = $subTotalPickup;
                            Session::put('total', $total);
                            Session::put('deliveryTotal', $deliveryTotal);
                            Session::put('pickupTotal', $pickupTotal);
                            Session::put('totalTax25', $totalTax25);
                            Session::put('totalTax77', $totalTax77);
                            @endphp

                            @if($subTotal < 100)
                            <tr class=" shipping-row">
                                <td colspan="4" class="text-right  hidden-xs"><strong>{{ __('front.shipping-option') }}:</strong></td>
                                <td class="text-right shipping-cost" data-shipping-cost="{{ $shipping }}">CHF {{ number_format($shipping, 2) }}</td>
                            </tr>
                            @endif
                            {{--
                            <tr>
                                <td colspan="4" class="text-right  hidden-xs"><strong>{{ __('front.tax-amount') }}:</strong></td>
                                <td class="text-right tax-amount" data-tax-amount="{{ $totalTax }}">
                                CHF {{ number_format($totalTax,2) }}</td>
                            </tr>
                            --}}
                            <tr>
                                <td colspan="4" class="text-right hidden-xs"><strong>{{ __('front.total') }}:</strong></td>
                                <td class="text-right total" data-total="{{ $total }}">
                                CHF {{ number_format($total, 2) }}</td>
                            </tr>
                            <tr>
                                <td colspan="4" class="text-right hidden-xs"><strong>{{ __('front.contain_vat', ['vat' => '2.5']) }}</strong></td>
                                <td class="text-right">{{ 'CHF ' . number_format($totalTax25, 2) }}</td>
                            </tr>
                            <tr>
                                <td colspan="4" class="text-right hidden-xs"><strong>{{ __('front.contain_vat', ['vat' => '7.7']) }}</strong></td>
                                <td class="text-right">{{ 'CHF ' . number_format($totalTax77, 2) }}</td>
                            </tr>
                        </table>
                        {{-- <em class="pull-right" style="margin-top: -15px; font-size: 13px;">{{ __('front.with_vat') }}</em> --}}
                    </div>
                </div>

                <div class="card mb-3" style="clear: both;">
                    <div class="card-header">
                        {{ __('front.your-comment') }}
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <textarea name="comment" rows="3" class="form-control checkout-textarea"></textarea>

                            <div class="buttons clearfix">
                                <div class="float-right" style="margin:15px 0; color: #fff; font-size: 13px;">
                                    <input type="checkbox" name="billing_terms_and_conditions" id="agree" />
                                    Ich habe die <a href="{{ $termConditionPageUrl }}" target="_blank" class="agree"><b>AGB's</b></a> gelesen und akzeptiert.                                    &nbsp;
                                </div>
                            </div>

                            <div class="payment float-right clearfix">
                                <input type="submit" class="checkout-submit"
                                data-loading-text="Loading..." id="place-order-button" 
                                value="{{ __('front.place-order') }}">
                                <input type="hidden" name="stripeToken" id="stripeToken">
                                <input type="hidden" name="stripeEmail" id="stripeEmail">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
    @endif
</div>
</main>
@endsection
@push('scripts')
<script>
    $(function () {
        function calcualateTotal() {
            subTotal = parseFloat(jQuery('.sub-total').attr('data-sub-total')).toFixed(2);
            shippingCost = parseFloat(jQuery('.shipping-cost').attr('data-shipping-cost')).toFixed(2);
            taxAmount = parseFloat(jQuery('.tax-amount').attr('data-tax-amount')).toFixed(2);

            total = parseFloat(subTotal) + parseFloat(taxAmount) + parseFloat(shippingCost);
            jQuery('.total').attr('data-total', total.toFixed(2));
            jQuery('.total').html("$" + total.toFixed(2));
        }


        function checkIfUserExist(data) {
            $.post({
                url : "/check-user-exists",
                data : data,
                type: 'json',
                success:function(res) {
                    console.info(res);
                }
            });
        }

        jQuery(document).on('change','#input-user-email',function(e) {
            var data = {
                'email': jQuery(this).val(),
                '_token': '{{ csrf_token()  }}'
            };

            checkIfUserExist(data);

        });

            /**
             jQu`ry('.tax-calculation').change(function () {
            var data = {
                'name': jQuery(this).attr('data-name'),
                'value': jQuery(this).val(),
                '_token': '{{ csrf_token()  }}'
            };

            $.post({
                data: data,
                type: 'json',
                url: '#',
                success: function (res) {
                    if ((res.success == true)) {
                        jQuery('.tax-amount').html(res.tax_amount_text);
                        jQuery('.tax-amount').attr('data-tax-amount', res.tax_amount);
                        calcualateTotal();
                    }
                }
            });
        });
        */
        jQuery('.shipping_option_radio').change(function (e) {

            if (jQuery(this).is(':checked')) {
                var shippingTitle = jQuery(this).attr('data-title');
                var shippingCost = jQuery(this).attr('data-cost');

                jQuery('.shipping-row').removeClass('hidden');

                jQuery('.shipping-row .shipping-title').html(shippingTitle + ":");
                jQuery('.shipping-row .shipping-cost').html("$" + shippingCost);
                jQuery('.shipping-row .shipping-cost').attr('data-shipping-cost', shippingCost);


            } else {
                jQuery('.shipping-row').addClass('hidden');
            }
            calcualateTotal();
        });

        jQuery('#place-order-button').click(function (e) {
            jQuery('#place-order-form').submit();
        });
    });
</script>
@endpush

@section('scripts')
<script src="https://checkout.stripe.com/checkout.js"></script>
<script>
    let stripe = StripeCheckout.configure({
        key: '{{ config('stripe.publishable_key') }}',
        image: 'https://stripe.com/img/documentation/checkout/marketplace.png',
        locale: 'auto',
        token: function (token) {
            var stripeEmail = $('#stripeEmail');
            var stripeToken = $('#stripeToken');
            stripeEmail.val(token.email);
            stripeToken.val(token.id);
            // submit the form
            var url = '{{ route('order.place') }}';
            var token = $('input[name="_token"]').val();
            var form = $('#place-order-form');
            var data = form.serialize();
            // fire ajax post request
            $.post(url, data)
            .done(function (data) {
                window.location.href = getUrl();
            })
            .fail(function(data, textStatus) {
                var errors = data.responseJSON.errors;
                console.log(errors);
                if (!jQuery.isEmptyObject(errors)) {
                    $('ul.billing_errors').remove();
                    $('ul.shipping_errors').remove();
                    var billingErrors = $('<ul></ul>', {
                        class: 'billing_errors'
                    }).insertBefore('.billing-address-wrapper');
                    var shippingErrors = $('<ul></ul>', {
                        class: 'shipping_errors'
                    }).insertBefore('.shipping-address-wrapper');
                        // error.replace(key, $('input[name="' + mainFieldName + '[' + secondaryFieldName + ']]"').siblings('label').text())
                        for (var key in errors) {
                            var error = errors[key][0];
                            if (errors[key][0].indexOf('billing') >= 0) {
                                billingErrors.addClass('alert').addClass('alert-danger');
                                $('<li></li>', {
                                    text: error.replace('billing', '')
                                }).appendTo(billingErrors);
                            } 
                            if(errors[key][0].indexOf('shipping') >= 0) {
                                shippingErrors.addClass('alert').addClass('alert-danger');
                                $('<li></li>', {
                                    text: error.replace('shipping', '')
                                }).appendTo(shippingErrors);
                            }
                        }
                    }
                });
        }
    });
    $('#place-order-form').on('submit', function (e) {
        stripe.open({
            name: 'Centrocaffe',
            description: 'Billing',
        });
        e.preventDefault();
    });
</script>

<script>
    $(function () {
        // toggle show shipping address
        $('input#use_different_shipping_address').on('click', function () {
            $('#different-shipping-form').toggle();
        });
    });
</script>

<script>
    function checkCompany() {
        var check = document.getElementById('is_company');
        var action = document.getElementById('check_company');
        var input = document.getElementById('company_name');
        var value = check.options[check.selectedIndex].value;

        if (value == 1) {
            action.style.display = 'block';
            input.setAttribute('required', '');

        } else {
            action.style.display = 'none';
            input.removeAttribute('required');
        }
    }
</script>
@stop