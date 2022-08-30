<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Http\Requests\RequestPayment;
use Auth;
use App\Models\Order;
use App\Models\Invoice;
use App\Models\Product;
use Carbon\Carbon;
use Mail;

class PaymentController extends Controller
{
    public function payment(){
        $items = Cart::where([
            'userID' => Auth::guard('web')->user()->id
        ])->get();

        return view('client.payment',compact('items'));
    }

    public function postPayment(RequestPayment $request){
        $items = Cart::where([
            'userID' => Auth::guard('web')->user()->id
        ])->get();

        $total = 0;

        foreach($items as $item){
            $total += $item->products->price * $item->qty;
        }

        $delivery = 0;
        if ($total <= 500000)
        {
            $total = $total + 30000;
            $delivery = 30000;
        }

        $orderID = Order::insertGetId([
            'userID' => Auth::guard('web')->user()->id,
            'name' => $request->name,
            'phone' => $request->phone,
            'address' => $request->address,
            'note' => $request->note,
            'total' => $total,
            'delivery' => $delivery,
            'created_at' => Carbon::now(),
        ]);

        if($orderID)
        {
            foreach ($items as $item)
            {
                $product = Product::find($item->productID);
                $product->qty = $product->qty - $item->qty;
                $product->sold = $product->sold + $item->qty;
                $product->save();

                $invoice = Invoice::insert([
                    'orderID' => $orderID,
                    'productID' => $item->productID,
                    'qty' => $item->qty,
                    'price' => $item->products->price,
                    'created_at' => Carbon::now(),
                ]);

                if($item->qty > $product->qty){
                    $item->qty = $product->qty;
                    $item->update();
                }
            }
        }

        foreach($items as $item){
            $carts = Cart::where([
                'productID' => $item->productID
            ])->get();
    
            foreach ($carts as $cart)
            {
                $product = Product::find($item->productID);
    
                if($cart->qty > $product->qty){
                    $cart->qty = $product->qty;
                    $cart->update();
                }
            }
        }

        $email = Auth::guard('web')->user()->email;

        $data = [
            'orderID' => $orderID,
            'name' => $request->name,
            'total' => $total,
        ];

        \Mail::send('emails.bill', $data, function ($message) use ($email) {
            $message->to($email);
            $message->subject('Cosmetics - Xác nhận đơn hàng');
        });

        foreach($items as $item){
            $item->delete();
        }

        return redirect()->route('cart')->with('success','Đã thanh toán thành công');
    }
}
