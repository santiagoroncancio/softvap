<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PreguntaSimulacion extends Model
{
    use HasFactory;
    
    protected $table = "preguntas_simulaciones";
    protected $primaryKey = 'id'; // or null
}
