@if(\Session::has('success'))
    <div class="alert alert-success alert-dismissible">
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Thành công!</strong> {{\Session::get('success')}}
    </div>
    @endif
    @if(\Session::has('danger'))
    <div class="alert alert-danger alert-dismissible">
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Thất bại!</strong> {{\Session::get('danger')}}
    </div>
@endif