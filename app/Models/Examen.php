<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Examen extends Model
{
    use HasFactory;

    protected $table = "examenes";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
        'descripcion',
        'fecha_inicial',
        'fecha_final',
        'estado',
        'profesor_id',
        'duracion',
        'n_pregunta'
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
     * Relacion con el modelo Profesor.
     * @return mixed \App\Models\Database\Profesor
     */
    public function profesor()
    {
        return $this->belongsTo(Profesor::class, 'profesor_id');
    }

    /**
     * Relacion con el modelo preguntas.
     * @return mixed \App\Models\Database\preguntas
     */
    public function preguntas()
    {
        return $this->hasMany(ExamenPregunta::class);
    }

    /**
     * Relacion con el modelo preguntas.
     * @return mixed \App\Models\Database\preguntas
     */
    public function tipoEstado()
    {
        return $this->hasOne(TipoEstado::class, 'acronimo', 'estado');
    }
}
