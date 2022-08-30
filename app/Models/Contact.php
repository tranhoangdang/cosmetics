<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;

class Contact extends Model
{
    use HasFactory;

    protected $table = "contacts";
    protected $guarded = [];

    const STATUS_RESOLVE = 1;
    const STATUS_NOT_RESOLVE = 0;

    protected $status = [
        1 => [
            'name' => 'Đã giải quyết',
            'class' => 'btn-success'
        ],
        0 => [
            'name' => 'Chưa giải quyết',
            'class' => 'btn-secondary'
        ]
    ];

    public function getStatus(){
        return Arr::get($this->status,$this->is_active);
    }
}
