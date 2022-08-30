@extends('client.layouts.app')

@section('title', 'Sự kiện')

@section('content')
    <div class="container-fluid">
        <div class="text-center mb-4">
            <h2 class="fw-bold px-5"><span class="px-2">Sự kiện</span></h2>
        </div>
        <div class="row">
            @foreach ($events as $event)
                <div class="col-md-6 col-12 mb-3">
                    <a class="card text-decoration-none" href="{{route('event.detail',$event->slug)}}">
                        <img src="{{asset('public/uploads/'.$event->image)}}" class="d-block w-100" alt="">
                        <div class="card-body">
                            <h6 class="card-text text-truncate text-black">{{$event->name}}</h6>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
        @empty($event)
            <h5 class="text-center fw-bold text-primary">Đang cập nhật</h5>
        @endempty
        {{$events->links('components.pagination')}}
    </div>
@endsection