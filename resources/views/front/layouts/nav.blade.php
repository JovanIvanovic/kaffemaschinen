
<!-- Catalog menu - start -->
{{--<div class="topcatalog">--}}
    {{--<a href="{{ route('all.category.view') }}" class="topcatalog-btn">Shop</a>--}}
    {{--<ul class="topcatalog-list">--}}
        {{--@include('front.layouts.category-tree', ['categories', $categories])--}}
    {{--</ul>--}}
{{--</div>--}}
<!-- Catalog menu - end -->

<!-- Main menu - start -->
<button type="button" class="mainmenu-btn" style="width: 50%;">Menu</button>

<ul class="mainmenu">
    <li>
        <a href="{{ route('home') }}" class="{{ $menu_home or ''  }}">
            Home
        </a>
    </li>
    <li>
        <a href="{{ route('lavazza') }}" class="{{ $menu_home or ''  }}">
            Lavazza
        </a>
    </li>
    <li>
        <a href="{{ route('borbone') }}" class="{{ $menu_home or ''  }}">
            Borbone
        </a>
    </li>
    <li>
        <a href="{{ route('gastro') }}" class="{{ $menu_home or ''  }}">
            Gastro
        </a>
    </li>
    <li>
        <a href="{{ route('kaffeebohnen') }}" class="{{ $menu_home or ''  }}">
            Kaffeebohnen
        </a>
    </li>
    <li>
        <a href="{{ route('zubehör') }}" class="{{ $menu_home or ''  }}">
            Zubehör
        </a>
    </li>
</ul>
<!-- Main menu - end -->