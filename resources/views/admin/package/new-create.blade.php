@extends('admin.layouts.app')


@section('content')
    <div class="row">
        <div class="col-12">
            <div class="h1">{{ __("lang.package.create.text") }}</div>
        </div>
    </div>
    <form
            id="package-save-form"
            action="{{ route('admin.package.store') }}"
            method="post"
            enctype="multipart/form-data">

        {{ csrf_field() }}

        <div class="row">
            <div class="col-6">
                @include("admin.forms.text",['name'=> 'name','label' => __('lang.name')])
            </div>
            <div class="col-6">
                @include('admin.forms.text',['name' => 'price','label' => __('front.price')])
            </div>
        </div>

        @include('admin.forms.textarea',['name' => 'description','label' => __('lang.description'),
                                                    'attributes' => ['class' => 'ckeditor','id' => 'description']])



        <div class="row">
            <div class="col-6">
                @include('admin.forms.autocomplete',['name' => 'product-search','label' => __('front.product')])
            </div>
        </div>

        <div class="product-image-list">
            <div class="image-preview">
                <img class="img-thumbnail img-tag img-responsive" src="http://schoengebraucht.ch/uploads/catalog/images/n/7/q/med-1.8_Sa%CC%88ulen_3.jpg"/>
                <input type="hidden" name="image[]" class="img-relative-path" value=""/>
            </div>
        </div>

        <div class="form-group">
            <button type="submit" class="btn-schoen">{{ __('lang.create') . ' & ' . __('lang.continue') }}</button>
            <button type="button"
                    onclick="location='{{ route('admin.package.index') }}'"

                    class="btn">{{ __('lang.cancel') }}
            </button>
        </div>
    </form>
@endsection