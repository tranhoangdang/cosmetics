@extends('client.layouts.app')

@section('title', isset($category->name) ? $category->name : 'Sản phẩm')

@section('content')
    <div class="container-fluid mt-3">
        <nav class="" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb bg-light p-3">
                <li class="breadcrumb-item"><a href="{{route('home')}}">Trang chủ</a></li>
                @if (isset($category->name))
                    <li class="breadcrumb-item"><a href="{{route('product')}}">Sản phẩm</a></li>
                    <li class="breadcrumb-item active" aria-current="page">{{$category->name}}</li>
                @else
                <li class="breadcrumb-item active" aria-current="page">Sản phẩm</li>
                @endif
            </ol>
        </nav>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 col-sm-12 mb-3">
                <div class="border">
                    <h6 class="fw-bold px-4 py-2 d-none d-lg-block">Danh mục sản phẩm</h6>
                    <div class="d-flex justify-content-between d-block d-lg-none" data-bs-toggle="collapse" data-bs-target="#myCategory">
                        <h6 class="fw-bold px-4 py-2">Danh mục sản phẩm</h6>
                        <button class="navbar-toggler d-lg-none me-3" type="button">
                            <i class="bi bi-caret-down-fill"></i>
                        </button>
                    </div>
                    <nav class="navbar navbar-expand-lg">
                        <div class="collapse navbar-collapse border-top" id="myCategory">
                            <ul class="nav flex-column">
                                @foreach ($categories as $item)
                                <li class="nav-item">
                                    <a href="{{route('product.category',$item->slug)}}" class="nav-link {{\Route::is('product.category',$item->slug) ? 'active' : ''}}">{{$item->name}}</a>
                                </li>
                                @endforeach
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="col-md-9 col-sm-12">
                <h3 class="fw-bold"><span class="px-2">{{isset($category->name) ? $category->name : 'Sản phẩm'}}</span></h3>
                <div class="mb-4 bg-light p-3 d-flex">
                    <span class="me-1">Lọc:</span>
                    <a href="{{\Request::get('search') ? '?search='.\Request::get('search').'&sort=popular' : '?sort=popular'}}" class="btn btn-sm btn-outline-primary me-2 mb-1 {{\Request::get('sort') == 'popular' ? 'active' : ''}}" type="button">Phổ biến</a>
                    <a href="{{\Request::get('search') ? '?search='.\Request::get('search').'&sort=new' : '?sort=new'}}" class="btn btn-sm btn-outline-primary me-2 mb-1 {{\Request::get('sort') == 'new' ? 'active' : ''}}" type="button">Mới nhất</a>
                    <a href="{{\Request::get('search') ? '?search='.\Request::get('search').'&sort=best-seller' : '?sort=best-seller'}}" class="btn btn-sm btn-outline-primary me-2 mb-1 {{\Request::get('sort') == 'best-seller' ? 'active' : ''}}" type="button">Bán chạy</a>
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-outline-primary dropdown-toggle mb-1 {{\Request::get('sort') == 'asc' || \Request::get('sort') == 'desc' ? 'active' : ''}}" data-bs-toggle="dropdown" aria-expanded="false">
                          Giá
                        </button>
                        <ul class="dropdown-menu">
                          <li><a class="dropdown-item" href="{{\Request::get('search') ? '?search='.\Request::get('search').'&sort=asc' : '?sort=asc'}}">Thấp đến cao</a></li>
                          <li><a class="dropdown-item" href="{{\Request::get('search') ? '?search='.\Request::get('search').'&sort=desc' : '?sort=desc'}}">Cao đến thấp</a></li>
                        </ul>
                    </div>
                </div> 
                <div class="row pb-3">
                    @foreach ($products as $product)
                    <div class="col-lg-3 col-md-4 col-6 pb-1">
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
                </div>
                @empty($product)
                    @if (\Request::get('search'))
                        <h5 class="text-center fw-bold text-primary">Không tìm thấy kết quả tìm kiếm</h5>
                    @else
                        <h5 class="text-center fw-bold text-primary">Đang cập nhật</h5>
                    @endif
                @endempty
                {{$products->links('components.pagination')}}
            </div>
        </div>
    </div>
@endsection