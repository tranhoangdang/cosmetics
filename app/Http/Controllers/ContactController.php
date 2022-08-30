<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests\RequestContact;
use App\Models\Contact;

class ContactController extends Controller
{
    public function index(){
        return view('client.contact');
    }

    public function store(RequestContact $request){
        $contact = new Contact();
        $contact->email = $request->email;
        $contact->phone = $request->phone;
        $contact->orderID = $request->orderID;
        $contact->title = $request->title;
        $contact->content = $request->content;
        $contact->save();
        return redirect()->back()->with("success","Liên hệ đã được gửi");
    }
}
