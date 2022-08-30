<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Event;
use App\Http\Requests\RequestEvent;
use Illuminate\Support\Str;
use Auth;

class AdminEventController extends Controller
{
    public function index(Request $request){
        $events = Event::orderByDesc('id');

        if($request->search){
            $events->where('name','like','%'.$request->search.'%');
        }

        $events = $events->paginate(5);
        return view('admin.event.index',compact('events'));
    }

    public function create()
    {
        return view('admin.event.create');
    }

    public function store(RequestEvent $request){
        $event = new Event();
        $event->name = $request->name;
        $event->slug = Str::slug($request->name);
        $event->adminID = Auth::guard('webadmin')->user()->id;
        $event->is_active = $request->status;
        $newImageName = time() . '.' . $request->image->extension();
        $request->image->move(public_path('uploads/'), $newImageName);
        $event->image = $newImageName;
        $event->content = $request->content;
        $event->save();
        return redirect()->back()->with("success","Sự kiện đã được thêm");
    }

    public function edit($id)
    {
        $event = Event::find($id);
        return view('admin.event.edit',compact('event'));
    }

    public function update(Request $request, $id)
    {
        $event = Event::find($id);
        $event->name = $request->name;
        $event->slug = Str::slug($request->name);
        if(isset($request->image)){
            $newImageName = time() . '.' . $request->image->extension();
            $request->image->move(public_path('uploads/'), $newImageName);
            $event->image = $newImageName;
        }
        $event->content = $request->content;
        $event->save();
        return redirect()->back()->with("success","Sự kiện đã được thay đổi");
    }

    public function destroy($id)
    {
        $event = Event::find($id);
        $event->is_active = $event->is_active ? 0 : 1;
        $event->save();
        return redirect()->back();
    }
}
