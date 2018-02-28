@extends('front.layouts.app') @section('meta_title') {{ $product->name }} - Schoengebraucht @endsection @section('content')
<!-- Main Content - start -->
<main>
    <section class="container" style="padding-top: 50px;" id="pozadina">
        <ul class="b-crumbs">
            <li>
                <a href="{{ route('home') }}">
                    Home
                </a>
            </li>
            <li>
                <a href="{{ route('all.category.view') }}">
                    Catalog
                </a>
            </li>
        </ul>

        <!-- Single Product - start -->
        <div class="prod-wrap">

            <!-- Product Images -->
            <div class="prod-slider-wrap">
                <div class="prod-slider">
                    <ul class="prod-slider-car">
                        @foreach($images as $image)
                        <li>
                            <a data-fancybox-group="product" class="fancy-img" href="{{ $image->path->url }}">
                                    <img src="{{ $image->path->medUrl }}" alt="" class="{{ $image->filters }}">
                                </a>
                        </li>
                        @endforeach
                    </ul>
                </div>
                <div class="prod-thumbs">
                    <ul class="prod-thumbs-car">
                        @foreach($images as $key => $image)
                        <li>
                            <a data-slide-index="{{ $key }}" href="#">
                                    <img src="{{ $image->path->url }}" alt="" class="{{ $image->filters }}">
                                </a>
                        </li>
                        @endforeach
                    </ul>
                </div>
            </div>

            <!-- Product Description/Info -->

            <h1 class="main-ttl"><span>{{ $product->name }}</span></h1>
            <div class="prod-cont">

                <h4 style="color: #de5421;">Artikel Nr. {{ $product->product_no }}</h4>

                <br>
                <div class="prod-cont-txt">
                    {!! $product->description !!}
                </div>


                @if ($product->has_packaging == true)
                <div class="prod-info">
                    {{ __('front.packaging') }} : &nbsp;{{ $product->packaging }}
                </div>
                @endif
                @if ($product->contact_only == 1)
                <a class="prod-add" href="{{ route('contact') }}">
                    {{ __('front.contact-us-button') }}
                </a>
                @else
                    @if($product->qty < 1)
                    <div class="prod-info text-center" style="font-size: 30px; color: #de5421;">
                        {{ __('front.sold-out') }}
                    </div>
                    @else

                    <div class="prod-info">
                        <p class="prod-price">
                            @if($product->discount == 1)
                            <span class="prodlist-i-price">
                                    <b>CHF {{ number_format($product->discount_price, 2) }}</b><br>
                                    <span style="text-decoration:line-through">CHF {{ number_format($product->price,2) }}</span><span class="price-off">-{{ number_format(100-($product->discount_price/$product->price*100), 0) }}%</span><br>
                            </span>
                            @else
                            <b>CHF {{ number_format($product->price,2) }}</b><br>
                            <del></del> @endif inkl. MwSt 7,7%
                        </p>

                        <form method="post" action="{{ route('cart.add-to-cart') }}">
                            {{ csrf_field() }}
                            <input type="hidden" name="id" value="{{ $product->id }}" />
                            <input type="hidden" name="type" value="product" />
                            <p class="prod-qnt">
                                <input id="prodQnt" class="prod-qty" name="qty" value="1" type="text" data-max="{{ $product->qty }}">
                                <a id="prodPlus" class="prod-plus"><i class="fa fa-angle-up"></i></a>
                                <a id="prodMinus" class="prod-minus"><i class="fa fa-angle-down"></i></a>
                            </p>
                            <p class="prod-addwrap">
                                <button type="submit" class="prod-add" href="{{ route('cart.add-to-cart', $product->id) }}">
                                    In den Warenkorb
                                </button>
                            </p>
                        </form>
                    </div>
                    @endif @endif {{--

                    <div class="row">--}} {{--
                        <div class="col-xs-6" id="prodart"><a class="qview-btn prod-i-qview" data-toggle="modal" data-target="#exampleModal" style="color: dodgerblue; cursor: pointer"><span>Frage Zum Artikel</span></a></div>--}} {{--
                        <div class="col-xs-6" id="prodart"><a href="mailto:?Subject=Schoengebraucht&amp;Body={{ Request::url() }}" style="color: dodgerblue; cursor: pointer">Artikel weiterempfehlen</a></div>--}} {{--
                    </div>--}}
                    <!-- Share Links -->

                    <div class="post-share-wrap">
                        <ul class="post-share">
                            <li>
                                <a href="http://www.facebook.com/sharer.php?u={{ Request::url() }}" target="_blank" title="Share on Facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                            </li>
                            <li>
                                <a href="http://www.instagram.com/shareArticle?mini=true&amp;url={{ Request::url() }}" target="_blank">
                                <i class="fa fa-instagram"></i>
                            </a>
                            </li>
                        </ul>
                    </div>
            </div>



        </div>
        <!-- Single Product - end -->

        <!-- Modal -->
        <div class="modal fade frage_modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content" style="border-radius: 0;">
                    <div class="modal-header frage_modal_header">
                        <h5 class="modal-title fat" id="exampleModalLabel"><span>Frage Zum Artikel</span>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
            </button>
                        </h5>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="{{ route('product.mail') }}">
                            <div class="auth-col" style="width: auto;">
                                {{ csrf_field() }}
                                <p>
                                    <input class="frage_modal_input" placeholder="Name" name="name" type="text" id="firstname">
                                </p>

                                <p>
                                    <input class="frage_modal_input" placeholder="Email" name="email" type="email" id="email">
                                </p>

                                <p>
                                    <textarea class="frage_modal_textarea" placeholder="Ihre Frage" name="mess"></textarea>
                                </p>

                                <input type="hidden" name="url" value="{{ Request::url() }}">

                                <p class="auth-submit frage_auth_submit">
                                    <input id="sende" type="submit" value="Senden">
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick View Product - start -->
        {{--
        <div class="qview-modal">--}} {{--
            <div class="prod-wrap">--}} {{--

                <!-- Contact Form -->--}} {{--

                <div class="auth-wrap">--}} {{--
                    <h3 class="fat">Frage Zum Artikel</h3>--}} {{--

                </div>--}} {{--
            </div>--}} {{--
        </div>--}}
        <!-- Quick View Product - end -->

    </section>
</main>
<!-- Main Content - end -->

@endsection @section('scripts')
<script>
    $('.prod-qty').on('change', function() {
        var $this = $(this);
        var max = parseInt($this.data('max'));

        if ($this.val() > max) {
            $this.val(max);
        }
    });

    $('.prod-plus').click(function() {
        var $this = $(this);
        var $qnt = $('.prod-qty', $this.parent());
        var value = parseInt($qnt.val());

        var max = parseInt($qnt.data('max'));

        if (value < 0)
            value = 0;
        if (value < max)
            value += 1;
        $qnt.val(value);
    });
    $('.prod-minus').click(function() {
        var $this = $(this);
        var $qnt = $('.prod-qty', $this.parent());
        var value = parseInt($qnt.val());
        if (value > 0)
            value -= 1;
        if (value < 0)
            value = 0;
        $qnt.val(value);
    });
</script>
@endsection