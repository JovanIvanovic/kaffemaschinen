
<!-- Main menu - start -->
<button type="button" class="mainmenu-btn">Menu</button>

<ul class="mainmenu">
    <li>
        <a href="{{ route('home') }}" class="{{ $menu_home or ''  }}">
            Home
        </a>
    </li>
    <li>
        <a href="{{ route('category.view', 'lavazza') }}" class="{{ $menu_about_us or ''  }}">
            Lavazza
        </a>
    </li>
    <li>
        <a href="{{ route('category.view', 'borbone') }}" class="{{ $menu_wir or ''  }}">
            Borbone
        </a>
    </li>
    <li>

        <a href="{{ route('category.view', 'gastro')  }}" class="{{ $menu_contact or ''  }}">
            Gastro
        </a>
    </li>
    <li>

        <a href="{{ route('category.view', 'zubehör') }}" class="{{ $menu_contact or ''  }}">
            Zubehör
        </a>
    </li>
</ul>
<!-- Main menu - end -->