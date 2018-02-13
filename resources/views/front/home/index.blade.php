<?php $menu_home = 'active'; ?>

@extends('front.layouts.app')

@section('meta_title','Home Page')
@section('meta_description','Home Page')

@section('content')
<!-- Main Content - start -->
<main>
    <section class="container-fluid index-slide">
        <!-- Slider -->
        <div class="fr-slider-wrap">
            <div class="fr-slider">
                <ul class="slides">
                    @foreach($sliders as $slider)
                    <li>
                        <img height="480" src="{{ $slider->image }}" alt="">
                        <div class="fr-slider-cont">
                            <h3 style="color: {{ $slider->color }}">{{ $slider->heading }}</h3>
                            <div style="color: {{ $slider->color }}">
                                {!! $slider->body !!}
                            </div>
                            <p class="fr-slider-more-wrap">
                                <a class="fr-slider-more" href="{{ $slider->url }}" style="background-color: {{ $slider->color }}; color: {{ getForegroundColor($slider->color) }};">{{ $slider->button }}</a>
                            </p>
                        </div>
                    </li>
                    @endforeach
                </ul>
            </div>
        </div>
    </section>
    <section class="container">
        <!-- Popular Products -->
        <div class="fr-pop-wrap">
            <h3 class="component-ttl component-ttl-ct component-ttl-hasdesc"><span>Top Angebote</span></h3>
            <div class="fr-pop-tab-cont">
                <div class="flexslider prod-items fr-pop-tab" id="frpoptab-tab-4">
                    <ul class="slides">
                        @php($num = 1)
                        @php($count = count($hitAndNewProducts))
                        @foreach($hitAndNewProducts as $product)
                            <?php
                            $image = $product->image;
                            $imageType = (isset($imageType)) ? $imageType : "medUrl"
                            ?>
                            @if($num % 2 != 0)
                                <li class="prod-i">
                            @endif
                                <div class="prod-i-top">
                                    <a href="{{ route('product.view', $product->slug)}}" class="prod-i-img"><img src="{{ $image->$imageType }}"></a>
                                    <div class="prod-sticker">
                                        @if($product->new_product == 1)
                                            <div class="item-new-badge">new</div>
                                        @endif
                                        @if($product->hit_product == 1)
                                            <div class="item-hit-badge-index"><i class="fa fa-star"></i>hit</div>
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
                                        <span class="price-off">{{ number_format($priceOff,0) }}% OFF</span>
                                    @else
                                        <b>CHF {{ number_format($product->price,2) }}</b><br>
                                        <del></del>
                                        <span class="price-off"></span>
                                    @endif
                                </p>
                            @if($num % 2 == 0 || $num == $count)
                                </li>
                            @endif
                            @php($num = $num + 1)
                        @endforeach
                    </ul>
                </div>
            </div>
        </div><!-- .fr-pop-tab-cont -->
    </div><!-- .fr-pop-wrap -->
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