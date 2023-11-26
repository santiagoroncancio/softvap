<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Estudiante extends Model
{
    use HasFactory;

    protected $table = "estudiantes";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'codigo_estudiante',
        'usuario_id',
        'grupo_id',
        'estado'
    ];

    /**
     * Los atributos ocultos para los array.
     *
     * @var array
     */
    protected $hidden = [
        'created_at',
        'updated_at'
    ];

    /**
     * Relacion con el modelo User.
     * @return mixed \App\Models\User
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'usuario_id', 'id');
    }

    /**
     * Relacion con el modelo Grupo.
     * @return mixed \App\Models\Grupo
     */
    public function grupo()
    {
        return $this->belongsTo(Grupo::class, 'grupo_id', 'id');
    }
}
