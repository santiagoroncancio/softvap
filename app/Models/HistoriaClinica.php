<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class HistoriaClinica extends Model
{
    use HasFactory;
    
    protected $table = "historias_clinicas";
    protected $primaryKey = 'id'; // or null
}
