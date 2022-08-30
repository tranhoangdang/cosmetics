<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Policy;
use App\Http\Requests\RequestPolicy;
class AdminPolicyController extends Controller
{
    public function index(Request $request){
        $policies = Policy::orderByDesc('id');

        if($request->search){
            $policies->where('name','like','%'.$request->search.'%');
        }

        $policies = $policies->paginate(15);

        return view('admin.policy.index',compact('policies'));
    }

    public function edit($id){
        $policy = Policy::find($id);
        return view('admin.policy.edit',compact('policy'));
    }

    public function update(RequestPolicy $request, $id){
        $policy = Policy::find($id);
        $policy->name = $request->name;
        $policy->update($request->except('_token'));
        return redirect()->back()->with("success","Chính sách '".$policy->name."' đã được cập nhật");
    }

    public function destroy($id){
        $policy = Policy::find($id);
        $policy->is_active = $policy->is_active ? 0 : 1;
        $policy->save();
        return redirect()->back();
    }
}
