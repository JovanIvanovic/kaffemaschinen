
<!-- Main menu - start -->
<button type="button" class="mainmenu-btn">Menu</button>

<ul class="mainmenu">
    <li>
        <a href="{{ route('home') }}" class="{{ $menu_home or ''  }}">
            Home
        </a>
    </li>
    <li>
        <a href="{{ route('category.view', 'lavazza') }}">
            Lavazza
        </a>
    </li>
    <li>
        <a href="{{ route('category.view', 'borbone') }}">
            Borbone
        </a>
    </li>
    <li>

        <a href="{{ route('category.view', 'gastro')  }}">
            Gastro
        </a>
    </li>

    <li>
        <a href="{{ route('category.view', 'kaffeebohnen')  }}">
            Kaffeebohnen
        </a>
    </li>
    <li>

        <a href="{{ route('category.view', 'zubehör') }}">
            Zubehör
        </a>
    </li>
</ul>
<!-- Main menu - end -->