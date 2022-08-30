@extends('client.layouts.app')

@section('title','Giỏ hàng')

@section('content')
    <div class="text-center mb-4">
        <h2 class="fw-bold px-5"><span class="px-2">Giỏ hàng</span></h2>
    </div>
    @if (isset($items))
    <div class="row px-3">
        @include('components.alert')
        <div class="col-12 col-md-7 mb-3">
            @foreach ($items as $item)
            <div class="row border-bottom py-2">
                @php
                    $total = 0;
                @endphp
                <div class="col-md-2 col-3 mb-3 ">
                    <a href="{{route('product.detail',$item->products->slug)}}">
                        <img src="{{asset('public/uploads/'.$item->products->image)}}" class="img-fluid" alt="">
                    </a>
                </div>
                <div class="col-md-9 col-8 d-block">
                    <p class="text-truncate m-0">{{$item->products->name}}</p>   
                    <p class="text-danger fw-bold m-0"><span class="fw-bold text-black me-1">Giá:</span>{{number_format($item->products->price,0,',','.')}} đ</p> 
                    <p class="m-0"><span class="fw-bold me-1">Số lượng:</span> {{$item->qty}}</p>
                    <p class="text-danger fw-bold m-0"><span class="fw-bold text-black me-1">Thành tiền:</span>{{number_format($item->products->price * $item->qty,0,',','.')}} đ</p> 
                </div>
                <div class="col-md-1 col-1">
                    <a href="{{route('destroy.cart.items',$item->id)}}" class="text-danger"><i class="bi bi-trash"></i></a>
                </div>
                @php
                    $total += $item->products->price * $item->qty;
                @endphp
            </div>
            @endforeach
        </div>
        
        @if (isset($item))
        <div class="col-12 col-md-5">
            <div class="bg-primary p-3 mb-3 rounded">
                <p class="fst-italic text-danger">Miễn phí vận chuyển cho đơn hàng trên 500.000 đ</p>
                <table class="table">
                    <tr>
                        <td>Tạm tính</td>
                        
                        <td>{{number_format($total,0,',','.')}} đ</td>
                    </tr>
                    <tr>
                        <td>Phí vận chuyển</td>
                        <td>
                            @if ($total >= 500000)
                                Miễn phí
                            @else
                                30.000 đ
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td>Tổng số</td>
                        <td>
                            @if ($total >= 500000)
                                {{number_format($total,0,',','.')}} đ
                            @else
                            {{number_format($total + 30000,0,',','.')}} đ
                            @endif
                        </td>
                    </tr>
                </table>
            </div>
            <a href="{{route('payment')}}" type="submit" class="btn btn-primary w-100">
                Tiến hành thanh toán
            </a>
        </div>
        @endif
    </div>
    @endif

    @empty($item)
        <h5 class="text-center fw-bold text-primary">Không có sản phẩm nào trong giỏ hàng của bạn.</h5>
    @endempty
@endsection