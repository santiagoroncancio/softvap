<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipoRecurso extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "tipo_recursos";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
        'descripcion',
        'categoria_id'
    ];
}
