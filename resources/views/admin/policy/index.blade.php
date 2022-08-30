@extends('admin.layouts.master')

@section('title', 'Chính sách')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Chính sách</li>
            </ol>
        </nav>
    </div>

    <h2>Danh sách chính sách</h2>
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
                @isset($policies)
                    @foreach ($policies as $policy)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>
                            <a href="{{ route('admin.edit.policy',$policy->id) }}" id="link">{{ $policy->name }}</a>
                        </td>
                        <td>
                            <a href="{{ route('admin.destroy.policy',$policy->id) }}" type="button" class="btn btn-sm {{ $policy->getStatus($policy->is_active)['class'] }}">
                                {{ $policy->getStatus($policy->is_active)['name'] }}
                            </a>
                        </td>
                    </tr>
                    @endforeach
                @endisset
            </tbody>
        </table>
    </div>
    {{ $policies->links('components.pagination') }}
@endsection
