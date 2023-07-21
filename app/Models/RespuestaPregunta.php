<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RespuestaPregunta extends Model
{
    use HasFactory;

    protected $table = "respuesta_preguntas";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'valor',
        'pregunta_id',
        'recurso_id'
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
    public function recurso()
    {
        return $this->belongsTo(Recurso::class, 'valor', 'id');
    }
}
