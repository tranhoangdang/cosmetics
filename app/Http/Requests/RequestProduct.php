<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestProduct extends FormRequest
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
            'name' => 'required|unique:products,name,'.$this->id,
            'brand' => 'required',
            'origin' => 'required',
            'description' => 'required',
            'image' => 'required',
            'price' => 'required',
            'qty' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'name.unique' => 'Sản phẩm này đã tồn tại',
            'name.required' => 'Tên sản phẩm không được để trống',
            'brand.required' => 'Thương hiệu không được để trống',
            'origin.required' => 'Xuất xứ không được để trống',
            'description.required' => 'Mô tả không được để trống',
            'image.required' => 'Ảnh bìa không được để trống',
            'price.required' => 'Giá không được để trống',
            'qty.required' => 'Số lượng không được để trống'
        ];
    }
}
