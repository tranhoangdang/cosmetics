<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Admin;
use Auth;
use Hash;

class AdminProfileController extends Controller
{
    public function index(){
        $profile = Admin::find(Auth::guard('webadmin')->user()->id);
        return view('admin.profile.index',compact('profile'));
    }

    public function updateProfile(Request $request){
        $profile = Admin::find(Auth::guard('webadmin')->user()->id)->update($request->except('_token'));
        return redirect()->back()->with("success","Thông tin đã được thay đổi");
    }

    public function changePassword(){
        return view('admin.profile.password');
    }

    public function updatePassword(Request $request){
        $profile = Admin::find(Auth::guard('webadmin')->user()->id);
        if(Hash::check($request->old_password, $profile->password)){
            if($request->new_password == $request->re_password){
                $profile->password = bcrypt($request->new_password);
                $profile->save();
                return redirect()->back()->with("success","Mật khẩu đã được thay đổi");
            }
            return redirect()->back()->with("danger","Mật khẩu không trùng khớp");
        }
        return redirect()->back()->with("danger","Mật khẩu cũ không đúng");
    }
}