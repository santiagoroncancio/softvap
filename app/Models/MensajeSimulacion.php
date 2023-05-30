<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MensajeSimulacion extends Model
{
    use HasFactory;

    protected $table = "mensajes_simulaciones";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'mensaje',
        'descripcion',
        'posicion_horizontal',
        'posicion_vertical',
        'escenario_id'
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
}
