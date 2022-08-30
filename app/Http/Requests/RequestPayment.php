<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestPayment extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required',
            'phone' => 'required',
            'address' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Tên người nhận không được để trống',
            'phone.required' => 'SĐT người nhận không được để trống',
            'address.required' => 'Địa chỉ người nhận không được để trống',
        ];
    }
}
