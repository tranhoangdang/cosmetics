<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('adminID');
            $table->string('name')->unique();
            $table->string('slug')->index();
            $table->integer('categoryID');
            $table->string('brand');
            $table->string('origin');
            $table->tinyInteger('skin')->default(0)->index();
            $table->string('exp')->nullable();
            $table->longText('description');
            $table->string('image');
            $table->integer('price');
            $table->integer('qty');
            $table->integer('sold')->default(0)->index();
            $table->integer('view')->default(0)->index();
            $table->tinyInteger('is_active')->default(1)->index();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
