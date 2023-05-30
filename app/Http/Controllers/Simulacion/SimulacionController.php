<?php

namespace App\Http\Controllers\Simulacion;

use App\Helpers\Helper;
use DateTime;
use Exception;
use Illuminate\Http\Request;
use App\Models\Simulacion;
use App\Models\UnidadMedida;
use App\Models\EscenarioSimulacion;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use App\Http\Controllers\Controller;
use App\Http\Requests\SimulacionRequest;
use App\Models\Calificacion;
use App\Models\PreguntaSimulacion;

/**
 * Controlador Maneja Lógica de Simulacion.
 *
 * Controlador que maneja la lógica de Simulación.
 *
 * @package    Controllers
 * @subpackage \Simulacion
 * @copyright  2023 Sofmedip
 * @author     Santiago Roncancio <Sntgrncnc@gmail.com>
 * @version    v1.0
 */

class SimulacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $paginate = EscenarioSimulacion::paginate(6);
        return view('simulacion.index', compact('paginate'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(SimulacionRequest $request)
    {
        try {
            // Calcular Tiempo
            $ti = new DateTime($request->ti);
            $tf = new DateTime("now");
            $tiempo = $tf->diff($ti);
            $tiempo = $tiempo->format("%h:%i:%s");

            // Calcular Nota
            $um = UnidadMedida::find($request->answeru);
            $pr = PreguntaSimulacion::find($request->question);
            $questionSI = Helper::calSi($pr->respuesta_medida, $pr->respuesta_unidad);
            $answerSI = Helper::calSi($request->answer, $request->answeru);

            $nota = 0;
            if ($pr != null && $questionSI == $answerSI && $um != null && $pr->unidad->magnitud == $um->magnitud) {
                $nota = Calificacion::where('pregunta_id', $request->question)
                    ->get();

                if (count($nota) > 0) {
                    $nota = Calificacion::where('pregunta_id', $request->question)
                        ->where('tiempo_inicial', '<=', $tiempo)
                        ->where('tiempo_final', '>=', $tiempo)
                        ->first();

                    $nota = $nota != null ? $nota->nota : 0;
                } else {
                    $nota = 100; //Si no esta parametrizada la calificacion, su calificacion es 0 o 100
                }
            }

            // Registrar simulacion
            $simulacion = Simulacion::create([
                'respuesta_medida' => $request->answer,
                'respuesta_unidad' => $request->answeru,
                'nota' => $nota,
                'tiempo' => $tiempo,
                'pregunta_id' => $request->question,
                'estudiante_id' => auth()->id()
            ]);
        } catch (Exception $ex) {
            Log::debug($ex);
            return redirect()->route('lab-simulacion.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);;
        }
        return redirect()->route('lab-simulacion.results', $simulacion->id);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = EscenarioSimulacion::find($id);
        $pregunta = $data->preguntas->random();
        return view('simulacion.simulation', compact('data', 'pregunta'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    /**
     * Muestra una pregunta Al Azar
     *
     * @return \Illuminate\Http\Response
     */
    public function random()
    {
        $pregunta = PreguntaSimulacion::all()->random();
        $data = $pregunta->escenario;
        return view('simulacion.simulation', compact('data', 'pregunta'));
    }

    /**
     * Muestra los resultados de la simulacion individual o grupal
     *
     * @param $string $term dato de entrada para busqueda.
     * @param $int $page pagina de busqueda.
     *
     * @return array
     */
    public function results($id)
    {
        $resultado = Simulacion::find($id);
        return view('simulacion.results', compact('resultado'));
    }


    /**
     * Devuelve las Unidades de medida
     *
     * @param $string $term dato de entrada para busqueda.
     * @param $int $page pagina de busqueda.
     *
     * @return array
     */
    public function selectUnidadMedida(Request $request)
    {
        $term = trim($request->term) ?? '';
        $page = $request->page ?? '1';

        $um = UnidadMedida::where('nombre', 'LIKE', '%' . $term . '%')
            ->orWhere('abreviatura', 'LIKE', '%' . $term . '%')
            ->select(
                'id',
                DB::raw("CONCAT(nombre, ' - ', abreviatura) as text")
            )
            ->paginate(10);

        $morePages = ($page * $um->perPage()) < $um->total();
        $data  = [
            'incomplete_results' => false,
            'more' => $morePages,
            'total_count' => $um->total(),
            'results' => $um
        ];

        return Response::json($data, 200, [], JSON_PRETTY_PRINT);
    }
}
