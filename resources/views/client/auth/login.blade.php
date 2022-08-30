@extends('client.layouts.app')

@section('title', 'Đăng nhập')

@section('content')
    <div class="container-fluid">
        <div class="text-center mb-4">
            <h2 class="fw-bold px-5"><span class="px-2">Đăng nhập</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <div class="col-12 col-md-8 m-auto">
                @include('components.alert')
                <div class="bg-primary border rounded p-xl-5 p-3">
                    <form method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="email" class="form-label">Địa chỉ email</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="Nhập email" value="{{old('email')}}">
                            @if($errors->has('email'))
                                <div class="text-danger fst-italic">
                                    {{$errors->first('email')}}
                                </div>
                            @endif
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Mật khẩu</label>
                            <input type="password" name="password" class="form-control" id="password" placeholder="Nhập mật khẩu">
                            @if($errors->has('password'))
                                <div class="text-danger fst-italic">
                                    {{$errors->first('password')}}
                                </div>
                            @endif
                        </div>
                        <div class="mb-1 d-flex justify-content-end">
                            <a href="{{route('forgetPassword')}}">Quên mật khẩu</a>
                        </div>
                        <div class="mb-3 d-flex justify-content-end">
                            <span class="fst-italic me-2">Bạn chưa có tài khoản?</span><a href="{{route('register')}}">Đăng ký</a>
                        </div>
                        <button type="submit" class="btn btn-primary px-5">Đăng nhập</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection