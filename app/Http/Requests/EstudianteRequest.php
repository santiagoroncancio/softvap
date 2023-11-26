<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EstudianteRequest extends FormRequest
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
            'tidentification' => 'required',
            'identification' => 'required',
            'name' => 'required',
            'surname' => 'required',
            'email' => 'required',
            'passw' => 'required',
            'codigoEstudiante' => 'required',
            'grupo' => 'required'
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
            'tidentification' => 'Tipo del documento',
            'identification' => 'Identificación',
            'name' => 'Nombre',
            'surname' => 'Apellido',
            'email' => 'Correo Eletronico',
            'passw' => 'Contraseña',
            'codigoEstudiante' => 'Codigo del estudiante',
            'grupo' => 'Grupo'
        ];
    }
}
