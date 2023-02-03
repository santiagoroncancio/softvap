<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrescripcionMedica extends Model
{
    use HasFactory;
    
    protected $table = "prescripciones_medicas";
    protected $primaryKey = 'id'; // or null
}
