<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product;

class ProductController extends Controller
{
    public function index(Request $request){
        $categories = Category::where([
            'is_active' => Category::STATUS_PUBLIC
        ])->get();

        $products = Product::where([
            ['is_active', '=', Product::STATUS_PUBLIC],
            ['qty','>',0]
        ]);

        if($request->sort){
            if($request->sort == 'popular'){
                $products = $products->orderByDesc('view');
            }
            elseif($request->sort == 'best-seller'){
                $products = $products->orderByDesc('sold');
            }
            elseif($request->sort == 'new'){
                $products = $products->orderByDesc('created_at');
            }
            elseif($request->sort == 'asc'){
                $products = $products->orderBy('price');
            }
            elseif($request->sort == 'desc'){
                $products = $products->orderByDesc('price');
            }
        }
        else{
            $products = $products->orderByDesc('id');
        }

        if($request->search){
            $products = $products->where('name','like','%'.$request->search.'%')->paginate(12);
            $products->appends(['search' => $request->search]);
        }
        else{
            $products = $products->paginate(12);

        }

        return view('client.product.index',compact('categories','products'));
    }

    public function detail(Request $request, $slug){
        $product = Product::where([
            'slug' => $slug
        ])->first();

        $products = Product::where([
            ['id', '<>', $product->id],
            ['categoryID', '=', $product->categoryID],
            ['is_active', '=', Product::STATUS_PUBLIC],
            ['qty','>', 0]
        ])->orderByDesc('sold')->limit(6)->get();

        $product->view++;
        $product->update();
        return view('client.product.detail',compact('product','products'));
    }

    public function category(Request $request, $slug){
        $categories = Category::where([
            'is_active' => Category::STATUS_PUBLIC
        ])->get();

        $category = Category::where('slug',$slug)->first();

        $products = Product::where([
            ['categoryID', '=', $category->id],
            ['is_active', '=', Product::STATUS_PUBLIC],
            ['qty','>',0]
        ]);

        if($request->sort){
            if($request->sort == 'popular'){
                $products = $products->orderByDesc('view');
            }
            elseif($request->sort == 'best-seller'){
                $products = $products->orderByDesc('sold');
            }
            elseif($request->sort == 'new'){
                $products = $products->orderByDesc('created_at');
            }
            elseif($request->sort == 'asc'){
                $products = $products->orderBy('price');
            }
            elseif($request->sort == 'desc'){
                $products = $products->orderByDesc('price');
            }
        }
        else{
            $products = $products->orderByDesc('id');
        }

        $products = $products->paginate(12);

        return view('client.product.index',compact('categories','category','products'));
    }
}
