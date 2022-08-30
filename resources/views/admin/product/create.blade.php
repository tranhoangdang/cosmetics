@extends('admin.layouts.master')

@section('title', 'Thêm sản phẩm')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="{{ route('admin.product') }}">Sản phẩm</a></li>
                <li class="breadcrumb-item active" aria-current="page">Thêm sản phẩm</li>
            </ol>
        </nav>
    </div>

    <div class="col-10 m-auto">
        @include('components.alert')
        <form method="POST" enctype="multipart/form-data">
            @csrf
            <div class="row">
                <div class="col-md-7 col-sm-12">
                    <div class="mb-3">
                        <label for="name" class="form-label">Tên sản phẩm:</label>
                        <textarea class="form-control" id="name" name="name" placeholder="Nhập tên sản phẩm" rows="4">{{ old('name') }}</textarea>
                        @if($errors->has('name'))
                            <div class="error-text">
                                {{$errors->first('name')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="category" class="form-label">Thuộc danh mục:</label>
                        <select class="form-select" name="category" id="category" onchange="myFunction()">
                            @isset($categories)
                                @foreach ($categories as $category)
                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach
                            @endisset
                        </select>
                    </div>
                    <div class="mb-3" id="skin">
                        <label class="form-label">Loại da phù hợp:</label>
                        <select class="form-select" name="skin">
                            <option value="1">Mọi loại da</option>
                            <option value="2">Da thường</option>
                            <option value="3">Da khô</option>
                            <option value="4">Da dầu</option>
                            <option value="5">Da hỗn hợp</option>
                            <option value="6">Da nhạy cảm</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="brand" class="form-label">Thương hiệu:</label>
                        <input type="text" class="form-control" id="brand" name="brand" placeholder="Nhập thương hiệu" value="{{old('brand')}}">
                        @if($errors->has('brand'))
                            <div class="error-text">
                                {{$errors->first('brand')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="origin" class="form-label">Xuất xứ:</label>
                        <input type="text" class="form-control" id="origin" name="origin" placeholder="Nhập xuất xứ" value="{{old('origin')}}">
                        @if($errors->has('origin'))
                            <div class="error-text">
                                {{$errors->first('origin')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="exp" class="form-label">Hạn sử dụng:</label>
                        <input type="text" class="form-control" id="exp" name="exp" placeholder="Nhập hạn sử dung" value="{{old('exp')}}">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Mô tả:</label>
                        <textarea name="description" id="description" class="form-control">{{ old('description') }}</textarea>
                        @if($errors->has('description'))
                            <div class="error-text">
                                {{$errors->first('description')}}
                            </div>
                        @endif
                    </div>
                </div>
                <div class="col-md-5 col-sm-12">
                    <div class="mb-3">
                        <label for="image" class="form-label d-block">Ảnh bìa:</label>
                        <label for="image"><img src="{{ asset('public/images/default-img.png') }}" alt="" id="frame"></label>
                        <input type="file" name="image" id="image" accept="image/*" onchange="preview(event)"/>
                        @if($errors->has('image'))
                            <div class="error-text">
                                {{$errors->first('image')}}
                            </div>
                        @endif
                    </div>

                    <div class="mb-3">
                        <label for="price" class="form-label">Giá (VND):</label>
                        <input type="number" class="form-control" id="price" name="price" placeholder="Nhập giá sản phẩm" value="{{old('price')}}">
                        @if($errors->has('price'))
                            <div class="error-text">
                                {{$errors->first('price')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="qty" class="form-label">Số lượng:</label>
                        <input type="number" class="form-control" id="qty" name="qty" placeholder="Nhập số lượng sản phẩm" value="{{old('qty')}}">
                        @if($errors->has('qty'))
                            <div class="error-text">
                                {{$errors->first('qty')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="status" class="form-label">Trạng thái:</label>
                        <select class="form-select" name="status" id="status">
                            <option value="1">Hiển thị</option>
                            <option value="0">Ẩn</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-50">Lưu</button>
                </div>
            </div>
        </form>
    </div>
@endsection

@section('script')
    <script>
        ClassicEditor
            .create( document.querySelector( '#description' ) )
            .catch( error => {
                console.error( error );
            } );
    </script>
@endsection