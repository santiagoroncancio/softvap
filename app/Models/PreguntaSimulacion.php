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
        'escenario_id',
        'nivel_id',
        'categoria_id',
        'campo_id',
        'abierta'
    ];

    /**
     * Relacion con el modelo Escenario.
     * @return mixed \App\Models\Database\Escenario
     */
    public function escenario()
    {
        return $this->belongsTo(EscenarioSimulacion::class, 'escenario_id', 'id');
    }

    /**
     * Relacion con el modelo Nivel.
     * @return mixed \App\Models\Database\Nivel
     */
    public function nivel()
    {
        return $this->belongsTo(Nivel::class, 'nivel_id', 'id');
    }

    /**
     * Relacion con el modelo Categoria.
     * @return mixed \App\Models\Database\Categoria
     */
    public function categoria()
    {
        return $this->belongsTo(Categoria::class, 'categoria_id', 'id');
    }

    /**
     * Relacion con el modelo Campo.
     * @return mixed \App\Models\Database\Campo
     */
    public function campo()
    {
        return $this->belongsTo(Campo::class, 'campo_id', 'id');
    }

    /**
     * Relacion con el modelo respuestas.
     * @return mixed \App\Models\Database\respuestas
     */
    public function respuestas()
    {
        return $this->hasMany(RespuestaPregunta::class, 'pregunta_id', 'id');
    }

    /**
     * Relacion con el modelo simulaciones.
     * @return mixed \App\Models\Database\simulaciones
     */
    public function simulaciones()
    {
        return $this->hasMany(Simulacion::class, 'pregunta_id', 'id');
    }
}
