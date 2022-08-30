@extends('admin.layouts.master')

@section('title', 'Đổi mật khẩu')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="{{ route('admin.profile') }}">Thông tin cá nhân</a></li>
                <li class="breadcrumb-item active" aria-current="page">Đổi mật khẩu</li>
            </ol>
        </nav>
    </div>

    <div class="col-6 m-auto mt-5">
        @include('components.alert')
        <form method="POST">
            @method('PUT')
            @csrf
            <div class="mb-3">
                <label for="old_password" class="form-label">Mật khẩu cũ:</label>
                <input type="password" class="form-control" id="old_password" name="old_password" placeholder="Nhập mật khẩu cũ" required>
            </div>
            <div class="mb-3">
                <label for="new_password" class="form-label">Mật khẩu mới:</label>
                <input type="password" class="form-control" id="new_password" name="new_password" placeholder="Nhập mật khẩu mới" required>
            </div>
            <div class="mb-3">
                <label for="re_password" class="form-label">Nhập lại mật khẩu:</label>
                <input type="password" class="form-control" id="re_password" name="re_password" placeholder="Nhập mật khẩu mới" required>
            </div>
            <button type="submit" class="btn btn-primary w-50">Lưu</button>
        </form>
    </div>
@endsection
