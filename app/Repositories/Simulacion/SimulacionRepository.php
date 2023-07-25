<?php

namespace App\Repositories\Simulacion;

use DateTime;
use App\Models\Recurso;
use App\Models\ViaAplicacion;
use App\Models\PreguntaSimulacion;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

/**
 * Repositorio Simulacion
 *
 * Repositorio que controla la lógica de Simulacion
 *
 * @package    Repositories
 * @subpackage \Simulacion
 * @copyright  2023 Unillanos
 * @author     Santiago Roncancio <sntgrncnc@gmail.com>
 * @version    v1.0.0
 */
class SimulacionRepository
{
    public function sortCo($answer, $recurso)
    {
        $res = $answer;
        sort($res);

        if ($recurso != null) {
            $res = collect(array_combine($recurso, $answer))->sortBy(function ($valor, $llave) {
                return $llave;
            });
        }

        return $res;
    }

    public function calcTime($ti)
    {
        // Calcular Tiempo
        $ti = new DateTime($ti);
        $tf = new DateTime("now");
        $tiempo = $tf->diff($ti);
        return $tiempo->format("%h:%i:%s");
    }

    public function calcNota($question_id, $answer, $recurso)
    {
        $ps = PreguntaSimulacion::find($question_id);
        $respuestas = $ps->respuestas;

        $valorPunto = 100 / $respuestas->count();
        $puntos = 0;
        $puntosNegativos = 0;

        if ($ps->campo_id == 2 || $ps->campo_id == 3) {
            $resp = $respuestas->sortBy('id');
            $res = $this->sortCo($answer, $recurso);

            foreach ($resp as $valor) {
                $aux = $valor->recurso->campos->where('campo_id', '=', $ps->campo_id)->first()->valor;
                if ($aux == $res->get($valor->id)) {
                    $puntos = $puntos + 1;
                }
            }
        } else {
            // Transfomar respuestas correctas sin espacios y minusculas
            $respuestasTransformadas = $respuestas->pluck('valor')->map(function ($valor) {
                return strtolower(str_replace(' ', '', $valor));
            });

            foreach (array_unique($answer) as $asw) {
                $asw = strtolower(str_replace(' ', '', $asw));
                if ($respuestasTransformadas->contains($asw)) {
                    $puntos = $puntos + 1;
                }
            }

            if (count($answer) > $respuestas->count()) {
                $puntosNegativos = count($answer) - $respuestas->count();
            }
        }

        $nota = ($puntos * $valorPunto) - ($puntosNegativos * $valorPunto);
        $nota = $nota >= 0 ? $nota : 0;
        return round($nota, 0);
    }

    public function viaAplicacion($id)
    {
        $vapl = viaAplicacion::find($id);
        return $vapl->nombre;
    }

    public function nombreVacuna($id)
    {
        $vac = Recurso::find($id)->campos->where('campo_id', '=', 1)->first();
        return $vac->valor;
    }

    public function calibreVacuna($id)
    {
        $vac = Recurso::find($id)->campos->where('campo_id', '=', 2)->first();
        return $this->nombreVacuna($vac->recurso_id) . ' - ' . $vac->valor;
    }

    public function viaAplicacionVacuna($id)
    {
        $vac = Recurso::find($id)->campos->where('campo_id', '=', 3)->first();
        return $this->nombreVacuna($vac->recurso_id) . ' - ' . $this->viaAplicacion($vac->valor);
    }
}
