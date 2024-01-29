<?php

namespace App\Http\Requests;

use App\Models\Profesor;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProfesorEditRequest extends FormRequest
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
        $idProfesor = $this->route('profesore');
        $user = Profesor::find($idProfesor);
        
        return [
            'tidentification' => 'required',
            'identification' => [
                'required',
                Rule::unique('users', 'identification')->ignore($user->usuario_id),
            ],
            'name' => 'required',
            'surname' => 'required',
            'email' => [
                'required',
                Rule::unique('users', 'email')->ignore($idProfesor),
            ],
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
        ];
    }
}
