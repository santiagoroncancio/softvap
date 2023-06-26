<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Simulacion extends Model
{
    use HasFactory;

    protected $table = "simulaciones";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'nota',
        'tiempo',
        'pregunta_id',
        'estudiante_id',
        'campo_id'
    ];

    /**
     * Relacion con el modelo PreguntaSimulacion.
     * @return mixed \App\Models\Database\PreguntaSimulacion
     */
    public function pregunta()
    {
        return $this->belongsTo(PreguntaSimulacion::class, 'pregunta_id', 'id');
    }

    /**
     * Relacion con el modelo UnidadMedida.
     * @return mixed \App\Models\Database\UnidadMedida
     */
    public function unidad()
    {
        return $this->belongsTo(UnidadMedida::class, 'respuesta_unidad', 'id');
    }
}
