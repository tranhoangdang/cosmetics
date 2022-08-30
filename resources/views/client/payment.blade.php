@extends('client.layouts.app')

@section('title', 'Thanh toán')

@section('content')
    <div class="container-fluid">
        <div class="text-center mb-4">
            <h2 class="fw-bold px-5"><span class="px-2">Thanh toán</span></h2>
        </div>      
        <div class="row px-xl-5">
            <div class="col-12 col-md-6 mb-3">
                <div class="bg-primary p-xl-5 p-3 rounded">
                    <form method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="name" class="form-label">Tên <span class="text-danger">*</span></label>
                            <input type="text" name="name" class="form-control" id="name" placeholder="Nhập tên">
                            @if($errors->has('name'))
                                <div class="text-danger fst-italic">
                                    {{$errors->first('name')}}
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
                            <label for="address" class="form-label">Điện chỉ <span class="text-danger">*</span></label>
                            <input type="text" name="address" class="form-control" id="address" placeholder="Nhập số địa chỉ">
                            @if($errors->has('address'))
                                <div class="text-danger fst-italic">
                                    {{$errors->first('address')}}
                                </div>
                            @endif
                        </div>
                        <div class="mb-3">
                            <label for="note" class="form-label">Ghi chú</label>
                            <input type="text" name="note" class="form-control" id="note" placeholder="Nhập ghi chủ">
                        </div>
                        <button type="submit" class="btn btn-primary px-5">Thanh toán</button>
                    </form>
                </div>
            </div>
            <div class="col-12 col-md-6">
                <div class="row">
                    <div class="col-12">
                        <div class="bg-primary p-xl-5 p-3 rounded mb-3">
                            <h5 class="fw-bold">Chi tiết giỏ hàng</h5>
                            <table class="table">
                                @php
                                    $total = 0;
                                @endphp
                                @foreach ($items as $item)
                                <tr>
                                    <td>
                                        <span class="fw-bold me-1">{{$item->qty}}x</span>{{$item->products->name}}
                                    </td>
                                    <td>
                                        <p class="text-danger fw-bold">{{number_format($item->products->price,0,',','.')}}đ</p>
                                    </td>
                                </tr>
                                @php
                                    $total += $item->products->price * $item->qty;
                                @endphp
                                @endforeach
                                <tr>
                                    <td>Tạm tính</td>
                                    <td>{{number_format($total,0,',','.')}}đ</td>
                                </tr>
                                <tr>
                                    <td>Phí vận chuyển</td>
                                    <td>
                                        @if ($total >= 500000)
                                        Miễn phí
                                        @else
                                            30.000đ
                                        @endif
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tổng số</td>
                                    <td>
                                        @if ($total >= 500000)
                                            {{number_format($total,0,',','.')}}đ
                                        @else
                                            {{number_format($total += 30000,0,',','.')}}đ
                                        @endif
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="bg-primary p-xl-5 p-3 rounded">
                            <h5 class="fw-bold">Phương thức thanh toán</h5>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>Thanh toán khi nhận hàng
                                <label class="form-check-label" for="radio1"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection