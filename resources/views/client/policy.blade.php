@extends('client.layouts.app')

@section('title',$policy->name)

@section('content')
<div class="container-fluid mt-3">
    <div class="row">
        <div class="col-11 col-md-9 m-auto">
            <h2 class="fw-bold">{{isset($policy->name) ? $policy->name : 'Đang cập nhật'}}</h2>
            <p class="mt-3 ms-5">{!! isset($policy->content) ? $policy->content : 'Đang cập nhật' !!}</p>
        </div>
    </div>
</div>
@endsection