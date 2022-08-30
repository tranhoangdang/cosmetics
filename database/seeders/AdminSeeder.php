<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('admins')->delete();

        \DB::table('admins')->insert([
            'name' => 'Trần Hoàng Đăng',
            'email' => 'tranhoangdang1402@gmail.com',
            'password' => bcrypt('12345678')
        ]);
    }
}
