<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Profesor extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "profesores";
    protected $primaryKey = 'id'; // or null

    /**
     * Los atributos que son asignados masivamente.
     *
     * @var array
     */
    protected $fillable = [
        'usuario_id',
        'estado'
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
     * Relacion con el modelo user.
     * @return mixed \App\Models\Database\user
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }
}
