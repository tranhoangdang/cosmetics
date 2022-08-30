<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestResetPassword extends FormRequest
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
            'password' => 'required|min:8',
            're_password' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'password.required' => 'Vui lòng nhập mật khẩu',
            'password.min' => 'Mật khẩu phải có ít nhất 8 ký tự',
            're_password.required' => 'Vui lòng xác nhận lại mật khẩu'
        ];
    }
}
