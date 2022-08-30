@extends('admin.layouts.master')

@section('title', 'Chi tiết liên hệ')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="{{ route('admin.contact') }}">Liên hệ</a><</li>
                <li class="breadcrumb-item active" aria-current="page">Chi tiết liên hệ</li>
            </ol>
        </nav>
    </div>

    <div class="px-xl-5">
        <h3 class="mb-4">{{$contact->title}}</h3>
        <p class="mb-2 pt-3 border-top"><span class="fw-bold me-2">Địa chỉ email: </span>{{$contact->email}}</p>
        <p class="mb-2"><span class="fw-bold me-2">Số điện thoại: </span>{{$contact->phone}}</p>
        @isset($contact->orderID)
            <p class="mb-2"><span class="fw-bold me-2">Mã đơn hàng: </span>{{$contact->orderID}}</p>
        @endisset
        <p class="mb-2"><span class="fw-bold me-2">Nội dung: </span>{{$contact->content}}</p>
        <div>
            <span class="fw-bold me-2">Trạng thái: </span>
            <a href="{{ route('admin.destroy.contact',$contact->id) }}" type="button" class="btn btn-sm {{ $contact->getStatus($contact->is_active)['class'] }}">
                {{ $contact->getStatus($contact->is_active)['name'] }}
            </a>
        </div>
    </div>
@endsection
