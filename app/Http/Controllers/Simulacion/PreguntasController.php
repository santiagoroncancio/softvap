<?php

namespace App\Http\Controllers\Simulacion;

use Exception;
use Illuminate\Http\Request;
use App\Models\PreguntaSimulacion;
use App\Models\EscenarioSimulacion;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use App\Http\Controllers\Controller;
use App\Http\Requests\PreguntasRequest;
use App\Models\Campo;
use App\Models\Nivel;
use App\Models\Recurso;
use App\Models\Categoria;
use App\Models\RespuestaPregunta;

/**
 * Controlador Maneja Lógica de Preguntas Simulacion.
 *
 * Controlador que maneja la lógica de Preguntas de Simulación.
 *
 * @package    Controllers
 * @subpackage \Simulacion
 * @copyright  2023 Sofmedip
 * @author     Santiago Roncancio <Sntgrncnc@gmail.com>
 * @version    v1.0
 */

class PreguntasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = PreguntaSimulacion::all();
        return view('preguntas.index', compact('data'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('preguntas.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PreguntasRequest $request)
    {
        try {
            DB::beginTransaction();

            $qs = PreguntaSimulacion::create([
                'pregunta' => $request->pregunta,
                'escenario_id' => $request->escenario,
                'nivel_id' => $request->nivel,
                'categoria_id' => $request->categoria
            ]);

            if ($request->recurso != null) {
                foreach ($request->recurso as $rc) {
                    RespuestaPregunta::create([
                        'valor' => null,
                        'recurso_id' => $rc,
                        'campo_id' => $request->campo,
                        'pregunta_id' => $qs->id
                    ]);
                }
            } else {
                RespuestaPregunta::create([
                    'valor' => $request->valor,
                    'recurso_id' => null,
                    'campo_id' => null,
                    'pregunta_id' => $qs->id
                ]);
            }

            DB::commit();
        } catch (Exception $ex) {
            Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
            DB::rollBack();
            return redirect()->route('preguntas.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }
        return redirect()->route('preguntas.index')->with([
            'message'    => 'Pregunta Creada',
            'alert-type' => 'success',
        ]);;
    }

    // /**
    //  * Show the form for editing the specified resource.
    //  *
    //  * @param  int  $id
    //  * @return \Illuminate\Http\Response
    //  */
    // public function edit($id)
    // {
    //     //
    // }

    // /**
    //  * Update the specified resource in storage.
    //  *
    //  * @param  \Illuminate\Http\Request  $request
    //  * @param  int  $id
    //  * @return \Illuminate\Http\Response
    //  */
    // public function update(Request $request, $id)
    // {
    //     //
    // }

    // /**
    //  * Remove the specified resource from storage.
    //  *
    //  * @param  int  $id
    //  * @return \Illuminate\Http\Response
    //  */
    // public function destroy($id)
    // {
    //     //
    // }

    // /**
    //  * Muestra una pregunta Al Azar
    //  *
    //  * @return \Illuminate\Http\Response
    //  */
    // public function random()
    // {
    //     $pregunta = PreguntaSimulacion::all()->random();
    //     $data = $pregunta->escenario;
    //     return view('simulacion.simulation', compact('data', 'pregunta'));
    // }

    // /**
    //  * Muestra los resultados de la simulacion individual o grupal
    //  *
    //  * @param $string $term dato de entrada para busqueda.
    //  * @param $int $page pagina de busqueda.
    //  *
    //  * @return array
    //  */
    // public function results($id)
    // {
    //     $resultado = Simulacion::find($id);
    //     return view('simulacion.results', compact('resultado'));
    // }


    /**
     * Devuelve los escenarios
     *
     * @param $string $term dato de entrada para busqueda.
     * @param $int $page pagina de busqueda.
     *
     * @return array
     */
    public function selectEscenario(Request $request)
    {
        $term = trim($request->term) ?? '';
        $page = $request->page ?? '1';

        $um = EscenarioSimulacion::where('nombre', 'LIKE', '%' . $term . '%')
            ->select(
                'id',
                'nombre as text'
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

    /**
     * Devuelve los Niveles
     *
     * @param $string $term dato de entrada para busqueda.
     * @param $int $page pagina de busqueda.
     *
     * @return array
     */
    public function selectNivel(Request $request)
    {
        $term = trim($request->term) ?? '';
        $page = $request->page ?? '1';

        $um = Nivel::where('nombre', 'LIKE', '%' . $term . '%')
            ->select(
                'id',
                'nombre as text'
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

    /**
     * Devuelve los Categoria
     *
     * @param $string $term dato de entrada para busqueda.
     * @param $int $page pagina de busqueda.
     *
     * @return array
     */
    public function selectCategoria(Request $request)
    {
        $term = trim($request->term) ?? '';
        $page = $request->page ?? '1';

        $um = Categoria::where('nombre', 'LIKE', '%' . $term . '%')
            ->select(
                'id',
                'nombre as text'
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

    /**
     * Devuelve los Recursos
     *
     * @param $string $term dato de entrada para busqueda.
     * @param $int $page pagina de busqueda.
     *
     * @return array
     */
    public function selectRecursos(Request $request)
    {
        $term = trim($request->term) ?? '';
        $page = $request->page ?? '1';

        $um = Recurso::where('nombre', 'LIKE', '%' . $term . '%')
            ->select(
                'id',
                'nombre as text'
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

    /**
     * Devuelve los Tipos Recursos
     *
     * @param $string $term dato de entrada para busqueda.
     * @param $int $page pagina de busqueda.
     *
     * @return array
     */
    public function selectCampo(Request $request)
    {
        $term = trim($request->term) ?? '';
        $page = $request->page ?? '1';

        $um = Campo::where('nombre', 'LIKE', '%' . $term . '%')
            ->where('categoria_id', '=', $request->categoria)
            ->select(
                'id',
                'nombre as text'
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
