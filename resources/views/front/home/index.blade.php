<?php $menu_home = 'active'; ?>

@extends('front.layouts.app')

@section('meta_title','Home Page')
@section('meta_description','Home Page')

@section('content')
<!-- Main Content - start -->
<main>
    <section class="container" id="pozadina" style="margin-top: 50px;">
        <!-- Slider -->
        <div class="fr-slider-wrap">
            <div class="fr-slider">
                <ul class="slides">
                    <li>
                        <img src="front/assets/img/slider/slide1.jpg" alt="">
                    </li>

                </ul>
            </div>
        </div>
        <!-- Catalog Sidebar - start -->
        <h1 class="main-ttl"><span>Kategorie</span></h1>
        <div class="section-sb">
            @include('front.catalog.category.options')
        </div>
            <!-- Catalog Categories - end -->
        <div class="section-cont">


            <!-- Catalog Topbar - end -->
            <div class="prod-items section-items">
                @php($num = 1)
                @php($count = count($hitAndNewProducts))
                @foreach($hitAndNewProducts as $product)
                    <?php
                    $image = $product->image;
                    $imageType = (isset($imageType)) ? $imageType : "medUrl";
                    ?>
                    <div class="prod-i">
                        <div class="prod-i-top">
                            <a href="{{ route('product.view', $product->slug)}}" class="prod-i-img"><img src="{{ $image->$imageType }}"></a>
                            <div class="prod-sticker">
                                @if($product->new_product == 1)
                                    <div class="item-new-badge">new</div>
                                @endif
                                @if($product->hit_product == 1)
                                <div class="item-hit-badge"><i class="fa fa-star"></i> hit</div>
                                @endif
                            </div>
                        </div>
                        <h3>
                            <a href="{{ route('product.view', $product->slug)}}" title="{{ $product->name }}">{{ $product->name }}</a>
                        </h3>
                        <p class="prod-i-price">
                            @if($product->discount == 1)
                                <b>CHF {{ number_format($product->discount_price, 2) }}</b><br>
                                <del>CHF {{ number_format($product->price,2) }}</del>
                            @php($priceOff = 100-($product->discount_price*100)/$product->price)
                                <span style="color: red">-{{ number_format($priceOff,0) }}%</span>
                            @else
                                <b>CHF {{ number_format($product->price,2) }}</b><br>
                                <del></del>
                                <span></span>
                            @endif
                        </p>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
</main>
@endsection

@section('popup')
    <?php

    if(session()->has('check')){

    }else {
        ?>
    @if ($popup != null)
        <?php
            if (strtotime($popup->end_date) < strtotime('now')) {
                $popup->active = 0;
                $popup->update();
                //shutdowns pop-up

//                unset($_COOKIE['popup_'.$popup->id]);
//                setcookie('popup_'.$popup->id, null, -1, '/');
            } elseif($popup->active == 1) {
                ?>
            <div class="modal fade index_popup" id="myModal">
            <div class="modal-dialog modal-lg index_popup_dialog">
                <div class="modal-header index_popup_header">
                    <a class="close modal_close" data-dismiss="modal">×</a>
                    <h3 class="main-ttl-popup" style="margin-bottom:0;">
                        <span>{{ $popup->title }}</span>
                    </h3>
                </div>
                <div class="modal-body index_popup_body">
                    <div class="popup_desc">{!! $popup->package->description !!}</div>
                    <div class="popup_cover" style="background-image: url('{{ asset($popup->image) }}');">
                        <div class="popup_cover_container">
                            <div class="owl-carousel owl-theme">
                                <?php
                                $count = count($popup->package->products);
                                $i = 0;
                                ?>
                                @foreach ($popup->package->products as $product)
                                    <?php $i++; ?>
                                    <div class="item {{ $i == $count ? '' : 'plus_item' }}">
                                        <a href="{{ route('product.view', $product->slug) }}">
                                                    <span class="carousel_img" style="background-image: url('{{ asset($product->image->medUrl) }}')">
                                                        <span class="carousel_price">CHF {{ number_format($product->price, 2) }}</span>
                                                    </span>
                                        </a>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <p class="f-left">Angebot gültig bis - {{ $popup->end_date->format('d/m/Y') }}</p>
                    <form class="f-right" action="{{ route('cart.add-to-cart') }}" method="POST">
                        {{ csrf_field() }}

                        <input type="hidden" name="id" value="{{ $popup->package->id }}"/>
                        <input type="hidden" name="type" value="package"/>

                        <button type="submit" class="popup_cart_add">In den warenkorb</button>
                    </form>

                    <p class="prod-i-price f-right" style="margin-right: 15px; display: inline-block; text-align: center;">
                        <del>CHF {{ number_format($popup->package->total_price, 2) }}</del>

                        <span style="color: red">{{ $popup->package->percentage_sign }}{{ $popup->package->percentage }}%</span><br>
                        <span style="font-size:20px; color: red;">CHF {{ number_format($popup->package->price, 2) }}</span>
                    </p>
                    <div class="total_price f-right" style="display: inline-block; margin-right: 15px; ">
                        <h1 style="line-height:42px; font-size: 25px; text-transform: uppercase">Total:</h1>
                    </div>
                </div>

            </div>
        </div>
            <?php
            session(['check' => '1']);
                }

//            $popupCookie = true;
//            if (isset($_COOKIE['popup_'.$popup->id])) {
//                if ($_COOKIE['popup_'.$popup->id] == 'seen') {
//                    $popupCookie = false;
//                }
//            }
        ?>

    @endif
    <?php
    }
    ?>
    <!--TOP ANGEBOTE-->
    @if ($popup != null)
        <?php
        if (strtotime($popup->end_date) < strtotime('now')):

            $popup->active = 0;
            $popup->update();
            //shutdowns pop-up

