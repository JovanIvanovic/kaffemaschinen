
<!-- Main menu - start -->
<button type="button" class="mainmenu-btn">Menu</button>

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