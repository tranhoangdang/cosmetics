<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestPolicy extends FormRequest
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
            'name' => 'required|unique:policies,name,'.$this->id,
            'content' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'name.unique' => 'Chính sách này đã tồn tại',
            'name.required' => 'Tên chính sách không được để trống',
            'content.required' => 'Nội dung chính sách không được để trống',
        ];
    }
}
