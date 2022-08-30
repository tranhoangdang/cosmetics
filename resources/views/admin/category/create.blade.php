@extends('admin.layouts.master')

@section('title', 'Thêm danh mục')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="{{ route('admin.category') }}">Danh mục</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thêm danh mục</li>
            </ol>
        </nav>
    </div>

    <div class="col-6 m-auto mt-5">
        @include('components.alert')
        <form method="POST">
            @csrf
            <div class="mb-3">
                <label for="name" class="form-label">Tên danh mục:</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Nhập danh mục">
                @if($errors->has('name'))
                    <div class="error-text">
                        {{$errors->first('name')}}
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
            <button type="submit" class="btn btn-primary w-50">Lưu</button>
        </form>
    </div>
@endsection
