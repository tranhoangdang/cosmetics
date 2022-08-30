@extends('admin.layouts.master')

@section('title', 'Cập nhật chính sách')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="{{ route('admin.policy') }}">Chính sách</a></li>
                <li class="breadcrumb-item active" aria-current="page">Cập nhật chính sách</li>
            </ol>
        </nav>
    </div>

    <div class="col-10 m-auto">
        @include('components.alert')
        <form method="POST">
            @method("PUT")
            @csrf
            <div class="mb-3">
                <label for="name" class="form-label">Tên chính sách:</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Nhập chính sách" value="{{ old('name',$policy->name) }}">
                @if($errors->has('name'))
                    <div class="error-text">
                        {{$errors->first('name')}}
                    </div>
                @endif
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">Nội dung:</label>
                <textarea name="content" id="content" class="form-control" placeholder="Nhập nội dung chính sách">{{ old('content',$policy->content) }}</textarea>
                @if($errors->has('content'))
                    <div class="error-text">
                        {{$errors->first('content')}}
                    </div>
                @endif
            </div>
            <button type="submit" class="btn btn-primary w-50">Lưu</button>
        </form>
    </div>
@endsection

@section('script')
    <script>
        ClassicEditor
            .create( document.querySelector( '#content' ) )
            .catch( error => {
                console.error( error );
            } );
    </script>
@endsection