<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\User;
use Auth;
use App\Http\Requests\RequestLogin;
use App\Http\Requests\RequestRegister;
use App\Http\Requests\RequestForgetPassword;
use App\Http\Requests\RequestResetPassword;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Cookie;
use Carbon\Carbon;

class AuthController extends Controller
{
    public function login(){
        return view('client.auth.login');
    }

    public function postLogin(RequestLogin $request){
        $email = $request->email;

        $user = User::where('email', '=', $request->email)->first();

        if(isset($user)){
            if(Hash::check($request->password,$user->password)){
                if(Auth::attempt(['email' => $request->email, 'password' => $request->password, 'is_active' => 1])){
                    /* \Cookie::queue('cosmetics', $request->email, 43200); */
                    return redirect()->route('home'); 
                }
                else{
                    $token = bcrypt(md5(time().Str::random(20)));
                    $user->remember_token = $token;
                    $user->update();

                    $data = [
                        'email' => $email,
                        'token' => $user->remember_token
                    ];
        
                    \Mail::send('emails.register', $data, function ($message) use ($email) {
                        $message->to($email);
                        $message->subject('Cosmetics - Xác nhận tài khoản');
                    });
                    return redirect()->back()->with('danger','Tài khoản chưa được kích hoạt. Vui lòng kiểm tra email.');
                }
            }
            else{
                return redirect()->back()->with('danger','Mật khẩu không hợp lệ. Vui lòng nhập lại.');
            }
        }
        else{
            return redirect()->back()->with('danger','Tài khoản không tồn tại. Vui lòng đăng ký.');
        }
    }

    public function register(){
        return view('client.auth.register');
    }

    public function postRegister(RequestRegister $request){
        if($request->password == $request->re_password){
            $email = $request->email;
            $token = bcrypt(md5(time().Str::random(20)));

            $user = new User();
            $user->email = $email;
            $user->password = bcrypt($request->password);
            $user->remember_token = $token;
            $user->save();

            $data = [
                'email' => $email,
                'token' => $token
            ];

            \Mail::send('emails.register', $data, function ($message) use ($email) {
                $message->to($email);
                $message->subject('Cosmetics - Xác nhận tài khoản');
            });
            return redirect()->back()->with('success','Tài khoản đã được đăng ký. Vui lòng kiểm tra email để xác nhận tài khoản.');
        }
        return redirect()->back()->with('danger','Mật khẩu không trùng khớp. Vui lòng nhập lại.');
    }

    public function verifyEmail(Request $request){
        $user = User::where([
            'email' => $request->email,
            'remember_token' => $request->token,
        ])->first();

        if($user){
            $user->is_active = 1;
            $user->remember_token = null;
            $email_verified_at = Carbon::now();
            $user->update();

            return redirect()->route('login')->with('success',"Tài khoản $request->email đã được xác nhận thành công. Vui lòng đăng nhập để tiếp tục.");
        }
        else{
            return redirect()->route('login')->with('danger',"Đường dẫn xác nhận tài khoản không hợp lệ. Vui lòng thử lại.");
        }
        
    }

    public function forgetPassword(){
        return view('client.auth.forgetPassword');
    }

    public function postForgetPassword(RequestForgetPassword $request){
        $email = $request->email;
        $user = User::where('email', '=', $email)->first();
        if(isset($user)){
            $token = bcrypt(md5(time().Str::random(20)));
            $user->remember_token = $token;
            $user->update();

            $data = [
                'email' => $email,
                'token' => $token
            ];

            \Mail::send('emails.reset', $data, function ($message) use ($email) {
                $message->to($email);
                $message->subject('Cosmetics - Lấy lại mật khẩu');
            });
            return redirect()->back()->with('success','Vui lòng kiểm tra email để lấy lại mật khẩu.'); 
        }
        else{
            return redirect()->back()->with('danger','Tài khoản không tồn tại. Vui lòng kiểm tra lại.');
        }
    }

    public function resetPassword(Request $request){
        $user = User::where([
            'email' => $request->email,
            'remember_token' => $request->token,
        ])->first();

        if($user){
            return view('client.auth.reset');
        }
        else{
            return redirect()->route('forgetPassword')->with('danger',"Đường dẫn lấy lại mật khẩu không hợp lệ. Vui lòng thử lại.");
        }
    }

    public function postResetPassword(RequestResetPassword $request){
        if($request->password == $request->re_password){
            $user = User::where([
                'email' => $request->email,
                'remember_token' => $request->token,
            ])->first();
            $user->password = bcrypt($request->password);
            $user->remember_token = null;
            $user->update();

            return redirect()->route('login')->with('success','Mật khẩu đã được cập nhật. Vui lòng đăng nhập để tiếp tục.');
        }
        return redirect()->back()->with('danger','Mật khẩu không trùng khớp. Vui lòng nhập lại.');
    }

    public function logout(){
        Auth::logout();
        /* \Cookie::queue(\Cookie::forget('cosmetics')); */
        return redirect()->back();
    }
}
