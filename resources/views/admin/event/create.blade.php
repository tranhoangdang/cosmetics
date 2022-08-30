@extends('admin.layouts.master')

@section('title', 'Thêm sự kiện')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="{{ route('admin.event') }}">Sự kiện</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thêm sự kiện</li>
            </ol>
        </nav>
    </div>

    <div class="col-10 m-auto">
        @include('components.alert')
        <form method="POST" enctype="multipart/form-data">
            @csrf
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="mb-3">
                        <label for="name" class="form-label">Tên sự kiện:</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Nhập tên sự kiện" value="{{old('name')}}">
                        @if($errors->has('name'))
                            <div class="error-text">
                                {{$errors->first('name')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="image" class="form-label d-block">Ảnh bìa:</label>
                        <label for="image"><img src="{{ asset('public/images/default-img.png') }}" alt="" id="frame"></label>
                        <input type="file" name="image" id="image" accept="image/*" onchange="preview(event)"/>
                        @if($errors->has('image'))
                            <div class="error-text">
                                {{$errors->first('image')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="status" class="form-label">Trạng thái:</label>
                        <select class="form-select" name="status">
                            <option value="1">Hiển thị</option>
                            <option value="0">Ẩn</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="mb-3">
                        <label for="content" class="form-label">Nội dung:</label>
                        <textarea name="content" id="content" class="form-control" placeholder="Nhập nội dung sự kiện"></textarea>
                        @if($errors->has('content'))
                            <div class="error-text">
                                {{$errors->first('content')}}
                            </div>
                        @endif
                    </div>
                    <button type="submit" class="btn btn-primary w-50">Lưu</button>
                </div>
            </div>
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