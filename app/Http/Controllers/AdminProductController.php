<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product;
use App\Http\Requests\RequestProduct;
use Illuminate\Support\Str;
use Excel;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Auth;

class AdminProductController extends Controller
{
    public function index(Request $request)
    {
        $products = Product::orderByDesc('id');

        if($request->search){
            $products->where('name','like','%'.$request->search.'%');
        }

        $products = $products->paginate(5);
        return view('admin.product.index',compact('products'));
    }

    public function create()
    {
        $categories = Category::get();
        return view('admin.product.create',compact('categories'));
    }

    public function store(RequestProduct $request)
    {
        $product = new Product();
        $product->name = $request->name;
        $product->slug = Str::slug($request->name);
        $product->adminID = Auth::guard('webadmin')->user()->id;
        $product->categoryID = $request->category;
        if($product->categoryID == 1){
            $product->skin = $request->skin;
        }
        $product->brand = $request->brand;
        $product->origin = $request->origin;
        $product->exp = $request->exp;
        $product->description = $request->description;
        $product->price = $request->price;
        $product->qty = $request->qty;
        $product->is_active = $request->status;
        $newImageName = time() . '.' . $request->image->extension();
        $request->image->move(public_path('uploads/'), $newImageName);
        $product->image = $newImageName;
        $product->save();
        return redirect()->back()->with("success","Sản phẩm đã được thêm");
    }

    public function getCategories()
    {
        return Category::all();
    }

    public function edit($id)
    {
        $product = Product::find($id);
        $categories = $this->getCategories($id);
        $categories = $categories->where('id','<>',$product->categoryID);
        return view('admin.product.edit',compact('product','categories'));
    }

    public function update(Request $request, $id)
    {
        $product = Product::find($id);
        $product->name = $request->name;
        $product->slug = Str::slug($request->name);
        $product->categoryID = $request->category;
        if($product->categoryID == 1){
            $product->skin = $request->skin;
        }
        else{
            $product->skin = 0;
        }
        $product->brand = $request->brand;
        $product->origin = $request->origin;
        $product->exp = $request->exp;
        $product->description = $request->description;
        $product->price = $request->price;
        $product->qty = $request->qty;
        if(isset($request->image)){
            $newImageName = time() . '.' . $request->image->extension();
            $request->image->move(public_path('uploads/'), $newImageName);
            $product->image = $newImageName;
        }
        $product->save();
        return redirect()->back()->with("success","Thông tin sản phẩm đã được thay đổi");
    }

    public function destroy($id)
    {
        $product = Product::find($id);
        $product->is_active = $product->is_active ? 0 : 1;
        $product->save();
        return redirect()->back();
    }

    public function export(){
        return Excel::download(new DataExport, 'danh-sach-san-pham.csv');
    }
}

class DataExport implements FromCollection, WithHeadings {
    public function headings():array{
        return[
            'Mã sản phẩm',
            'Tên sản phẩm',
            'Mã danh mục',
            'Thương hiệu',
            'Xuất xứ',
            'Giá',
            'Số lượng',
            'Trạng thái'
        ]; }
    public function collection(){
        return Product::select('id','name','categoryID','brand','origin','price','qty','is_active')->get();
    }
}