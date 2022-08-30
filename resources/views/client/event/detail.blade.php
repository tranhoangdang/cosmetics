@extends('client.layouts.app')

@section('title', 'Chi tiết sự kiện')

@section('content')
<div class="container-fluid mt-4">
    <h1 class="fw-bold mb-4">{{$event->name}}</h1>
    <img src="{{asset('public/uploads/'.$event->image)}}" class="d-block w-100 mb-4" alt="">
    {!!$event->content!!}
</div>
@endsection