<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Event;
use Mail;

class HomeController extends Controller
{
    public function index(){
        $events = Event::where([
            'is_active' => Event::STATUS_PUBLIC
        ])->orderByDesc('created_at')->get();

        $newProducts = Product::where([
            ['is_active','=',Product::STATUS_PUBLIC],
            ['qty','>',0]
        ])->orderByDesc('created_at')->limit(6)->get();

        $bestSeller = Product::where([
            ['is_active','=',Product::STATUS_PUBLIC],
            ['qty','>',0]
        ])->orderByDesc('sold')->limit(12)->get();

        $trending = Product::where([
            ['is_active','=',Product::STATUS_PUBLIC],
            ['qty','>',0]
        ])->orderByDesc('view')->limit(12)->get();

        $viewData = [
            'events' => $events,
            'newProducts' => $newProducts,
            'bestSeller' => $bestSeller,
            'trending' => $trending
        ];
        return view('client.index',$viewData);
    }

}