@php($page_name = 'Partner')
@extends('admin.layouts.app')
@section('content')
    <div class="container">
        <div class="h1">
            Partners

            <a href="{{ route('admin.partner.create') }}"
               class="float-right btn-schoen">
                {{ __('lang.admin-create-new-partner') }}
            </a>

        </div>
        {!! $dataGrid->render() !!}
    </div>
@stop