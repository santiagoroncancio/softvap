<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class ViaSuministro extends Model
{
    use HasFactory;
    
    protected $table = "via_suministros";
    protected $primaryKey = 'id'; // or null
}
