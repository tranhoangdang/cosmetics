<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Invoice;
use Excel;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class AdminOrderController extends Controller
{
    public function index(Request $request){
        $orders = Order::orderByDesc('id');

        if($request->search){
            $orders->where('id','=',$request->search);
        }

        $orders = $orders->paginate(5);

        return view('admin.order.index',compact('orders'));
    }

    public function detail($id){
        $order = Order::find($id);

        $invoices = Invoice::with('products')->where('orderID',$id)->get();

        $viewData = [
            'order' => $order,
            'invoices' => $invoices
        ];

        return view('admin.order.detail',$viewData);
    }

    public function export(){
        return Excel::download(new DataExport, 'danh-sach-don-hang.csv');
    }
}

class DataExport implements FromCollection, WithHeadings {
    public function headings():array{
        return[
            'Mã đơn hàng',
            'Mã khách hàng',
            'Tên người nhận',
            'Số điện thoại',
            'Địa chỉ',
            'Phí vận chuyển',
            'Tổng đơn',
            'Trạng thái'
        ]; }
    public function collection(){
        return Order::select('id','userID','name','phone','address','delivery','total','status')->get();
    }
}