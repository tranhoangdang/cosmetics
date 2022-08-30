<?php

namespace App\Http\Controllers;
use Auth;
use Illuminate\Http\Request;
use App\Http\Requests\RequestAdmin;

class AdminAuthController extends Controller
{
    public function getLogin(){
        if (Auth::guard('webadmin')->check()) {
            return redirect()->route('admin.home');
        } else {
            return view('admin.auth.login');
        }
    }

    public function postLogin(RequestAdmin $request){
        $login = [
            'email' => $request->email,
            'password' => $request->password,
            'is_active' => 1
        ];
        if (Auth::guard('webadmin')->attempt($login)) {
            return redirect()->route('admin.home');
        } else {
            return redirect()->back()->with('danger','Tên đăng nhập hoặc mật khẩu không đúng');
        }
    }

    public function getLogout(){
        Auth::guard('webadmin')->logout();

        return redirect()->route('admin.login'); 
    }
}
