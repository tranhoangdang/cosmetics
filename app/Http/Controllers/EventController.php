<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Event;

class EventController extends Controller
{
    public function index(){
        $events = Event::where([
            'is_active' => Event::STATUS_PUBLIC
        ])->paginate(10);
        return view('client.event.index',compact('events'));
    }

    public function detail($slug){
        $event = Event::where([
            'slug' => $slug
        ])->first();
        return view('client.event.detail',compact('event'));
    }
}
