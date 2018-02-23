@extends('admin.layouts.app')
@section('content')
    <div class="main-content p-3">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-lg-offset-0 text-center">
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="h1">{{ __('lang.admin-create-new-popup') }}</div>
                    </div>
                </div>

                <form id="popup-save-form" action="{{ route('admin.popup.store') }}" method="post" enctype="multipart/form-data" novalidate>
                    {{ csrf_field() }}

                    <div class="row" id="product-save-accordion" data-children=".product-card">
                        <div class="col-12 mb-2 mt-2">
                            <div class="card product-card  mb-2 mt-2">
                                <div class="card-header">
                                    Popup Details
                                </div>
                                <div class="card-body collapse show" id="basic">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="title" >{{ __('lang.title') }}</label>
                                                <input type="text" class="form-control" id="name" name="heading" value="{{ old('title') }}" required>
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="end_date" >{{ __('lang.date') }}</label>
                                                <input type="date" class="form-control" id="slug" name="end_date" value="{{ old('end_date') }}" required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="package_id" >{{ __('lang.package') }}</label>
                                                <select name="package_id" class="form-control" required>
                                                    @foreach ($packages as $package)
                                                        <option value="{{ $package->id }}">{{ $package->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="link" >{{ __('lang.color') }}</label>
                                                <input type="color" class="form-control" style="height: 38px" id="slug" name="color" value="{{ old('color') }}" required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row justify-content-center">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="image" >{{ __('lang.images') }}</label>
                                                <input type="file" class="form-control" id="name" name="image" required>
                                            </div>
                                        </div>
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
                            {{ __('lang.admin-create-new-popup') }}
                        </button>
                        <a href="{{ route('admin.popup.index') }}" class="btn ">{{ __('lang.cancel') }}</a>
                    </div>

                </form>

            </div>
        </div>
    </div>
@stop