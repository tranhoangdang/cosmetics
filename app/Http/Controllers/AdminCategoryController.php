<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Http\Requests\RequestCategory;
use Illuminate\Support\Str;
use Excel;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Auth;
class AdminCategoryController extends Controller
{
    public function index(Request $request)
    {
        $categories = Category::orderByDesc('id');

        if($request->search){
            $categories->where('name','like','%'.$request->search.'%');
        }

        $categories = $categories->paginate(15);

        return view('admin.category.index',compact('categories'));
    }

    public function create()
    {
        return view('admin.category.create');
    }

    public function store(RequestCategory $request)
    {
        $category = new Category();
        $category->name = $request->name;
        $category->slug = Str::slug($request->name);
        $category->adminID = Auth::guard('webadmin')->user()->id;
        $category->is_active = $request->status;
        $category->save();
        return redirect()->back()->with("success","Danh mục '".$category->name."' đã được thêm");
    }

    public function edit($id)
    {
        $category = Category::find($id);
        return view('admin.category.edit',compact('category'));
    }

    public function update(RequestCategory $request, $id)
    {
        $category = Category::find($id);
        $category->name = $request->name;
        $category->update($request->except('_token'));
        return redirect()->back()->with("success","Danh mục '".$category->name."' đã được cập nhật");
    }

    public function destroy($id)
    {
        $category = Category::find($id);
        $category->is_active = $category->is_active ? 0 : 1;
        $category->save();
        return redirect()->back();
    }

    public function export(){
        return Excel::download(new DataExport, 'danh-sach-danh-muc.csv');
    }
}

class DataExport implements FromCollection, WithHeadings {
    public function headings():array{
        return[
            'Mã danh mục',
            'Tên danh mục',
            'Trạng thái'
        ]; }
    public function collection(){
        return Category::select('id','name','is_active')->get();
    }
}