@extends('client.layouts.app')

@section('title', 'Trang chủ')

@section('content')
<div class="container-fluid mb-5">
    <div class="">
        <div id="carouselIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                @foreach ($events as $count => $event)
                <a href="{{route('event.detail',$event->slug)}}">
                    <div class="carousel-item @if ($count==0) active @endif" style="max-height: 500px;">
                        <img src="{{ asset('public/uploads/'.$event->image)}}" class="d-block w-100" alt="...">
                    </div>
                </a>
                @endforeach
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="text-center mb-4">
        <a href="{{route('product')}}?sort=new" class="text-decoration-none text-black">
            <h2 class="fw-bold px-5"><span class="px-2">Sản phẩm mới</span></h2>
        </a>
    </div>
    <div class="row pb-3">
        @foreach ($newProducts as $product)
        <div class="col-lg-2 col-md-4 col-6 pb-1">
            <a href="{{route('product.detail',$product->slug)}}" class="card border mb-4 text-decoration-none text-black">
                <div class="card-header position-relative overflow-hidden bg-transparent border p-0">
                    <img src="{{asset('public/uploads/'.$product->image)}}" class="img-fluid w-100">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <p class="text-truncate px-2 fw-bold mb-3">{{$product->name}}</p>
                    <div class="d-flex justify-content-center">
                        <p class="fw-bold">{{number_format($product->price,0,',','.')}} đ</p>{{-- <h6 class="text-muted ms-2"><del>$123.00</del></h6> --}}
                    </div>
                </div>
            </a>
        </div>
        @endforeach

        @empty($product)
            <h5 class="text-center fw-bold text-primary">Đang cập nhật</h5>
        @endempty
    </div>
</div>

<div class="container-fluid">
    <div class="text-center mb-4">
        <a href="{{route('product')}}?sort=best-seller" class="text-decoration-none text-black">
            <h2 class="fw-bold px-5"><span class="px-2">Sản phẩm bán chạy</span></h2>
        </a>
    </div>
    <div class="row pb-3">
        @foreach ($bestSeller as $product)
        <div class="col-lg-2 col-md-3 col-6 pb-1">
            <a href="{{route('product.detail',$product->slug)}}" class="card border mb-4 text-decoration-none text-black">
                <div class="card-header position-relative overflow-hidden bg-transparent border p-0">
                    <img src="{{asset('public/uploads/'.$product->image)}}" class="img-fluid w-100">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <p class="text-truncate px-2 fw-bold mb-3">{{$product->name}}</p>
                    <div class="d-flex justify-content-center">
                        <p class="fw-bold">{{number_format($product->price,0,',','.')}} đ</p>{{-- <h6 class="text-muted ms-2"><del>$123.00</del></h6> --}}
                    </div>
                </div>
            </a>
        </div>
        @endforeach
        @empty($product)
            <h5 class="text-center fw-bold text-primary">Đang cập nhật</h5>
        @endempty
    </div>
</div>

<div class="container-fluid">
    <div class="text-center mb-4">
        <a href="{{route('product')}}?sort=popular" class="text-decoration-none text-black">
            <h2 class="fw-bold px-5"><span class="px-2">Sản phẩm được xem nhiều</span></h2>
        </a>
    </div>
    <div class="row pb-3">
        @foreach ($trending as $product)
        <div class="col-lg-2 col-md-3 col-6 pb-1">
            <a href="{{route('product.detail',$product->slug)}}" class="card border mb-4 text-decoration-none text-black">
                <div class="card-header position-relative overflow-hidden bg-transparent border p-0">
                    <img src="{{asset('public/uploads/'.$product->image)}}" class="img-fluid w-100">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <p class="text-truncate px-2 fw-bold mb-3">{{$product->name}}</p>
                    <div class="d-flex justify-content-center">
                        <p class="fw-bold">{{number_format($product->price,0,',','.')}} đ</p>{{-- <h6 class="text-muted ms-2"><del>$123.00</del></h6> --}}
                    </div>
                </div>
            </a>
        </div>
        @endforeach
        @empty($product)
            <h5 class="text-center fw-bold text-primary">Đang cập nhật</h5>
        @endempty
    </div>
</div>
@endsection