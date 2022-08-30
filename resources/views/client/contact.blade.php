@extends('client.layouts.app')

@section('title', 'Liên hệ')

@section('content')
    <div class="container-fluid">
        <div class="text-center mb-4">
            <h2 class="fw-bold px-5"><span class="px-2">Liên hệ</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <div class="col-12 col-md-10 m-auto">
                @include('components.alert')
                <div class="bg-primary p-xl-5 p-3 rounded">
                    <form method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="email" class="form-label">Địa chỉ email <span class="text-danger">*</span></label>
                            <input type="email" name="email" class="form-control" id="email" placeholder="Nhập email">
                            @if($errors->has('email'))
                                <div class="text-danger fst-italic">
                                    {{$errors->first('email')}}
                                </div>
                            @endif
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Số điện thoại <span class="text-danger">*</span></label>
                            <input type="number" name="phone" class="form-control" id="phone" placeholder="Nhập số điện thoại">
                            @if($errors->has('phone'))
                                <div class="text-danger fst-italic">
                                    {{$errors->first('phone')}}
                                </div>
                            @endif
                        </div>
                        <div class="mb-3">
                            <label for="orderID" class="form-label">Mã đơn hàng</label>
                            <input type="text" name="orderID" class="form-control" id="orderID" placeholder="Nhập mã đơn hàng">
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">Tiêu đề <span class="text-danger">*</span></label>
                            <input type="text" name="title" class="form-control" id="title" placeholder="Nhập tiêu đề">
                            @if($errors->has('title'))
                                <div class="text-danger fst-italic">
                                    {{$errors->first('title')}}
                                </div>
                            @endif
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">Nội dung <span class="text-danger">*</span></label>
                            <textarea name="content" class="form-control" id="content" rows="5" placeholder="Nhập nội dung"></textarea>
                            @if($errors->has('content'))
                                <div class="text-danger fst-italic">
                                    {{$errors->first('content')}}
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