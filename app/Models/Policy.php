<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;

class Policy extends Model
{
    use HasFactory;

    protected $table = "policies";
    protected $guarded = [];

    const ABOUT_US = 1;
    const RETURN_POLICY = 2;
    const TERM_OF_SERVICE = 3;
    const SHOPPING_GUIDE = 4;

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
}
