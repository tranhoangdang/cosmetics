@extends('client.layouts.app')

@section('title', 'Quên mật khẩu')

@section('content')
    <div class="container-fluid">
        <div class="text-center mb-4">
            <h2 class="fw-bold px-5"><span class="px-2">Quên mật khẩu</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <div class="col-12 col-md-8 m-auto">
                @include('components.alert')
                <div class="bg-primary border rounded p-xl-5 p-3">
                    <form method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="email" class="form-label">Địa chỉ email</label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="Nhập email">
                            @if($errors->has('email'))
                                <div class="text-danger fst-italic">
                                    {{$errors->first('email')}}
                                </div>
                            @endif
                        </div>
                        <button type="submit" class="btn btn-primary px-5">Gửi</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection