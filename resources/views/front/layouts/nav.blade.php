
<!-- Main menu - start -->
<button type="button" class="mainmenu-btn">Menu</button>

<ul class="mainmenu">
    <li>
        <a href="{{ route('home') }}" class="{{ $menu_home or ''  }}">
            Home
        </a>
    </li>
    <li>
        <a href="{{ URL::to('category?slug=lavazza') }}">
            Lavazza
        </a>
    </li>
    <li>
        <a href="{{ URL::to('category?slug=borbone') }}">
            Borbone
        </a>
    </li>
    <li>
        <a href="{{ URL::to('category?slug=gastro')  }}">
            Gastro
        </a>
    </li>

    <li>
        <a href="{{ URL::to('category?slug=kaffebohnen')  }}">
            Kaffebohnen
        </a>
    </li>
    <li>
        <a href="{{ URL::to('category?slug=zubehör') }}">
            Zubehör
        </a>
    </li>
</ul>
<!-- Main menu - end -->