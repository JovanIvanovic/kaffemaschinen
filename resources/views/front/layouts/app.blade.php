<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('meta_title', $metaTitle)</title>
    <meta name="description" content="@yield('meta_description', $metaDescription)"/>

    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css' />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link href="https://fonts.googleapis.com/css?family=PT+Serif:400,400i,700,700ii%7CRoboto:300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('front/assets/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.6/sweetalert2.min.css">
    <link rel="stylesheet" href="{{ asset('front/assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('front/assets/css/ion.rangeSlider.css') }}">
    <link rel="stylesheet" href="{{ asset('front/assets/css/ion.rangeSlider.skinFlat.css') }}">
    <link rel="stylesheet" href="{{ asset('front/assets/css/jquery.bxslider.css') }}">
    <link rel="stylesheet" href="{{ asset('front/assets/css/jquery.fancybox.css') }}">
    <link rel="stylesheet" href="{{ asset('front/assets/css/flexslider.css') }}">
    <link rel="stylesheet" href="{{ asset('front/assets/css/swiper.css') }}">
    <link rel="stylesheet" href="{{ asset('front/assets/css/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ asset('front/assets/css/owl.theme.default.min.css') }}">
    <link rel="stylesheet" href="{{ asset('front/assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('front/assets/css/media.css') }}">
    @yield('styles')

</head>
<body>
<!-- Header - start -->
<header class="{{ (isset($header)) ? "header-index" : "header" }}">
    <!-- Logo, Shop-menu - start -->
    <div class="header_top">
        <div class="container">
            {{--<div class="toplogo topLogo_scroller">--}}
                {{--<a href="{{ route('home') }}">--}}
                    {{--<img src="\front/assets/img/logo.png"/>--}}
                {{--</a>--}}
            {{--</div>--}}
            <!-- Search - start -->
            <div class="topsearch">
                <form class="topsearch-form" action="{{ route('all.category.view') }}" method="get" role="search">
                    <input name="q" type="text" placeholder="Suche...">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>


                <ul class="topsearch_auth">
                    @if(Auth::check())
                        <?php
                        $user = auth()->user();
                        $name = $user->first_name;
                        ?>
                        <li class="topauth">
                            <a href="{{ route('my-account.home') }}">
                                <span class="shop-menu-ttl">{{ $name }}</span>
                            </a>
                            <span style="color: #fff;"> / </span>
                            <a href="{{ route('logout') }}">
                                <span class="shop-menu-ttl">Logout</span>
                            </a>
                        </li>
                    @else
                        <li class="topauth">
                            <a href="{{ route('register') }}">
                                <i class="fa fa-lock"></i>
                                <span class="shop-menu-ttl">Registrierung</span>
                            </a>
                            <span style="color: #fff">/</span>
                            <a href="{{ route('login') }}">
                                <span class="shop-menu-ttl">Login</span>
                            </a>
                        </li>
                    @endif
                    <li>
                        <div class="h-cart">
                            <a href="{{ route('cart.view') }}">
                                <i class="fa fa-shopping-cart"></i>
                                <span class="shop-menu-ttl">Warenkorb</span>
                                ({{$cart}})
                            </a>
                        </div>
                    </li>
                    <li class="header_media">
                        <a href="https://www.facebook.com/"><i class="fa fa-facebook" aria-hidden="true"></i>Facebook</a>
                    </li>
                </ul>
        </div>
    </div>


    {{--<div class="header-middle">--}}
        {{--<div class="container header-middle-cont">--}}
            {{--<div class="toplogo">--}}
                {{--<a href="{{ route('home') }}">--}}
                    {{--<img src="/front/assets/img/logo.png">--}}
                {{--</a>--}}
            {{--</div>--}}

            {{--<div class="shop-menu-search">--}}
                {{--<form action="{{ route('all.category.view') }}" method="get" role="search">--}}
                    {{--<input class="menu-search-input" name="q" type="text" placeholder="Search products">--}}
                    {{--<button class="menu-search-button" type="submit"><i class="fa fa-search"></i></button>--}}
                {{--</form>--}}
            {{--</div>--}}

            {{--<div class="shop-menu">--}}
                {{--<ul>--}}
                    {{--@if(Auth::check())--}}
                        {{--<li id="thumbnail_photo">--}}
                            {{--<a href="{{ route('my-account.home') }}">--}}
                                {{--<img src="{{ $image }}" style="border-radius: 50%; width: 40px; height: 40px">--}}
                            {{--</a>--}}
                        {{--</li>--}}
                        {{--<li class="topauth">--}}
                            {{--<a href="{{ route('my-account.home') }}">--}}
                               {{--<span class="shop-menu-ttl">{{ $name }}</span>--}}
                            {{--</a>--}}
                            {{--<a href="{{ route('logout') }}">--}}
                                {{--<span class="shop-menu-ttl">Logout</span>--}}
                            {{--</a>--}}
                        {{--</li>--}}
                    {{--@else--}}
                        {{--<li class="topauth">--}}
                            {{--<a href="{{ route('register') }}">--}}
                                {{--<i class="fa fa-lock"></i>--}}
                                {{--<span class="shop-menu-ttl">Registrierung</span>--}}
                            {{--</a>--}}
                            {{--<a href="{{ route('login') }}">--}}
                                {{--<span class="shop-menu-ttl">Login</span>--}}
                            {{--</a>--}}
                        {{--</li>--}}
                    {{--@endif--}}
                    {{--<li>--}}
                        {{--<div class="h-cart">--}}
                            {{--<a href="{{ route('cart.view') }}">--}}
                                {{--<i class="fa fa-shopping-cart"></i>--}}
                                {{--<span class="shop-menu-ttl">Warenkorb</span>--}}
                                {{--({{$cart}})--}}
                            {{--</a>--}}
                        {{--</div>--}}
                    {{--</li>--}}

                {{--</ul>--}}
            {{--</div>--}}
        {{--</div>--}}
    {{--</div>--}}
    <!-- Logo, Shop-menu - end -->

    <!-- Topmenu - start -->
    <div class="header-bottom">
        <div class="container">
            <nav class="topmenu">

                <!-- Nav - start -->
                @include("front.layouts.nav")
                <!-- Nav - end -->

            </nav>
        </div>
    </div>
