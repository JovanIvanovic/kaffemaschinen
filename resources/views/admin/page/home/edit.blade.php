@extends('admin.layouts.app')
@section('content')
    <div class="main-content p-3" style="margin-left: 200px; ">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-lg-offset-0 text-center">
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="h1">{{ __('lang.admin-edit-popup') }}</div>
                    </div>
                </div>

                <form id="product-save-form" action="{{route('admin.home.update', $popup->id) }}" method="post" enctype="multipart/form-data" novalidate>
                    {{ csrf_field() }}

                    <div class="row" id="product-save-accordion" data-children=".product-card">
                        <div class="col-12 mb-2 mt-2">
                            <div class="card product-card  mb-2 mt-2">
                                <div class="card-header">
                                    Banner Details
                                </div>
                                <div class="card-body collapse show" id="basic">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="title">{{__('lang.title') }}</label>
                                                <input type="text" class="form-control" id="name" name="title" value="{{$popup->title }}" required />
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="button">{{ __('lang.button') }}</label>
                                                <input type="text" class="form-control" id="slug" name="button" value="{{$popup->button }}" required />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="price">URL</label>
                                                <input type="number" class="form-control" id="price" name="price" value="{{ $popup->price }}" required />
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="link">{{ __('lang.color') }}</label>
                                                <input type="color" class="form-control" style="height: 38px" id="slug" name="color" value="{{$popup->color }}" required />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="body">{{ __('lang.body') }}</label>
                                        <textarea type="text" class="ckeditor" id="description" name="body">{{$popup->body }}</textarea>

                                    </div>

                                    @if ($errors->any())
                                    <div class="row justify-content-center text-center">
                                        <div class="col-6 alert alert-danger">
                                            <ul>
                                                @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    </div>
                                    @endif

                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn-schoen">
                            {{ __('lang.admin-edit-popup') }}
                        </button>
                        <a href="{{ route('admin.page.home') }}" class="btn ">{{ __('lang.cancel') }}</a>
                    </div>

                </form>

            </div>
        </div>
    </div>
@stop