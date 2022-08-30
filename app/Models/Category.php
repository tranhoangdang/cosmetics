<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
class Category extends Model
{
    protected $table = "categories";
    protected $guarded = [];

    const STATUS_PUBLIC = 1;
    const STATUS_PRIVATE = 0;

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

    public function getStatus(){
        return Arr::get($this->status,$this->is_active);
    }

    public function products(){
        return $this->hasMany(Product::class,'categoryID');
    }
}
