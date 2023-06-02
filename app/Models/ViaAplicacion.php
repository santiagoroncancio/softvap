<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ViaAplicacion extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "via_aplicaciones";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
        'abreviatura',
        'descripcion'
    ];
}
