<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Recurso extends Model
{
    use HasFactory;

    protected $table = "recursos";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'nombre'
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
     * Relacion con el modelo campos.
     * @return mixed \App\Models\Database\campos
     */
    public function campos()
    {
        return $this->hasMany(RecursoCampo::class, 'recurso_id');
    }
}
