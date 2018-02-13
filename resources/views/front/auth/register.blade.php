@extends('front.layouts.app')

@section('meta_title', 'Registration: Schoengebraucht')
@section('meta_description', 'My Account Management System for Schoengebraucht E Commerce')

@section('content')
    <!-- Main Content - start -->
    <main>
        <section class="container stylization maincont">


            <ul class="b-crumbs">
                <li>
                    <a href="{{ route('home') }}">
                        Home
                    </a>
                </li>
                <li>
                    <a href="{{ route('register') }}">
                        Registrierung
                    </a>
                </li>
            </ul>
            <div class="auth-wrap">
                <div class="auth-col">
                    <h1 class="main-ttl"><span>{{ __('front.account-register') }}</span></h1>
                    <form class="register" role="form" method="POST" action="{{ url('/register') }}">
                        {{ csrf_field() }}
                        <p>
                            <label for="title">{{ __('front.account-title') }}<span class="required">*</span></label>
                            <label class="radio-inline">
                                <input type="radio" name="title" value="Herr" required>Herr
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="title" value="Frau">Frau
                            </label>                        </p>
                        <p>
                            {{--<label for="firstname">{{ __('front.account-first-name') }} <span class="required">*</span></label>--}}
                            <input id="firstname" placeholder="{{ __('front.account-first-name') }}" type="text" class="form-control" name="first_name" value="{{ old('first_name') }}" required autofocus>
                        </p>
                        <p>
                            {{--<label for="lastname">{{ __('front.account-last-name') }} <span class="required">*</span></label>--}}
                            <input id="lastname" placeholder="{{ __('front.account-last-name') }}" type="text" class="form-control" name="last_name" value="{{ old('last_name') }}" required autofocus>
                        </p>
                        <p>
                            {{--<label for="address">Adresse <span class="required">*</span></label>--}}
                            <input id="reg_email" placeholder="Adresse" type="text" class="form-control" name="address" value="{{ old('address') }}" required>
                        </p>
                        <p>
                            {{--<label for="city">{{ __('front.account-city') }} <span class="required">*</span></label>--}}
                            <input id="password" placeholder="{{ __('front.account-city') }}" type="text" class="form-control" name="city" value="{{ old('city') }}" required>
                        </p>
                        <p>
                            {{--<label for="zip">{{ __('front.account-zip') }} <span class="required">*</span></label>--}}
                            <input id="password" placeholder="{{ __('front.account-zip') }}" type="text" class="form-control" name="zip" value="{{ old('zip') }}" required>
                        </p>
                        <p>
                            {{--<label for="phone">{{ __('front.phone') }} P <span class="required">*</span></label>--}}
                            <input id="password" placeholder="{{ __('front.phone') }} P" type="text" class="form-control" name="phone" value="{{ old('phone') }}" required>
                        </p>
                        <p>
                            {{--<label for="reg_email">E-mail <span class="required">*</span></label>--}}
                            <input id="password" placeholder="E-mail" type="email" class="form-control" name="email" value="{{ old('email') }}" required>
                        </p>
                        <p>
                            {{--<label for="reg_password">{{ __('front.account-password') }} <span class="required">*</span></label>--}}
                            <input id="reg_password" placeholder="{{ __('front.account-password') }}" type="password" class="form-control" name="password" required>
                        </p>
                        <p>
                            {{--<label for="password">{{ __('front.account-confirm-password') }} <span class="required">*</span></label>--}}
                            <input id="password" placeholder="{{ __('front.account-confirm-password') }}" type="password" class="form-control" name="password_confirmation" required>
                        </p>
                        <p>
                            <label for="subscribe">{{ __('front.i-want-to-subscribe') }}<span class="required">*</span></label>
                            <input type="checkbox" name="subscribe">
                        </p>
                        <p class="auth-submit">
                            <input type="submit" value="{{ __('front.account-register') }}">
                        </p>
                    </form>
                </div>
            </div>



        </section>
    </main>
    <!-- Main Content - end -->

@endsection