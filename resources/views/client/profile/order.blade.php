@extends('client.layouts.app')

@section('title','Đơn hàng của tôi')

@section('content')
    <div class="text-center mb-4">
        <h2 class="fw-bold px-5"><span class="px-2">Đơn hàng của tôi</span></h2>
    </div>
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
                            <a href="{{ route('profile.order.detail',$order->id) }}" type="button" class="btn btn-sm btn-success">
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

    @empty($order)
    <h5 class="text-center fw-bold text-primary">Bạn chưa đặt mua sản phẩm tại cửa hàng.</h5>
    @endempty
@endsection