<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DispositivoMedico extends Model
{
    use HasFactory;

    public $timestamps = false;
    
    protected $table = "dispositivos_medicos";
    protected $primaryKey = 'id'; // or null
}
