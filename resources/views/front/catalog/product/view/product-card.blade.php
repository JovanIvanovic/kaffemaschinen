<div class="prod-i">
    <div class="prod-i-top">
        <a href="{{ route('product.view', $product->slug)}}" title="{{ $product->name }}" class="prod-i-img">
            @include('front.catalog.product.view.product-image',['product' => $product])
        </a>
        <div class="prod-sticker">
            @if($product->hit_product == 1)
                <div class="item-hit-badge"><i class="fa fa-star"></i> hit</div>
            @endif
            @if($product->new_product == 1)
                <div class="item-new-badge">new</div>
            @endif

        </div>
    </div>
    <h3>
        <a href="{{ route('product.view', $product->slug)}}" title="{{ $product->name }}">{{ $product->name }}</a>
    </h3>
    @if ($product->contact_only == 1)
        <a class="prod-add" href="{{ route('contact') }}">
            Contact us
        </a>
    @else
    @if($product->qty < 1 || $product->in_stock == 0)
        <p class="prod-i-price">
            <b>{{ __('front.sold-out') }}</b>
        </p>
    @else
        @if($product->discount == 1)
            <p class="prod-i-price">
                <b>CHF {{ number_format($product->discount_price, 2) }}</b><br>
                <del>CHF {{ number_format($product->price,2) }}</del>
                @if($product->discount == 1)
                    <span class="price-off">-{{ number_format(100-($product->discount_price/$product->price*100), 0) }}%</span>
                @endif
            </p>
        @else
            <p class="prod-i-price">
                <b>CHF {{ number_format($product->price,2) }}</b>
                @if($product->discount == 1)
                    <span class="price-off">-{{ number_format(100-($product->discount_price/$product->price*100), 0) }}%</span>
                @endif
            </p>
        @endif
    @endif
        @endif
</div>

@push('scripts')
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>
@endpush