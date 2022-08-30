@extends('admin.layouts.master')

@section('title', 'Sự kiện')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Sự kiện</li>
            </ol>
        </nav>
        <div class="mb-2 mb-md-0">
            <a href="{{ route('admin.create.event') }}" type="button" class="btn btn-sm btn-primary me-2">Thêm sự kiện<i class="bi bi-plus-circle ms-1"></i></a>
        </div>
    </div>

    <h2>Danh sách sự kiện</h2>
    <div class="table-responsive">
        <table class="table table-sm">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Sự kiện</th>
                    <th scope="col">Ảnh bìa</th>
                    <th scope="col">Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                @isset($events)
                    @foreach ($events as $event)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>
                            <a href="{{route('admin.edit.event',$event->id)}}" id="link">
                                {{$event->name}}
                            </a>
                        </td>
                        <td>
                            <a href="{{route('admin.edit.event',$event->id)}}" id="link">
                                <img src="{{ asset('public/uploads/'.$event->image) }}" alt="" style="max-width: 400px">
                            </a>
                        </td>
                        <td>
                            <a href="{{ route('admin.destroy.event',$event->id) }}" type="button" class="btn btn-sm {{ $event->getStatus($event->is_active)['class'] }}">
                                {{ $event->getStatus($event->is_active)['name'] }}
                            </a>
                        </td>
                    </tr>
                    @endforeach
                @endisset
            </tbody>
        </table>
    </div>
    {{ $events->links('components.pagination') }}
@endsection
