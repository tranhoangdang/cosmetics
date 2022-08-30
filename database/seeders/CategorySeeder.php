<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('categories')->delete();

        \DB::table('categories')->insert([
            'name' => 'Chăm sóc da',
            'slug' => Str::slug('Chăm sóc da'),
        ]);
    }
}
