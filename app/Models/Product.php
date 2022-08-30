<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use Auth;

class Product extends Model
{
    protected $table = "products";
    protected $guarded = [];

    const STATUS_PUBLIC = 1;
    const STATUS_PRIVATE = 0;
    
    const ALL_SKIN = 1;
    const NORMAL_SKIN = 2;
    const DRY_SKIN = 3;
    const OILY_SKIN = 4;
    const COMBINATION_SKIN = 5;
    const SENSITIVE_SKIN = 6;

    protected $status = [
        1 => [
            'name' => 'Hiển thị',
            'class' => 'btn-success'
        ],
        0 => [
            'name' => 'Ẩn',
            'class' => 'btn-danger'
        ]
    ];

    protected $skin = [
        1 => [
            'name' => 'Mọi loại da',
        ],
        2 => [
            'name' => 'Da thường',
        ],
        3 => [
            'name' => 'Da khô',
        ],
        4 => [
            'name' => 'Da dầu',
        ],
        5 => [
            'name' => 'Da hỗn hợp',
        ],
        6 => [
            'name' => 'Da nhạy cảm',
        ]
    ];

    public function getStatus(){
        return Arr::get($this->status,$this->is_active);
    }

    public function getSkintype(){
        return Arr::get($this->skin,$this->skin);
    }

    public function category()
    {
        return $this->belongsTo(Category::class,'categoryID');
    }

    public static function cartCount(){
        if(Auth::check()){
            $user_id = Auth::guard('web')->user()->id;
            $cartCount = Cart::where('userID',$user_id)->count('id');
            return $cartCount;
        }
    }

}