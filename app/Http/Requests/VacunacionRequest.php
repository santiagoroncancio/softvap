<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class VacunacionRequest extends FormRequest
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
            'nombre' => 'required',
            'via_aplicacion' => 'required'
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
            'nombre' => 'Nombre',
            'via_aplicacion' => 'Via Aplicación'
        ];
    }
}
