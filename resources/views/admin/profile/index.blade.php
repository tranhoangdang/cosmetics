@extends('admin.layouts.master')

@section('title', 'Thông tin cá nhân')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thông tin cá nhân</li>
            </ol>
        </nav>
        <div class="mb-2 mb-md-0">
            <a href="{{ route('admin.password.profile') }}" type="button" class="btn btn-sm btn-primary me-2">Đổi mật khẩu<i class="bi bi-lock ms-1"></i></a>
        </div>
    </div>

    <div class="col-6 m-auto mt-5">
        @include('components.alert')
        <form method="POST">
            @method('PUT')
            @csrf
            <div class="mb-3">
                <label for="name" class="form-label">Tên:</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Nhập tên" value="{{ old('name',$profile->name) }}" required>
                @if($errors->has('name'))
                    <div class="error-text">
                        {{$errors->first('name')}}
                    </div>
                @endif
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="{{$profile->email}}" disabled>
            </div>
            <button type="submit" class="btn btn-primary w-50">Lưu</button>
        </form>
    </div>
@endsection
