<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.101.0">
        <title>@yield('title') | Cosmetics</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/dashboard/">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <meta name="theme-color" content="#712cf9">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="{{ asset('public/images/cosmetics.png') }}" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <!-- Custom styles for this template -->
        <link href="{{ asset('public/admin/css/style.css') }}" rel="stylesheet">
        
    </head>
    <body>
    
        <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="{{ route('admin.home') }}">
                Cosmetics
            </a>
            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <form method="GET" class="w-100">
                <input class="form-control form-control-dark rounded-0 border-0" type="text" placeholder="Tìm kiếm" name="search" aria-label="Search">
            </form>
            <div class="navbar-nav">
                <div class="nav-item text-nowrap">
                    <a class="nav-link px-3" href="{{ route('admin.logout') }}">Đăng xuất</a>
                </div>
            </div>
        </header>

        <div class="container-fluid">
            <div class="row">
                <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                    <div class="position-sticky pt-3 sidebar-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link {{\Route::is('admin.home') ? 'active' : ''}}" aria-current="page" href="{{ route('admin.home') }}">
                                    <span data-feather="home" class="align-text-bottom"></span>
                                    Trang chủ
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{\Route::is('admin.category') || Route::is('admin.*.category') ? 'active' : ''}}" href="{{ route('admin.category') }}">
                                    <span data-feather="list" class="align-text-bottom"></span>
                                    Danh mục
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{\Route::is('admin.product') || Route::is('admin.*.product') ? 'active' : ''}}" href="{{ route('admin.product') }}">
                                    <span data-feather="shopping-bag" class="align-text-bottom"></span>
                                    Sản phẩm
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{\Route::is('admin.event') || Route::is('admin.*.event') ? 'active' : ''}}" href="{{ route('admin.event') }}">
                                    <span data-feather="image" class="align-text-bottom"></span>
                                    Sự kiện
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{\Route::is('admin.order') || Route::is('admin.*.order') ? 'active' : ''}}" href="{{ route('admin.order') }}">
                                    <span data-feather="shopping-cart" class="align-text-bottom"></span>
                                    Đơn hàng
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{\Route::is('admin.warehouse') || Route::is('admin.*.warehouse') ? 'active' : ''}}" href="{{ route('admin.warehouse') }}">
                                    <span data-feather="archive" class="align-text-bottom"></span>
                                    Kho
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{\Route::is('admin.contact') || Route::is('admin.*.contact') ? 'active' : ''}}" href="{{ route('admin.contact') }}">
                                    <span data-feather="phone" class="align-text-bottom"></span>
                                    Chăm sóc khách hàng
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{\Route::is('admin.policy') || Route::is('admin.*.policy') ? 'active' : ''}}" href="{{ route('admin.policy') }}">
                                    <span data-feather="clipboard" class="align-text-bottom"></span>
                                    Chính sách
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{\Route::is('admin.profile') || Route::is('admin.*.profile') ? 'active' : ''}}" href="{{ route('admin.profile') }}">
                                    <span data-feather="user" class="align-text-bottom"></span>
                                    Thông tin cá nhân
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-5">
                    @yield('content')
                </main>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/classic/ckeditor.js"></script>
        <script src="{{ asset('public/admin/js/main.js') }}"></script>
        @yield('script')
    </body>
</html>