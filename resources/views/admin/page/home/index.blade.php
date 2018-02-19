@extends('admin.layouts.app')
@section('content')
    <div class="container">
        <div class="h1">
            Home Popups

            <a href="{{ route('admin.home.create') }}"
               class="float-right btn-schoen">
                {{ __('lang.admin-create-new-popup') }}
            </a>

        </div>
        {!! $dataGrid->render() !!}
    </div>
@stop