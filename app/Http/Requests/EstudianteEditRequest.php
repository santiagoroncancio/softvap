<?php

namespace App\Http\Requests;

use App\Models\Estudiante;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\Rule;

class EstudianteEditRequest extends FormRequest
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
        $idEstudiante = $this->route('estudiante');
        $user = Estudiante::find($idEstudiante);

        return [
            'tidentification' => 'required',
            'identification' => [
                'required',
                Rule::unique('users', 'identification')->ignore($user->usuario_id)
            ],
            'name' => 'required',
            'surname' => 'required',
            'email' => [
                'required',
                Rule::unique('users', 'email')->ignore($user->usuario_id)
            ],
            'codigoEstudiante' => [
                'required',
                Rule::unique('estudiantes', 'codigo_estudiante')->ignore($idEstudiante)
            ],
            'grupo' => 'required'
        ];
    }

    public function messages()
    {
        return [
            'required'  => 'El campo :attribute es requerido',
            'unique' => 'El campo :attribute debe ser unico.'
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
            'codigoEstudiante' => 'Codigo del estudiante',
            'grupo' => 'Grupo'
        ];
    }
}
