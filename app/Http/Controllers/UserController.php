<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Auth;
use App\Models\User;
use Illuminate\Support\Str;
use App\Http\Requests\RequestChangePassword;
use Hash;
use App\Models\Order;
use App\Models\Invoice;

class UserController extends Controller
{
    public function index(){
        $user = User::find(Auth::guard('web')->user()->id);
        return view('client.profile.index',compact('user'));
    }

    public function store(Request $request){
        $user = User::find(Auth::guard('web')->user()->id);

        $user->name = $request->name;
        if(isset($request->image)){
            $newImageName = time() . '.' . $request->image->extension();
            $request->image->move(public_path('uploads/'), $newImageName);
            $user->image = $newImageName;
        }
        $user->update();

        return redirect()->back()->with("success","Thông tin đã được thay đổi");
    }

    public function changePassword(){
        return view('client.profile.change_password');
    }

    public function postChangePassword(RequestChangePassword $request){
        $user = User::find(Auth::guard('web')->user()->id);
        if(Hash::check($request->password, $user->password)){
            if($request->new_password == $request->re_password){
                $user->password = bcrypt($request->new_password);
                $user->save();
                return redirect()->back()->with("success","Mật khẩu đã được thay đổi");
            }
            return redirect()->back()->with("danger","Mật khẩu không trùng khớp");
        }
        return redirect()->back()->with("danger","Mật khẩu hiện không đúng");
    }

    public function order(){
        $orders = Order::where([
            'userID' => Auth::guard('web')->user()->id
        ])->orderByDesc('id');

        $orders = $orders->paginate(10);

        return view('client.profile.order',compact('orders'));
    }

    public function orderDetail($id){
        $order = Order::where([
            'id' => $id,
            'userID' => Auth::guard('web')->user()->id
        ])->orderByDesc('id')->first();

        if($order){
            $invoices = Invoice::with('products')->where([
                'orderID' => $id
            ])->get();
    
            $viewData = [
                'order' => $order,
                'invoices' => $invoices
            ];
    
            return view('client.profile.detail',$viewData);
        }
        return redirect()->route('home');
    }
}
