<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PreguntaSimulacion extends Model
{
    use HasFactory;

    protected $table = "preguntas_simulaciones";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'pregunta',
        'respuesta_medida',
        'respuesta_unidad',
        'escenario_id',
        'nivel_id',
        'categoria_id'
    ];

    /**
     * Relacion con el modelo UnidadMedida.
     * @return mixed \App\Models\Database\UnidadMedida
     */
    public function unidad()
    {
        return $this->belongsTo(UnidadMedida::class, 'respuesta_unidad', 'id');
    }

    /**
     * Relacion con el modelo UnidadMedida.
     * @return mixed \App\Models\Database\UnidadMedida
     */
    public function escenario()
    {
        return $this->belongsTo(EscenarioSimulacion::class, 'escenario_id', 'id');
    }

    /**
     * Relacion con el modelo UnidadMedida.
     * @return mixed \App\Models\Database\UnidadMedida
     */
    public function nivel()
    {
        return $this->belongsTo(Nivel::class, 'nivel_id', 'id');
    }

    /**
     * Relacion con el modelo UnidadMedida.
     * @return mixed \App\Models\Database\UnidadMedida
     */
    public function categoria()
    {
        return $this->belongsTo(Categoria::class, 'categoria_id', 'id');
    }
}
