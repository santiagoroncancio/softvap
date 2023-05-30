<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrescripcionMedica extends Model
{
    use HasFactory;

    protected $table = "prescripciones_medicas";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'cantidad',
        'detalle',
        'unidad_medida_id',
        'medicamento_id',
        'historia_clinica_id',
        'medico_id'
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
