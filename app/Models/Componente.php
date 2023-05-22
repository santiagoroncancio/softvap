<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Componente extends Model
{
    use HasFactory;

    public $timestamps = false;
    
    protected $table = "componentes";
    protected $primaryKey = 'id'; // or null
}
