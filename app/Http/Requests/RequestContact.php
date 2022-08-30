<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestContact extends FormRequest
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
            'email' => 'required',
            'phone' => 'required',
            'title' => 'required',
            'content' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'email.required' => 'Email không được để trống',
            'phone.required' => 'SĐT không được để trống',
            'title.required' => 'Tiêu đề không được để trống',
            'content.required' => 'Nội dung không được để trống'
        ];
    }
}
