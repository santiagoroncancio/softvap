<?php

namespace App\Helpers;

use App\Models\UnidadMedida;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use ParseError;

/**
 * Class Helper
 * @package App\Helpers
 */
class Helper
{
    /**
     * Calcula la operacion en el sistema internacional
     * @param float $valor
     * @param int $unidad
     * @return float
     */
    public static function calSi($valor, $unidad, $decimal = 10)
    {
        $um = UnidadMedida::find($unidad);
        $data = $valor * $um->equivalencia;
        return round($data, $decimal);
    }
}
