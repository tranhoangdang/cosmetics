<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestEvent extends FormRequest
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
            'name' => 'required|unique:events,name,'.$this->id,
            'image' => 'required',
            'content' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'name.unique' => 'Sự kiện này đã tồn tại',
            'name.required' => 'Tên sự kiện không được để trống',
            'image.required' => 'Ảnh bìa không được để trống',
            'content.required' => 'Nội dung không được để trống'
        ];
    }
}
