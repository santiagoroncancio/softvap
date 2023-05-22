<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Calificacion extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "calificaciones";
    protected $primaryKey = 'id'; // or null
}
