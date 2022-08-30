@extends('admin.layouts.master')

@section('title', 'Đơn hàng')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Đơn hàng</li>
            </ol>
        </nav>
        <div class="mb-2 mb-md-0">
            <a href="{{ route('admin.export.order') }}" type="button" class="btn btn-sm btn-success me-2">Xuất (.csv) <i class="bi bi-box-arrow-right ms-1"></i></a>
        </div>
    </div>

    <h2>Danh sách đơn hàng</h2>
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
    {{ $orders->links('components.pagination') }}
@endsection
