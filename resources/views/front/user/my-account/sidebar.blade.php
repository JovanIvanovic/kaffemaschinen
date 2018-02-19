<div class="col-sm-3 vertical-menu">
    @if($user->image_path == "")
        <a id="slika">
            <img src="/front/assets/img/default_avatar.png" alt="">
            <p class="text-center">
                <strong class="text-center">{{ $user->fullName }}</strong>
            </p>
        </a>
    @else
        <a id="slika">
            <img src="{{ $user->image_path->smallUrl }}" class="img-responsive img-thumbnail" alt="">

            <p class="text-center user_name">{{ $user->fullName }}</p>
        </a>
    @endif

    <div class="section-sb profile_section-sb">
        <div class="section-sb-current">
            <ul class="section-sb-list profile_section-sb-list" id="section-sb-list">

                <li class="categ-1">
                    <a href="{{ route('my-account.home') }}"><span class="categ-1-label">{{ __('front.account-overview') }}</span></a>
                </li>

                <li class="categ-1">
                    <a href="{{ route('my-account.edit') }}"><span class="categ-1-label">{{ __('front.account-edit-account') }}</span></a>
                </li>

                <li class="categ-1">
                    <a href="{{ route('my-account.upload-image') }}"><span class="categ-1-label">{{ __('front.account-upload-image') }}</span></a>
                </li>
                <li class="categ-1">
                    <a href="{{ route('my-account.orders') }}"><span class="categ-1-label">{{ __('front.account-my-order') }}</span></a>
                </li>

                <li class="categ-1">
                    <a href="{{ route('my-account.address.index') }}"><span class="categ-1-label">{{ __('front.address') }}</span></a>
                </li>

                <li class="categ-1">
                    <a href="{{ route('my-account.change-password') }}"><span class="categ-1-label">{{ __('front.account-change-password') }}</span></a>
                </li>

                <li class="categ-1">
                    <a href="{{ route('logout') }}"><span class="categ-1-label">{{ __('front.account-logout') }}</span></a>
                </li>
            </ul>
        </div>
    </div>
</div>

