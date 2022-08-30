@extends('client.layouts.app')

@section('title','Thông tin cá nhân')

@section('content')
    <div class="text-center mb-4">
        <h2 class="fw-bold px-5"><span class="px-2">Thông tin cá nhân</span></h2>
    </div>
    <div class="row px-3">
        <div class="col-12 col-md-8 m-auto">
            @include('components.alert')
            <div class="bg-primary border rounded p-xl-5 p-3">
                <form method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="col-12 col-md-4 mb-3">
                            <label for="image"><img src="{{asset(isset($user->image) ? 'public/uploads/'.$user->image : 'public/images/default-img.png')}}" class="img-fluid w-75 rounded-circle" id="frame" alt=""></label>
                            <input type="file" name="image" id="image" accept="image/*" onchange="preview(event)"/>
                        </div>
                        <div class="col-12 col-md-8 my-lg-auto">
                            <div class="mb-3">
                                <label for="name" class="form-label">Tên :</label>
                                <input type="text" class="form-control" id="name" name="name" value="{{$user->name}}" placeholder="Nhập tên khách hàng">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" value="{{$user->email}}" disabled>
                            </div>
                            <button type="submit" class="btn btn-primary px-5">Lưu thay đổi</button>
                        </div>
                    </div>
                </form>
            </div>
            
        </div>
    </div>
@endsection