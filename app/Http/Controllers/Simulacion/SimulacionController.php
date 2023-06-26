<?php

namespace App\Http\Controllers\Simulacion;

use Exception;
use Illuminate\Http\Request;
use App\Models\Simulacion;
use App\Models\PreguntaSimulacion;
use App\Models\EscenarioSimulacion;
use App\Models\RespuestaSimulacion;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

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

    public function calcTime($ti)
    {
        // Calcular Tiempo
        $ti = new DateTime($ti);
        $tf = new DateTime("now");
        $tiempo = $tf->diff($ti);
        return $tiempo->format("%h:%i:%s");
    }

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
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = EscenarioSimulacion::find($id);

        $pregunta = null;
        if (count($data->preguntas) > 0) {
            $pregunta = $data->preguntas->random();
        }

        return view('simulacion.simulation', compact('data', 'pregunta'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();

            dd($request->all());
            $ps = PreguntaSimulacion::find($request->question);
            $sim = Simulacion::create([
                'nota' => 100,
                'tiempo' => $this->calcTime($request->ti),
                'pregunta_id' => $request->question,
                'estudiante_id' => auth()->id(),
                'campo_id' => $request->campo
            ]);

            // foreach ($request->answer as $i => $rc) {
            //     RespuestaSimulacion::create([
            //         'valor' => $rc,
            //         'simulacion_id' => $sim->id,
            //         'recurso_id' => ,
            //     ]);
            // }

            DB::commit();
        } catch (Exception $ex) {
            DB::rollBack();
            Log::debug($ex);
            return redirect()->route('lab-simulacion.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);;
        }
        return redirect()->route('lab-simulacion.results', 1);
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
}
