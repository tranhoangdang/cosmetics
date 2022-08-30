@extends('admin.layouts.master')

@section('title', 'Danh mục')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Danh mục</li>
            </ol>
        </nav>
        <div class="mb-2 mb-md-0">
            <a href="{{ route('admin.create.category') }}" type="button" class="btn btn-sm btn-primary me-2">Thêm danh mục <i class="bi bi-plus-circle ms-1"></i></a>
            <a href="{{ route('admin.export.category') }}" type="button" class="btn btn-sm btn-success me-2">Xuất (.csv) <i class="bi bi-box-arrow-right ms-1"></i></a>
        </div>
    </div>

    <h2>Danh sách danh mục</h2>
    <div class="table-responsive">
        <table class="table table-sm">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                @isset($categories)
                    @foreach ($categories as $category)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>
                            <a href="{{ route('admin.edit.category',$category->id) }}" id="link">{{ $category->name }}</a>
                        </td>
                        <td>
                            <a href="{{ route('admin.destroy.category',$category->id) }}" type="button" class="btn btn-sm {{ $category->getStatus($category->is_active)['class'] }}">
                                {{ $category->getStatus($category->is_active)['name'] }}
                            </a>
                        </td>
                    </tr>
                    @endforeach
                @endisset
            </tbody>
        </table>
    </div>
    {{ $categories->links('components.pagination') }}
@endsection
