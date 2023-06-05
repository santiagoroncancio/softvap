<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RecursoCampo extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "recurso_campos";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'recurso_id',
        'campo_id',
        'valor',
        'campo_id'
    ];

    /**
     * Relacion con el modelo PreguntaSimulacion.
     * @return mixed \App\Models\Database\PreguntaSimulacion
     */
    public function recurso()
    {
        return $this->belongsTo(Recurso::class, 'recurso_id', 'id');
    }
}
