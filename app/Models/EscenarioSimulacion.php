<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EscenarioSimulacion extends Model
{
    use HasFactory;
    
    protected $table = "escenarios_simulaciones";
    protected $primaryKey = 'id'; // or null
}
