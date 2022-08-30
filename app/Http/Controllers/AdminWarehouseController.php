<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use App\Models\Product;
use Carbon\Carbon;

class AdminWarehouseController extends Controller
{
    public function index(Request $request)
    {
        $products = Product::orderByDesc('id')->where([
            'is_active' => Product::STATUS_PUBLIC
        ]);

        if($request->sort && $request->sort == 'ton-kho')
        {
            $products->where('updated_at','<', Carbon::now()->subDays(30));
        }
        else
        {
            $products->where('qty','<=',10);
        }

        if($request->search){
            $products->where('name','like','%'.$request->search.'%');
        }

        $products = $products->paginate(5);
        return view('admin.warehouse.index',compact('products'));
    }
}
