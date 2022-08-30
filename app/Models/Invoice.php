<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;

    protected $table = "invoices";
    protected $guarded = [];

    public function order()
    {
        return $this->belongsTo(Order::class,'orderID');
    }

    public function products()
    {
        return $this->belongsTo(Product::class,'productID','id');
    }
}