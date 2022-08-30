@extends('admin.layouts.master')

@section('title', 'Sản phẩm')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Sản phẩm</li>
            </ol>
        </nav>
        <div class="mb-2 mb-md-0">
            <a href="{{ route('admin.create.product') }}" type="button" class="btn btn-sm btn-primary me-2">Thêm sản phẩm <i class="bi bi-plus-circle ms-1"></i></a>
            <a href="{{ route('admin.export.product') }}" type="button" class="btn btn-sm btn-success me-2">Xuất (.csv) <i class="bi bi-box-arrow-right ms-1"></i></a>
        </div>
    </div>

    <h2>Danh sách sản phẩm</h2>
    <div class="table-responsive">
        <table class="table table-sm">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Danh mục</th>
                    <th scope="col">Trạng thái</th>
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
                                    </div>
                                </div>
                            </a>
                        </td>
                        <td>{{ $product->category->name }}</td>
                        <td>
                            <a href="{{ route('admin.destroy.product',$product->id) }}" type="button" class="btn btn-sm {{ $product->getStatus($product->is_active)['class'] }}">
                                {{ $product->getStatus($product->is_active)['name'] }}
                            </a>
                        </td>
                    </tr>
                    @endforeach
                @endisset
            </tbody>
        </table>
    </div>
    {{ $products->links('components.pagination') }}
@endsection
