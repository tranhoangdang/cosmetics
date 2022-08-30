@extends('admin.layouts.master')

@section('title', 'Liên hệ')

@section('content')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('admin.home') }}">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Liên hệ</li>
            </ol>
        </nav>
    </div>

    <h2>Danh sách liên hệ</h2>
    <div class="table-responsive">
        <table class="table table-sm">
            <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Tiêu đề</th>
                    <th scope="col">Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                @isset($contacts)
                    @foreach ($contacts as $contact)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>
                            <a href="{{ route('admin.detail.contact',$contact->id) }}" id="link">{{ $contact->title }}</a>
                        </td>
                        <td>
                            <a href="{{ route('admin.destroy.contact',$contact->id) }}" type="button" class="btn btn-sm {{ $contact->getStatus($contact->is_active)['class'] }}">
                                {{ $contact->getStatus($contact->is_active)['name'] }}
                            </a>
                        </td>
                    </tr>
                    @endforeach
                @endisset
            </tbody>
        </table>
    </div>
    {{ $contacts->links('components.pagination') }}
@endsection
