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
            'answeru' => 'required',
            'question' => 'required',
            'ti' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'required'  => 'El campo :attribute es requerido',
            'min'       => 'El campo :attribute debe tener como mínimo :min carácteres',
            'max'       => 'El campo :attribute puede tener como máximo :max carácteres',
            'numeric'   => 'El campo :attribute debe ser numérico',

        ];
    }

    public function attributes()
    {
        return [
            'answer' => 'Respuesta',
            'answeru' => "Unidad Medida",
            'question' => 'Pregunta',
            'ti' => 'Tiempo Inicial'
        ];
    }
}
