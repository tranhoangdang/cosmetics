<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Product;
use Auth;

class CartController extends Controller
{
    public function cart(){
        $items = Cart::where([
            'userID' => Auth::guard('web')->user()->id
        ])->get();

        return view('client.cart',compact('items'));
    }

    public function addProduct($id){
        $item = Cart::where([
            'productID' => $id,
            'userID' => Auth::guard('web')->user()->id
        ])->first();

        $product = Product::find($id);

        if($item){
            if($product->qty > $item->qty){
                $item->qty++;
                $item->update();

                return redirect()->back()->with('success','Đã thêm sản phẩm vào giỏ hàng.');
            }
            else{
                return redirect()->back()->with('danger','Số lượng sản phẩm trong kho đã đạt giới hạn.');
            }
        }
        else{
            if($product->qty > 0){
                $cart = new Cart();
                $cart->userID = Auth::guard('web')->user()->id;
                $cart->productID = $id;
                $cart->qty = 1;
                $cart->save();

                return redirect()->back()->with('success','Đã thêm sản phẩm vào giỏ hàng.');
            }
            else{
                return redirect()->back()->with('danger','Số lượng sản phẩm trong kho đã đạt giới hạn.');
            }
        }
        
    }

    public function destroy($id){
        $item = Cart::find($id);
        $item->delete();
        return redirect()->back()->with('success','Đã xóa sản phẩm khỏi giỏ hàng');
    }
}