//                unset($_COOKIE['popup_'.$popup->id]);
//                setcookie('popup_'.$popup->id, null, -1, '/');
        elseif($popup->active == 1):
        ?>
            <div class="modal fade index_popup" id="modal_button">
        <div class="modal-dialog modal-lg index_popup_dialog">
            <div class="modal-header index_popup_header">
                <a class="close modal_close" data-dismiss="modal">×</a>
                <h3 class="main-ttl-popup" style="margin-bottom:0;">
                    <span>{{ $popup->title }}</span>
                </h3>
            </div>
            <div class="modal-body index_popup_body">
                <div class="popup_desc">{!! $popup->package->description !!}</div>
                <div class="popup_cover" style="background-image: url('{{ asset($popup->image) }}');">
                    <div class="popup_cover_container">
                        <div class="owl-carousel owl-theme">
                            <?php
                            $count = count($popup->package->products);
                            $i = 0;
                            ?>
                            @foreach ($popup->package->products as $product)
                                <?php $i++; ?>
                                <div class="item {{ $i == $count ? '' : 'plus_item' }}">
                                    <a href="{{ route('product.view', $product->slug) }}">
                                                    <span class="carousel_img" style="background-image: url('{{ asset($product->image->medUrl) }}')">
                                                        <span class="carousel_price">CHF {{ number_format($product->price, 2) }}</span>
                                                    </span>
                                    </a>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <p class="f-left">Angebot gültig bis - {{ $popup->end_date->format('d/m/Y') }}</p>
                <form class="f-right" action="{{ route('cart.add-to-cart') }}" method="POST">
                    {{ csrf_field() }}

                    <input type="hidden" name="id" value="{{ $popup->package->id }}"/>
                    <input type="hidden" name="type" value="package"/>

                    <button type="submit" class="popup_cart_add">In den warenkorb</button>
                </form>

                <p class="prod-i-price f-right" style="margin-right: 15px; display: inline-block; text-align: center;">
                    <del>CHF {{ number_format($popup->package->total_price, 2) }}</del>

                    <span style="color: red">{{ $popup->package->percentage_sign }}{{ $popup->package->percentage }}%</span><br>
                    <span style="font-size:20px; color: red;">CHF {{ number_format($popup->package->price, 2) }}</span>
                </p>
                <div class="total_price f-right" style="display: inline-block; margin-right: 15px; ">
                    <h1 style="line-height:42px; font-size: 25px; text-transform: uppercase">Total:</h1>
                </div>
            </div>

        </div>
    </div>
        <?php
        endif;
        ?>

    @endif
@endsection

@section('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.6/sweetalert2.all.min.js"></script>
<script>
    @if(Session::has('order_made'))
    swal({
        title: '{{ __('front.all_done') }}',
        confirmButtonText: 'OK',
        type: 'success',
        text: '{{ Session::get('order_made') }}'
    });
    @endif
</script>
@stop