
<!-- Catalog menu - start -->
<div class="topcatalog">
    <a href="{{ route('all.category.view') }}" class="topcatalog-btn">Shop</a>
    <ul class="topcatalog-list">
        @include('front.layouts.category-tree', ['categories', $categories])
    </ul>
</div>
<!-- Catalog menu - end -->

<!-- Main menu - start -->
<button type="button" class="mainmenu-btn" style="width: 50%;">Menu</button>

<ul class="mainmenu">
    <li>
        <a href="{{ route('home') }}" class="{{ $menu_home or ''  }}">
            Home
        </a>
    <li>
        <a href="{{ route('about-us') }}" class="{{ $menu_about_us or ''  }}">
            Über uns
        </a>
    <li>
        <a href="{{ route('wir-kaufen') }}" class="{{ $menu_wir or ''  }}">
            Wir Kaufen
        </a>
    <li class="no-border">

        <a href="{{ route('contact') }}" class="{{ $menu_contact or ''  }}">
            Kontakt
        </a>
</ul>
<!-- Main menu - end -->