<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestChangePassword extends FormRequest
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
            'password' => 'required',
            'new_password' => 'required|min:8',
            're_password' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'password.required' => 'Vui lòng nhập mật khẩu hiện tại',
            'new_password.min' => 'Mật khẩu phải nhiều hơn 8 ký tự',
            'new_password.required' => 'Vui lòng nhập mật khẩu mới',
            're_password.required' => 'Vui lòng xác nhận mật khẩu mới',
        ];
    }
}
