
<!-- Main menu - start -->
<button type="button" class="mainmenu-btn">Menu</button>

<ul class="mainmenu">
    <li>
        <a href="{{ route('home') }}" class="{{ $menu_home or ''  }}">
            Home
        </a>
    </li>
    <li>
        <a href="{{ URL::to('category?slug=lavazza') }}" class="{{ $__env->yieldContent('nav_active_category') == 'lavazza' ? 'active' : '' }}">
            Lavazza
        </a>
    </li>
    <li>
        <a href="{{ URL::to('category?slug=borbone') }}" class="{{ $__env->yieldContent('nav_active_category') == 'borbone' ? 'active' : '' }}">
            Borbone
        </a>
    </li>
    <li>
        <a href="{{ URL::to('category?slug=mokador') }}" class="{{ $__env->yieldContent('nav_active_category') == 'mokador' ? 'active' : '' }}">
            Mokador
        </a>
    </li>
    <li>
        <a href="{{ URL::to('category?slug=gastro')  }}" class="{{ $__env->yieldContent('nav_active_category') == 'gastro' ? 'active' : '' }}">
            Gastro
        </a>
    </li>

    <li>
        <a href="{{ URL::to('category?slug=kaffebohnen')  }}" class="{{ $__env->yieldContent('nav_active_category') == 'kaffebohnen' ? 'active' : '' }}">
            Kaffebohnen
        </a>
    </li>
    <li>
        <a href="{{ URL::to('category?slug=zubehor') }}" class="{{ $__env->yieldContent('nav_active_category') == 'zubehor' ? 'active' : '' }}">
            Zubehör
        </a>
    </li>
    <li>
        <a href="{{ 'partner' }}" class="">
            Partner
        </a>
    </li>
</ul>
<!-- Main menu - end -->