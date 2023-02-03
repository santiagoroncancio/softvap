<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MensajeSimulacion extends Model
{
    use HasFactory;
    
    protected $table = "mensajes_simulaciones";
    protected $primaryKey = 'id'; // or null
}