</header>
    <!-- Topmenu - end -->

<!-- Notification text - start -->
@if(session()->has('notificationText') || session()->has('notificationError') || $errors->any())
<?php $id = (isset($header)) ? "id = container-home" : ""  ?>
<div {{ $id }} class="container">
    <div class="row">
        <div class="col-lg-12 col-lg-offset-0 text-center">
            @if(session()->has('notificationText'))
                <div class="alert alert-success alert-dismissible" role="alert">
                    {{ session()->get('notificationText') }}
                </div>
            @endif
            @if(session()->has('notificationError'))
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <strong>Warrning!</strong> {{ session()->get('notificationError') }}
                </div>
            @endif
            @if ($errors->any())
                <br>
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
        </div>
    </div>
</div>
@endif
<!-- Notification text - end -->

<!-- Main Content - start -->
@yield('content')
<!-- Main Content - end -->

<!-- Footer - start -->
@include('front.layouts.footer')
<!-- Footer - end -->

<!-- Popup - start -->
@yield('popup')
<!-- Popup - end -->

<!-- jQuery plugins/scripts - start -->
<script src="{{ asset('front/assets/js/jquery-1.11.2.min.js') }}"></script>
<script src="{{ asset('front/assets/js/owl.carousel.min.js') }}"></script>
<script src="{{ asset('front/assets/js/jquery.bxslider.min.js') }}"></script>
<script src="{{ asset('front/assets/js/fancybox/fancybox.js') }}"></script>
<script src="{{ asset('front/assets/js/jquery.flexslider-min.js') }}"></script>
<script src="{{ asset('front/assets/js/swiper.jquery.min.js') }}"></script>
<script src="{{ asset('front/assets/js/jquery.waypoints.min.js') }}"></script>
<script src="{{ asset('front/assets/js/progressbar.min.js') }}"></script>
<script src="{{ asset('front/assets/js/ion.rangeSlider.min.js') }}"></script>
<script src="{{ asset('front/assets/js/chosen.jquery.min.js') }}"></script>
<script src="{{ asset('front/assets/js/jQuery.Brazzers-Carousel.js') }}"></script>
<script src="{{ asset('front/assets/js/plugins.js') }}"></script>
<script src="{{ asset('front/assets/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('front/assets/js/main.js') }}"></script>
<script src="{{ asset('front/assets/js/functions.js?=ver' . str_random(10)) }}"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDhAYvx0GmLyN5hlf6Uv_e9pPvUT3YpozE"></script>

@yield('scripts')
<!-- jQuery plugins/scripts - end -->

</body>
</html>