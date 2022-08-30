<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\AdminCategoryController;
use App\Http\Controllers\AdminProductController;
use App\Http\Controllers\AdminWarehouseController;
use App\Http\Controllers\AdminAuthController;
use App\Http\Controllers\AdminProfileController;
use App\Http\Controllers\AdminPolicyController;
use App\Http\Controllers\AdminOrderController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\PolicyController;
use App\Http\Controllers\AdminEventController;
use App\Http\Controllers\AdminContactController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::prefix('/')->group(function() {
    Route::get('/', [HomeController::class,'index'])->name('home');

    Route::prefix('/')->group(function() {
        Route::get('/dang-nhap', [AuthController::class,'login'])->name('login');
        Route::post('/dang-nhap', [AuthController::class,'postLogin']);
        Route::get('/dang-ky', [AuthController::class,'register'])->name('register');
        Route::post('/dang-ky', [AuthController::class,'postRegister']);
        Route::get('/xac-nhan-tai-khoan', [AuthController::class,'verifyEmail'])->name('verify');
        Route::get('/quen-mat-khau', [AuthController::class,'forgetPassword'])->name('forgetPassword');
        Route::post('/quen-mat-khau', [AuthController::class,'postForgetPassword']);
        Route::get('/lay-lai-mat-khau', [AuthController::class,'resetPassword'])->name('reset');
        Route::post('/lay-lai-mat-khau', [AuthController::class,'postResetPassword']);
        Route::get('/dang-xuat', [AuthController::class,'logout'])->name('logout');
    });

    Route::middleware('auth:web')->prefix('/')->group(function() {
        Route::get('/them-san-pham/{id}', [CartController::class,'addProduct'])->name('add.cart.items');
        Route::get('/gio-hang', [CartController::class,'cart'])->name('cart');
        Route::get('/xoa-san-pham/{id}', [CartController::class,'destroy'])->name('destroy.cart.items');
        Route::get('/thanh-toan', [PaymentController::class,'payment'])->name('payment');
        Route::post('/thanh-toan', [PaymentController::class,'postPayment']);

        Route::prefix('/thong-tin-ca-nhan')->group(function() {
            Route::get('/', [UserController::class,'index'])->name('profile');
            Route::post('/', [UserController::class,'store']);
            Route::get('/doi-mat-khau', [UserController::class,'changePassword'])->name('profile.password');
            Route::post('/doi-mat-khau', [UserController::class,'postChangePassword']);
            Route::get('/don-hang-cua-toi', [UserController::class,'order'])->name('profile.order');
            Route::get('/chi-tiet-don-hang/{id}', [UserController::class,'orderDetail'])->name('profile.order.detail');
        });
    });


    Route::prefix('/danh-muc')->group(function() {
        Route::get('/{slug}', [ProductController::class,'category'])->name('product.category');
    });

    Route::prefix('/tim-kiem')->group(function() {
        Route::get('/', [ProductController::class,'search'])->name('product.search');
    });

    Route::prefix('/san-pham')->group(function() {
        Route::get('/', [ProductController::class,'index'])->name('product');
        Route::get('/{slug}', [ProductController::class,'detail'])->name('product.detail');
    });

    Route::prefix('/lien-he')->group(function() {
        Route::get('/', [ContactController::class,'index'])->name('contact');
        Route::post('/', [ContactController::class,'store']);
    });

    Route::prefix('/su-kien')->group(function() {
        Route::get('/', [EventController::class,'index'])->name('event');
        Route::get('/{slug}', [EventController::class,'detail'])->name('event.detail');
    });

    Route::get('/ve-chung-toi', [PolicyController::class,'aboutUs'])->name('about_us');
    Route::get('/chinh-sach-doi-tra', [PolicyController::class,'returnPolicy'])->name('return_policy');
    Route::get('/dieu-khoan-dich-vu', [PolicyController::class,'termOfService'])->name('term_of_service');
    Route::get('/huong-dan-mua-hang', [PolicyController::class,'shoppingGuide'])->name('shopping_guide');
});


