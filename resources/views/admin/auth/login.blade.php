
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Đăng nhập | Cosmetics</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/dashboard/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <meta name="theme-color" content="#712cf9">
    <link rel="shortcut icon" href="{{ asset('public/images/cosmetics.png') }}" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <!-- Custom styles for this template -->
    <link href="{{ asset('public/admin/css/style.css') }}" rel="stylesheet">

  </head>
  <body class="text-center body">
    
    <main class="form-signin w-100 m-auto">
      @include('components.alert')
      <form method="POST">
        @csrf
        <img class="mb-4" src="{{asset('public/images/cosmetics.png')}}" alt="" width="72" height="72">
        <h1 class="h3 mb-3 fw-normal">Đăng nhập</h1>
        <div class="form-floating">
          <input type="email" name="email" class="form-control" id="floatingInput" placeholder="name@example.com" required>
          <label for="floatingInput">Email</label>
          @if($errors->has('email'))
              <div class="error-text">
                  {{$errors->first('email')}}
              </div>
          @endif
        </div>
        <div class="form-floating">
          <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password" required>
          <label for="floatingPassword">Mật khẩu</label>
          @if($errors->has('password'))
              <div class="error-text">
                  {{$errors->first('password')}}
              </div>
          @endif
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Đăng nhập</button>
      </form>
    </main>

  </body>
</html>
