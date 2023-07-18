<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "categorias";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'nombre',
        'descripcion'
    ];

    /**
     * Relacion con el modelo Recurso.
     * @return mixed \App\Models\Database\Recurso
     */
    public function recurso()
    {
        return $this->hasMany(Recurso::class, 'categoria_id');
    }

    /**
     * Relacion con el modelo Campo.
     * @return mixed \App\Models\Database\Campo
     */
    public function campo()
    {
        return $this->hasMany(Campo::class, 'categoria_id');
    }
}
