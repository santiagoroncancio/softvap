<?php

namespace App\Http\Controllers\Simulacion;

use Exception;
use Illuminate\Http\Request;
use App\Models\Simulacion;
use App\Models\PreguntaSimulacion;
use App\Models\EscenarioSimulacion;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Http\Requests\SimulacionRequest;
use App\Models\RespuestaSimulacion;
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

            // foreach ($request->recurso as $rc) {
            //     RespuestaSimulacion::create([
            //         'valor' => $request->,
            //         'simulacion_id' => $request->,
            //         'recurso_id' => $request->,
            //         'campo_id' => 
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


    // /**
    //  * Devuelve las Unidades de medida
    //  *
    //  * @param $string $term dato de entrada para busqueda.
    //  * @param $int $page pagina de busqueda.
    //  *
    //  * @return array
    //  */
    // public function selectUnidadMedida(Request $request)
    // {
    //     $term = trim($request->term) ?? '';
    //     $page = $request->page ?? '1';

    //     $um = UnidadMedida::where('nombre', 'LIKE', '%' . $term . '%')
    //         ->orWhere('abreviatura', 'LIKE', '%' . $term . '%')
    //         ->select(
    //             'id',
    //             DB::raw("CONCAT(nombre, ' - ', abreviatura) as text")
    //         )
    //         ->paginate(10);

    //     $morePages = ($page * $um->perPage()) < $um->total();
    //     $data  = [
    //         'incomplete_results' => false,
    //         'more' => $morePages,
    //         'total_count' => $um->total(),
    //         'results' => $um
    //     ];

    //     return Response::json($data, 200, [], JSON_PRETTY_PRINT);
    // }
}
