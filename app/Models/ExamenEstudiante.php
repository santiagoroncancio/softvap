<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamenEstudiante extends Model
{
    use HasFactory;

    protected $table = "examen_estudiantes";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'examen_id',
        'estudiante_id',
        'nota',
        'tiempo'
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
     * Relacion con el modelo preguntas.
     * @return mixed \App\Models\Database\preguntas
     */
    public function estudiante()
    {
        return $this->belongsTo(Estudiante::class, 'estudiante_id');
    }
}
