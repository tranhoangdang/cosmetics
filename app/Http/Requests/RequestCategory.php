<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestCategory extends FormRequest
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
            'name' => 'required|unique:categories,name,'.$this->id,
        ];
    }

    public function messages()
    {
        return [
            'name.unique' => 'Danh mục này đã tồn tại',
            'name.required' => 'Tên danh mục không được để trống'
        ];
    }
}
