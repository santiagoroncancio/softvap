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

        // Obtener la diferencia total en segundos
        $diasEnSegundos = $tiempo->days * 86400;
        $horasEnSegundos = $tiempo->h * 3600;
        $minutosEnSegundos = $tiempo->i * 60;
        $segundos = $tiempo->s;

        return $diasEnSegundos + $horasEnSegundos + $minutosEnSegundos + $segundos;
    }

    public function calcNota($question_id, $answer, $recurso)
    {
        $ps = PreguntaSimulacion::find($question_id);
        $respuestas = $ps->respuestas;

        // La maxima nota es 5
        $valorPunto = 5 / $respuestas->count();
        $puntos = 0;
        $puntosNegativos = 0;

        if ($ps->campo_id == 2 || $ps->campo_id == 3) {
            $resp = $respuestas->sortBy('id');
            $res = $this->sortCo($answer, $recurso);

            foreach ($resp as $valor) {
                $aux = $valor->recurso->campos->where('campo_id', '=', $ps->campo_id)->first()->valor;
                if ($aux == $res->get($valor->valor)) {
                    $puntos = $puntos + 1;
                }
            }
        } else {
            // Pregunta abierta
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
        return round($nota, 2);
    }

    public function aprobado($calificaciones)
    {
        $totalCalificaciones = count($calificaciones);
        $calificacionesMayoresA60 = array_filter($calificaciones, function ($calificacion) {
            return $calificacion >= 60;
        });

        $cantidadMayoresA60 = count($calificacionesMayoresA60);

        return ($cantidadMayoresA60 / $totalCalificaciones) * 100;
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

    /**
     * Mostrar una lista del reporte de predios
     *
     * @access public
     * @param int $predial_vigencia
     * @param int $predial_predio
     * @param int $company
     * @return \Illuminate\Database\Query\Builder
     */
    public function getReportsEstadistica($year = 0)
    {

        if ($year == 0) {
            $year = date('Y');
        }

        $sql = "SELECT
            est.codigo_estudiante,
            CONCAT(u.name, ' ', u.surname) as nombre_estudiante,
            gr.nombre as grupo_estudiante,
            esc.nombre as escenario,
            pre.pregunta,
            niv.nombre as dificultad,
            simu.created_at as fecha,
            simu.tiempo,
            simu.nota
            FROM simulaciones simu
            INNER JOIN estudiantes est ON est.id = simu.estudiante_id
            INNER JOIN preguntas_simulaciones pre ON pre.id = simu.pregunta_id
            INNER JOIN escenarios_simulaciones esc ON esc.id = pre.escenario_id
            INNER JOIN users u ON u.id = est.usuario_id
            INNER JOIN grupos gr ON gr.id = est.grupo_id
            INNER JOIN niveles niv ON niv.id = pre.nivel_id
            WHERE YEAR(simu.created_at) = :year;";

        return DB::select($sql, [
            "year" => $year
        ]);
    }
}
