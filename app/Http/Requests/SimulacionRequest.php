<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SimulacionRequest extends FormRequest
{
    public $validator;
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
            'answer' => 'required',
            'question' => 'required',
            'ti' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'required'  => 'El campo :attribute es requerido'

        ];
    }

    public function attributes()
    {
        return [
            'answer' => 'Respuesta',
            'question' => 'Pregunta',
            'ti' => 'Tiempo Inicial'
        ];
    }
}
