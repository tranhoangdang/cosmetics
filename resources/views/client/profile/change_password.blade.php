@extends('client.layouts.app')

@section('title','Đổi mật khẩu')

@section('content')
    <div class="text-center mb-4">
        <h2 class="fw-bold px-5"><span class="px-2">Đổi mật khẩu</span></h2>
    </div>
    <div class="row px-3">
        <div class="col-12 col-md-6 m-auto">
            @include('components.alert')
            <div class="bg-primary border rounded p-xl-5 p-3">
                <form method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="password" class="form-label">Mật khẩu hiện tại:</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu hiện tại">
                        @if($errors->has('password'))
                            <div class="text-danger fst-italic">
                                {{$errors->first('password')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="new_password" class="form-label">Mật khẩu mơi:</label>
                        <input type="password" class="form-control" id="new_password" name="new_password" placeholder="Nhập mật khẩu mới">
                        @if($errors->has('new_password'))
                            <div class="text-danger fst-italic">
                                {{$errors->first('new_password')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="re_password" class="form-label">Xác nhận mật khẩu:</label>
                        <input type="password" class="form-control" id="re_password" name="re_password" placeholder="Nhập lại mật khẩu mới">
                        @if($errors->has('re_password'))
                            <div class="text-danger fst-italic">
                                {{$errors->first('re_password')}}
                            </div>
                        @endif
                    </div>
                    <button type="submit" class="btn btn-primary px-5">Đổi mật khẩu</button>
                </form>
            </div>

        </div>
    </div>
@endsection