Route::prefix('admin')->group(function() {

    Route::get('/dang-nhap', [AdminAuthController::class,'getLogin'])->name('admin.login');
    Route::post('/dang-nhap', [AdminAuthController::class,'postLogin']);
    Route::get('/dang-xuat', [AdminAuthController::class,'getLogout'])->name('admin.logout');
    
    Route::middleware('auth:webadmin')->prefix('/')->group(function(){
        Route::get('/', [AdminController::class,'index'])->name('admin.home');

        Route::prefix('danh-muc')->group(function() {
            Route::get('/', [AdminCategoryController::class,'index'])->name('admin.category');
            Route::get('/them-danh-muc', [AdminCategoryController::class,'create'])->name('admin.create.category');
            Route::post('/them-danh-muc', [AdminCategoryController::class,'store']);
            Route::get('/cap-nhat-danh-muc/{id}', [AdminCategoryController::class,'edit'])->name('admin.edit.category');
            Route::put('/cap-nhat-danh-muc/{id}', [AdminCategoryController::class,'update']);
            Route::get('/cap-nhat-trang-thai/{id}', [AdminCategoryController::class,'destroy'])->name('admin.destroy.category');
            Route::get('/xuat-file',[AdminCategoryController::class,'export'])->name('admin.export.category');
        });

        Route::prefix('san-pham')->group(function() {
            Route::get('/', [AdminProductController::class,'index'])->name('admin.product');
            Route::get('/them-san-pham', [AdminProductController::class,'create'])->name('admin.create.product');
            Route::post('/them-san-pham', [AdminProductController::class,'store']);
            Route::get('/cap-nhat-san-pham/{id}', [AdminProductController::class,'edit'])->name('admin.edit.product');
            Route::put('/cap-nhat-san-pham/{id}', [AdminProductController::class,'update']);
            Route::get('/cap-nhat-trang-thai/{id}', [AdminProductController::class,'destroy'])->name('admin.destroy.product');
            Route::get('/xuat-file',[AdminProductController::class,'export'])->name('admin.export.product');
        });

        Route::prefix('su-kien')->group(function() {
            Route::get('/', [AdminEventController::class,'index'])->name('admin.event');
            Route::get('/them-su-kien', [AdminEventController::class,'create'])->name('admin.create.event');
            Route::post('/them-su-kien', [AdminEventController::class,'store']);
            Route::get('/cap-nhat-su-kien/{id}', [AdminEventController::class,'edit'])->name('admin.edit.event');
            Route::put('/cap-nhat-su-kien/{id}', [AdminEventController::class,'update']);
            Route::get('/cap-nhat-trang-thai/{id}', [AdminEventController::class,'destroy'])->name('admin.destroy.event');
        });

        Route::prefix('don-hang')->group(function() {
            Route::get('/', [AdminOrderController::class,'index'])->name('admin.order');
            Route::get('/chi-tiet-don-hang/{id}', [AdminOrderController::class,'detail'])->name('admin.detail.order');
            Route::get('/xuat-file',[AdminOrderController::class,'export'])->name('admin.export.order');
        });

        Route::prefix('kho')->group(function() {
            Route::get('/', [AdminWarehouseController::class,'index'])->name('admin.warehouse');
        });

        Route::prefix('cham-soc-khach-hang')->group(function() {
            Route::get('/', [AdminContactController::class,'index'])->name('admin.contact');
            Route::get('/chi-tiet/{id}', [AdminContactController::class,'detail'])->name('admin.detail.contact');
            Route::get('/cap-nhat-trang-thai/{id}', [AdminContactController::class,'destroy'])->name('admin.destroy.contact');
        });

        Route::prefix('chinh-sach')->group(function() {
            Route::get('/', [AdminPolicyController::class,'index'])->name('admin.policy');
            Route::get('/cap-nhat-chinh-sach/{id}', [AdminPolicyController::class,'edit'])->name('admin.edit.policy');
            Route::put('/cap-nhat-chinh-sach/{id}', [AdminPolicyController::class,'update']);
            Route::get('/cap-nhat-trang-thai/{id}', [AdminPolicyController::class,'destroy'])->name('admin.destroy.policy');
        });

        Route::prefix('thong-tin-ca-nhan')->group(function() {
            Route::get('/', [AdminProfileController::class,'index'])->name('admin.profile');
            Route::put('/', [AdminProfileController::class,'updateProfile']);
            Route::get('/doi-mat-khau', [AdminProfileController::class,'changePassword'])->name('admin.password.profile');
            Route::put('/doi-mat-khau', [AdminProfileController::class,'updatePassword']);
        });
    });
});