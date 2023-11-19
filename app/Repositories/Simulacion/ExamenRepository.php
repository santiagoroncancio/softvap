<?php

namespace App\Repositories\Simulacion;

use Illuminate\Support\Facades\DB;

/**
 * Repositorio Examen
 *
 * Repositorio que controla la lógica de Examen
 *
 * @package    Repositories
 * @subpackage \Simulacion
 * @copyright  2023 Unillanos
 * @author     Santiago Roncancio <sntgrncnc@gmail.com>
 * @version    v1.0.0
 */
class ExamenRepository
{

    public function calcMultiplicador($tiempo, $tiempoMaximo, $multiplicador)
    {
        if ($tiempo >= $tiempoMaximo) {
            return 0;
        } elseif ($tiempo <= 1) {
            return $multiplicador;
        } else {
            $aux = $multiplicador - (($tiempo - 1) / ($tiempoMaximo - 1)) * $multiplicador;
            return max(0, $aux);
        }
    }
}
