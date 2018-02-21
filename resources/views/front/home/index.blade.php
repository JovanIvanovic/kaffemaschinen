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