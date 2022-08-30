@extends('admin.layouts.master')

@section('title', 'Trang chủ')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Trang chủ</h1>
    </div>
    <a href="{{route('admin.order')}}"><h3>Sản phẩm sắp hết hàng</h3></a>
    <div class="table-responsive mt-3">
        <table class="table table-sm">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Số lượng</th>
                </tr>
            </thead>
            <tbody>
                @isset($products)
                    @foreach ($products as $product)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>
                            <a href="{{route('admin.edit.product',$product->id)}}" id="link">
                                <div class="d-flex">
                                    <img src="{{ asset('public/uploads/'.$product->image) }}" alt="" id="product-img">
                                    <div class="d-block">
                                        <p>{{ $product->name }}</p>
                                        <p><span class="fw-bold">Thương hiệu:</span> {{ $product->brand }}</p>
                                        <p><span class="fw-bold">Danh mục:</span> {{ $product->category->name }}</p>
                                    </div>
                                </div>
                            </a>
                        </td>
                        <td>{{ $product->qty }}</td>
                    </tr>
                    @endforeach
                @endisset
            </tbody>
        </table>
    </div>
    <a href="{{route('admin.order')}}"><h3>Đơn hàng mới</h3></a>
    <div class="table-responsive">
        <table class="table table-sm">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Mã đơn hàng</th>
                    <th scope="col">Thông tin khách hàng</th>
                    <th scope="col">Ghi chú</th>
                    <th scope="col">Tổng đơn</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                @isset($orders)
                    @foreach ($orders as $order)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>
                            {{ $order->id }}
                        </td>
                        <td>
                            <p class="m-0"><span class="me-1 fw-bold">Người nhận:</span>{{ $order->name }}</p>
                            <p class="m-0"><span class="me-1 fw-bold">Email:</span>{{ $order->user->email }}</p>
                            <p class="m-0"><span class="me-1 fw-bold">SĐT:</span>{{ $order->phone }}</p>
                            <p class="m-0"><span class="me-1 fw-bold">Địa chỉ:</span>{{ $order->address }}</p>
                        </td>
                        <td>
                            {{isset($order->note) ? $order->note : '[N/A]'}}
                        </td>
                        <td>
                            {{number_format($order->total,0,',','.')}} đ
                        </td>
                        <td>
                            <a href="{{ route('admin.detail.order',$order->id) }}" type="button" class="btn btn-sm btn-success">
                                Chi tiết
                            </a>
                        </td>
                    </tr>
                    @endforeach
                @endisset
            </tbody>
        </table>
    </div>
    <a href="{{route('admin.contact')}}"><h3>Liên hệ mới</h3></a>
    <div class="table-responsive">
        <table class="table table-sm">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Tiêu đề</th>
                    <th scope="col">Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                @isset($contacts)
                    @foreach ($contacts as $contact)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>
                            <a href="{{ route('admin.detail.contact',$contact->id) }}" id="link">{{ $contact->title }}</a>
                        </td>
                        <td>
                            <a href="{{ route('admin.destroy.contact',$contact->id) }}" type="button" class="btn btn-sm {{ $contact->getStatus($contact->is_active)['class'] }}">
                                {{ $contact->getStatus($contact->is_active)['name'] }}
                            </a>
                        </td>
                    </tr>
                    @endforeach
                @endisset
            </tbody>
        </table>
    </div>
@endsection