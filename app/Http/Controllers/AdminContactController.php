<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Contact;

class AdminContactController extends Controller
{
    public function index(){
        $contacts = Contact::paginate(5);
        return view('admin.contact.index',compact('contacts'));
    }

    public function detail($id){
        $contact = Contact::find($id);
        return view('admin.contact.detail',compact('contact'));
    }

    public function destroy($id){
        $contact = Contact::find($id);
        $contact->is_active = $contact->is_active ? 0 : 1;
        $contact->save();
        return redirect()->back();
    }
}
