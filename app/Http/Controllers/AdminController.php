<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Contact;
use App\Models\Product;

class AdminController extends Controller
{
    public function index(){

        $orders = Order::orderByDesc('created_at')->limit(5)->get();

        $contacts = Contact::orderByDesc('created_at')->limit(5)->get();

        $products = Product::where([
            ['is_active','=',Product::STATUS_PUBLIC],
            ['qty','<=',10]
        ])->orderByDesc('created_at')->limit(3)->get();

        $viewData = [
            'orders' => $orders,
            'contacts' => $contacts,
            'products' => $products
        ];

        return view('admin.index',$viewData);
    }
}