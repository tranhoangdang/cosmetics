@extends('admin.layouts.master')

@section('title', 'Kho')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Kho</li>
            </ol>
        </nav>
        {{-- <div class="mb-2 mb-md-0">
            <a href="{{ route('admin.create.category') }}" type="button" class="btn btn-sm btn-primary me-2">Thêm danh mục <i class="bi bi-plus-circle ms-1"></i></a>
            <button type="button" class="btn btn-sm btn-success me-2">Xuất (.csv) <i class="bi bi-box-arrow-right ms-1"></i></button>
        </div> --}}
    </div>

    <ul class="nav nav-pills">
        <li class="nav-item">
          <a class="nav-link {{\Request::get('sort') == 'sap-het-hang' ||  !Request::get('sort') ? 'active' : ''}}" href="?sort=sap-het-hang">Sắp hết hàng</a>
        </li>
        <li class="nav-item">
          <a class="nav-link {{\Request::get('sort') == 'ton-kho' ? 'active' : ''}}" href="?sort=ton-kho">Tồn kho</a>
        </li>
    </ul>

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
    {{ $products->links('components.pagination') }}
@endsection
