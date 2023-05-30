<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EscenarioSimulacion extends Model
{
    use HasFactory;

    protected $table = "escenarios_simulaciones";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
        'descripcion',
        'imagen'
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
     * Relacion con el modelo PreguntaSimulacion.
     * @return mixed \App\Models\Database\PreguntaSimulacion
     */
    public function preguntas()
    {
        return $this->hasMany(PreguntaSimulacion::class, 'escenario_id', 'id');
    }
}
