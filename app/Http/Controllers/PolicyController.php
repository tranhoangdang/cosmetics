<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Policy;

class PolicyController extends Controller
{
    public function aboutUs(){
        $policy = Policy::where([
            'type' => Policy::ABOUT_US
        ])->first();

        return view('client.policy',compact('policy'));
    }

    public function returnPolicy(){
        $policy = Policy::where([
            'type' => Policy::RETURN_POLICY
        ])->first();

        return view('client.policy',compact('policy'));
    }

    public function termOfService(){
        $policy = Policy::where([
            'type' => Policy::TERM_OF_SERVICE
        ])->first();

        return view('client.policy',compact('policy'));
    }

    public function shoppingGuide(){
        $policy = Policy::where([
            'type' => Policy::SHOPPING_GUIDE
        ])->first();

        return view('client.policy',compact('policy'));
    }
}
