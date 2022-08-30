@extends('client.layouts.app')

@section('title', 'Lấy lại mật khẩu')

@section('content')
    <div class="container-fluid">
        <div class="text-center mb-4">
            <h2 class="fw-bold px-5"><span class="px-2">Lấy lại mật khẩu</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <div class="col-12 col-md-8 m-auto">
                @include('components.alert')
                <div class="bg-primary border rounded p-xl-5 p-3">
                    <form method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="password" class="form-label">Mật khẩu</label>
                            <input type="password" name="password" class="form-control" id="password" placeholder="Nhập mật khẩu">
                            @if($errors->has('password'))
                                <div class="text-danger fst-italic">
                                    {{$errors->first('password')}}
                                </div>
                            @endif
                        </div>
                        <div class="mb-3">
                            <label for="re_password" class="form-label">Xác nhận mật khẩu</label>
                            <input type="password" name="re_password" class="form-control" id="re_password" placeholder="Nhập lại mật khẩu">
                            @if($errors->has('re_password'))
                                <div class="text-danger fst-italic">
                                    {{$errors->first('re_password')}}
                                </div>
                            @endif
                        </div>
                        <button type="submit" class="btn btn-primary px-5">Lấy lại mật khẩu</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection