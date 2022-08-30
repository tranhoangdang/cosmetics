@extends('client.layouts.app')

@section('title', 'Chi tiết sản phẩm')

@section('content')
<div class="container-fluid px-xl-5">
    @include('components.alert')
</div>
<div class="container-fluid px-xl-5">
    <div class="row bg-light p-3">
        <div class="col-md-5 col-sm-6">
            <img src="{{asset('public/uploads/'.$product->image)}}" class="img-fluid w-100">
        </div>
        <div class="col-md-7 col-sm-6">
            <h4 class="mb-3">{{$product->name}}</h4>
            <p class="m-0"><span class="fw-bold me-2">Thương hiệu:</span>{{$product->brand}}</p>
            <p><span class="fw-bold me-2">Danh mục:</span>{{$product->category->name}}</p>
            @if ($product->qty > 0)
            <p><span class="fw-bold me-2">Đã bán:</span>{{$product->sold}}</p>
            @else
            <h4 class="fw-bold me-2">Ngừng kinh doanh</h4>
            @endif
            <h2 class="mb-3 fw-bold text-danger">{{number_format($product->price,0,',','.')}} đ</h2>
            @if ($product->qty > 0)
            <a href="{{route('add.cart.items',$product->id)}}" type="button" class="btn btn-primary px-5">Chọn mua</a>
            @else
            <a href="{{route('product.category',$product->category->slug)}}" type="button" class="btn btn-primary px-5">Xem sản phẩm tươngg tự</a>
            @endif
        </div>
    </div>
</div>

<div class="container-fluid px-xl-5 mt-4">
    <div class="row bg-light p-3">
        <h5 class="mb-3">Sản phẩm tương tự</h5>
        @foreach ($products as $item)
        <div class="col-6 col-lg-2 col-md-4">
            <a href="{{route('product.detail',$item->slug)}}" class="text-decoration-none text-black">
                <img src="{{asset('public/uploads/'.$item->image)}}" class="img-fluid w-100">
                <p class="mb-3 text-truncate">{{$item->name}}</p>
            </a>
        </div>
        @endforeach
    </div>
</div>

<div class="container-fluid px-xl-5 mt-4">
    <div class="row bg-light p-3">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#infomation">Thông tin chi tiết</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#description">Mô tả</a>
            </li>
        </ul>
        
        <!-- Tab panes -->
        <div class="tab-content mt-3">
            <div class="tab-pane container active" id="infomation">
                <table class="table table-bordered">
                    <tr>
                        <th scope="row">Thương hiệu</th>
                        <td>{{$product->brand}}</td>
                    </tr>
                    <tr>
                        <th scope="row">Danh mục</th>
                        <td>{{$product->category->name}}</td>
                    </tr>
                    <tr>
                        <th scope="row">Nguồn gốc</th>
                        <td>{{$product->origin}}</td>
                    </tr>
                    <tr>
                        <th scope="row">Hạn sử dụng</th>
                        <td>{{$product->exp}}</td>
                    </tr>
                </table>
            </div>
            <div class="tab-pane container fade" id="description">{!!$product->description!!}</div>
        </div>
    </div>
</div>
@endsection