<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class prueba extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = "pruebas";
    protected $primaryKey = 'id'; // or null
}
