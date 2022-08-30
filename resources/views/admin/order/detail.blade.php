@extends('admin.layouts.master')

@section('title', 'Chi tiết đơn hàng')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="{{ route('admin.order') }}">Đơn hàng</a></li>
                <li class="breadcrumb-item active" aria-current="page">Chi tiết đơn hàng</li>
            </ol>
        </nav>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12 col-8 m-auto">
                <h3>Chi tiết đơn hàng #{{$order->id}}</h3>
                <p class="d-flex justify-content-end">Ngày đặt: {{date('H:i:s d-m-Y', strtotime($order->created_at));}}</p>
                <div class="row">
                    <div class="col-md-6 col-12 d-flex">
                        <div class="card flex-fill p-3">
                            <h5 class="border-bottom pb-2 ">Địa chỉ người nhận</h5>
                            <p class="fw-bold m-0">{{$order->name}}</p>
                            <p class="m-0">Địa chỉ: {{$order->address}}</p>
                            <p class="m-0">Điện thoại: {{$order->phone}}</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-12 d-flex">
                        <div class="card flex-fill p-3">
                            <h5 class="border-bottom pb-2">Phương thức thanh toán</h5>
                            <p>Thanh toán khi nhận hàng</p>
                        </div>
                    </div>
                </div>
                <table class="table mt-3">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tạm tính</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($invoices as $invoice)
                        <tr>
                            <td>
                                <a href="{{route('admin.edit.product',$invoice->products->id)}}" class="text-decoration-none text-black">
                                <div class="d-flex">
                                    <img src="{{ asset('public/uploads/'.$invoice->products->image) }}" alt="" id="product-img">
                                    <div class="d-block">
                                        <p>{{$invoice->products->name}}</p>
                                    </div>
                                </div>
                                </a>
                            </td>
                            <td>{{number_format($invoice->price,0,',','.')}} đ</td>
                            <td>{{$invoice->qty}}</td>
                            <td>{{number_format($invoice->price * $invoice->qty,0,',','.')}} đ</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="d-flex justify-content-end">
                    <div class="d-block">
                        <p>Tạm tính: 
                            @if ($order->total > 500000)
                                {{number_format($order->total,0,',','.')}} đ
                            @else
                                {{number_format($order->total - 30000,0,',','.')}} đ
                            @endif
                        </p>
                        <p>Phí vận chuyển:
                            @if ($order->total > 500000)
                                Miễn phí
                            @else
                                30.000 đ
                            @endif
                        </p>
                        <p>Tổng cộng: {{number_format($order->total,0,',','.')}} đ</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
