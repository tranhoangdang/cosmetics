<?php
use App\Http\Controllers\Controller;
use App\Models\Product;
$cartCount = Product::cartCount();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title')</title>
    <link rel="shortcut icon" href="{{ asset('public/images/cosmetics.png') }}" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Roboto+Slab:wght@600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="{{ asset('public/client/css/style.css') }}">
</head>
<body class="d-flex flex-column min-vh-100">
    <div class="container-fluid">
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="{{route('home')}}" class="d-flex text-decoration-none">
                    <img src="{{asset('public/images/cosmetics.png')}}" style="width:50px;height:50px" alt="">
                    <h2 class="ms-2 display-6 fw-bold text-primary">Cosmetics</h2>
                </a>
            </div>
            <div class="col-lg-6 col-7 text-start">
                <form method="GET" action="{{route('product')}}">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Tìm kiếm" name="search">
                        <span class="input-group-text bg-primary text-white">
                            <i class="bi bi-search"></i>
                        </span>
                    </div>
                </form>
            </div>
            <div class="col-lg-3 col-5 text-end">
                <a href="{{route('cart')}}" class="btn border">
                    <i class="bi bi-cart-fill text-primary"></i>
                    <span class="badge">
                        {{isset($cartCount) ? $cartCount : '0'}}
                    </span>
                </a>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg">
                    <a href="{{route('home')}}" class="text-decoration-none d-block d-lg-none">
                        <div class="d-flex">
                            <img src="{{asset('public/images/cosmetics.png')}}" style="width:40px;height:40px" alt="">
                            <h1 class="ms-2 display-6 fw-bold text-primary">Cosmetics</h1>
                        </div>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="mynavbar">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a href="{{route('home')}}" class="nav-link {{\Route::is('home') ? 'active' : ''}}">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a href="{{route('product')}}" class="nav-link {{\Route::is('product') || \Route::is('product.*') ? 'active' : ''}}">Sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a href="{{route('event')}}" class="nav-link {{\Route::is('event') || \Route::is('event.*') ? 'active' : ''}}">Sự kiện</a>
                            </li>
                            <li class="nav-item">
                                <a href="{{route('about_us')}}" class="nav-link {{\Route::is('about_us') ? 'active' : ''}}">Về chúng tôi</a>
                            </li>
                            <li class="nav-item">
                                <a href="{{route('contact')}}" class="nav-link {{\Route::is('contact') ? 'active' : ''}}">Liên hệ</a>
                            </li>
                        </ul>
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item">
                                @if (isset(\Auth::guard('web')->user()->id))
                                <div class="dropdown">
                                    <a class="dropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <img src="{{asset(isset(\Auth::guard('web')->user()->image) ? 'public/uploads/'.\Auth::guard('web')->user()->image : 'public/images/default-img.png')}}" class="rounded-circle" style="width:50px;height:50px" alt="">
                                    </a>
                                  
                                    <ul class="dropdown-menu dropdown-menu-end">
                                      <li><a class="dropdown-item" href="{{route('profile')}}">Tài khoản</a></li>
                                      <li><a class="dropdown-item" href="{{route('profile.order')}}">Đơn hàng của tôi</a></li>
                                      <li><a class="dropdown-item" href="{{route('profile.password')}}">Đổi mật khẩu</a></li>
                                      <li><a class="dropdown-item" href="{{route('logout')}}" class="nav-link {{\Route::is('logout') ? 'active' : ''}}">Đăng xuất</a></li>
                                    </ul>
                                  </div>
                                @else
                                <div class="d-flex">
                                    <i class="bi bi-person-fill text-primary my-auto"></i> 
                                    <a href="{{route('login')}}" class="nav-link {{\Route::is('login') ? 'active' : ''}}">
                                        Đăng nhập /
                                    </a>
                                    <a href="{{route('register')}}" class="nav-link {{\Route::is('register') ? 'active' : ''}}">
                                        Đăng ký 
                                    </a>
                                </div>
                                @endif
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>

   <div class="mb-5 px-xl-5">
        @yield('content')
   </div>

    <footer class="pt-5 bg-light mt-auto">
        <div class="container-fluid">
            <div class="row px-xl-5 justify-content-end">
                <div class="col-lg-6 col-sm-12 mb-3">
                    <div class="d-flex">
                        <img src="{{asset('public/images/cosmetics.png')}}" style="width:50px;height:50px" alt="">
                        <h2 class="ms-2 display-6 fw-bold text-primary">Cosmetics</h2>
                    </div>
                    <ul class="list-unstyled d-flex mt-3">
                        <li class="me-3"><a class="border rounded-circle p-2" href="#"><i class="bi bi-twitter" width="24" height="24"></i></a></li>
                        <li class="me-3"><a class="border rounded-circle p-2" href="#"><i class="bi bi-facebook" width="24" height="24"></i></a></li>
                        <li class="me-3"><a class="border rounded-circle p-2" href="#"><i class="bi bi-instagram" width="24" height="24"></i></a></li>
                        <li class="me-3"><a class="border rounded-circle p-2" href="#"><i class="bi bi-linkedin" width="24" height="24"></i></a></li>
                    </ul>
                    <p class="mb-2"><i class="bi bi-geo-fill text-primary me-3"></i>19, Nguyễn Hữu Thọ, Tân Phong, Quận 7, TP.HCM</p>
                    <p class="mb-2"><i class="bi bi-envelope-fill text-primary me-3"></i>tranhoangdang1402@gmail.com</p>
                    <p class="mb-0"><i class="bi bi-telephone-fill text-primary me-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-6 col-sm-12 mb-3">
                    <div class="row">
                        <div class="col-6">
                            <h5 class="fw-bold text-dark mb-4">Sản phẩm</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark text-decoration-none mb-2" href="{{route('product')}}?sort=new"><i class="bi bi-chevron-right mr-2"></i>Sản phẩm mới</a>
                                <a class="text-dark text-decoration-none mb-2" href="{{route('product')}}?sort=best-seller"><i class="bi bi-chevron-right mr-2"></i>Sản phẩm bán chạy</a>
                                <a class="text-dark text-decoration-none mb-2" href="{{route('product')}}?sort=popular"><i class="bi bi-chevron-right mr-2"></i>Sản phẩm phổ biến</a>
                            </div>
                        </div>
                        <div class="col-6">
                            <h5 class="fw-bold text-dark mb-4">Chính sách</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark text-decoration-none mb-2" href="{{route('shopping_guide')}}"><i class="bi bi-chevron-right mr-2"></i>Hướng dẫn mua hàng</a>
                                <a class="text-dark text-decoration-none mb-2" href="{{route('term_of_service')}}"><i class="bi bi-chevron-right mr-2"></i>Điều khoản dịch vụ</a>
                                <a class="text-dark text-decoration-none mb-2" href="{{route('return_policy')}}"><i class="bi bi-chevron-right mr-2"></i>Chính sách đổi trả</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="border-top py-3 px-xl-5">
                <p>© Ứng dụng được phát triển bởi Trần Hoàng Đăng</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{asset('public/client/js/main.js')}}"></script>
</body>
</html>