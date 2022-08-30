<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class PolicySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('policies')->delete();

        \DB::table('policies')->insert([
            [
                'name' => 'Về chúng tôi',
                'slug' => Str::slug('Về chúng tôi'),
                'type' => 1
            ],
            [
                'name' => 'Chính sách đổi trả',
                'slug' => Str::slug('Chính sách đổi trả'),
                'type' => 2
            ],
            [
                'name' => 'Điều khoản dịch vụ',
                'slug' => Str::slug('Điều khoản dịch vụ'),
                'type' => 3
            ],
            [
                'name' => 'Hướng dẫn mua hàng',
                'slug' => Str::slug('Hướng dẫn mua hàng'),
                'type' => 4
            ]
        ]);
    }
}
