<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ComponenteMedicamento extends Model
{
    use HasFactory;

    protected $table = "Componentes_medicamentos";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'cantidad',
        'unidad_medida_id',
        'componente_id'
    ];
}
