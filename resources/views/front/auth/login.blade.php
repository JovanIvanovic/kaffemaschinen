@extends('front.layouts.app')

@section('meta_title', 'Login: Schoengebraucht')
@section('meta_description', 'My Account Management System for Schoengebraucht E Commerce')

@section('content')
    <!-- Main Content - start -->
    <main>
        <section class="container stylization maincont" style="padding-top: 50px;" id="pozadina">


            <ul class="b-crumbs">
                <li>
                    <a href="{{ route('home') }}">
                        Home
                    </a>
                </li>
                <li>
                    <a href="{{ route('login') }}">
                        Login
                    </a>
                </li>
            </ul>
            <h1 class="main-ttl"><span>Login</span></h1>
                <div class="auth-wrap">
                    <div class="auth-col1">
                        <form class="login" role="form" method="POST" action="{{ route('login.post') }}">
                        {{ csrf_field() }}
                        @if (session('status'))
                            <div class="alert alert-danger">
                                {{ session('status') }}
                            </div>
                        @endif
                        <p>
                            <input placeholder="E-mail*" id="email" type="email" name="email" value="{{ old('email') }}" required autofocus>
                        </p>
                            @if ($errors->has('email'))
                                <span class="help-block">
                                            <strong>{{ $errors->first('email') }}</strong>
                                        </span>
                            @endif
                        <p>
                            <input placeholder="Passwort*" id="password" type="password" name="password" required>
                        </p>
                            @if ($errors->has('password'))
                                <span class="help-block">
                                            <strong>{{ $errors->first('password') }}</strong>
                                        </span>
                            @endif
                        
                       <p class="auth-submit">
                           <input type="submit" value="Login">
                           <input type="checkbox" name="remember_me" id="rememberme" value="forever" style="display:none;">
                           <label for="rememberme">{{ __('front.account-remember-me') }}</label>
                        </p>
                        <p class="auth-lost_password">
                            <a href="/forgot-password">{{ __('front.account-lost-your-password') }}</a>
                        </p>
                    </form>
                    </div>
                </div>

        </section>
    </main>
    <!-- Main Content - end -->

@endsection

