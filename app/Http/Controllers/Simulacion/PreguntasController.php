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
use App\Repositories\Pregunta\PreguntaRepository;

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
     * Objeto PreguntaRepository.
     *
     * @var object
     */
    private $preguntaRepository;

    /**
     * Constructor de la clase.
     *
     * @access public
     * @param PreguntaRepository $vacunacionRepository
     */
    public function __construct(PreguntaRepository $preguntaRepository)
    {
        $this->preguntaRepository = $preguntaRepository;
    }

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
        $categoria = Categoria::where('nombre', 'LIKE', 'vacunacion')->first();
        $escenario = EscenarioSimulacion::all();
        $nivel = Nivel::all();
        return view('preguntas.create', compact('categoria', 'escenario', 'nivel'));
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

            $abierta = $request->pabierta ?? 'n';
            $qs = PreguntaSimulacion::create([
                'pregunta' => $request->pregunta,
                'escenario_id' => $request->escenario,
                'nivel_id' => $request->nivel,
                'categoria_id' => $request->categoria,
                'campo_id' => $request->campo ?? null,
                'abierta' => $abierta
            ]);

            foreach ($request->valor as $rc) {
                if ($rc != null) {
                    RespuestaPregunta::create([
                        'valor' => $rc,
                        'pregunta_id' => $qs->id
                    ]);
                }
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

    /**
     * Show the form for show the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $categoria = Categoria::where('nombre', 'LIKE', 'vacunacion')->first();
        $escenario = EscenarioSimulacion::all();
        $nivel = Nivel::all();
        $data = PreguntaSimulacion::find($id);

        return view('preguntas.edit', compact('data', 'categoria', 'escenario', 'nivel'));
    }

    /**
     * Show the form for show the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $categoria = Categoria::where('nombre', 'LIKE', 'vacunacion')->first();
        $escenario = EscenarioSimulacion::all();
        $nivel = Nivel::all();
        $data = PreguntaSimulacion::find($id);
        return view('preguntas.edit', compact('data', 'categoria', 'escenario', 'nivel'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(PreguntasRequest $request, $id)
    {
        try {
            DB::beginTransaction();

            $abierta = $request->pabierta ?? 'n';
            PreguntaSimulacion::find($id)
                ->update([
                    'pregunta' => $request->pregunta,
                    'escenario_id' => $request->escenario,
                    'nivel_id' => $request->nivel,
                    'categoria_id' => $request->categoria,
                    'campo_id' => $request->campo ?? null,
                    'abierta' => $abierta
                ]);

            RespuestaPregunta::where('pregunta_id', '=', $id)
                ->delete();

            foreach ($request->valor as $rc) {
                if ($rc != null) {
                    RespuestaPregunta::create([
                        'valor' => $rc,
                        'pregunta_id' => $id
                    ]);
                }
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
            'message'    => 'Pregunta Actualizada',
            'alert-type' => 'success',
        ]);;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            DB::beginTransaction();

            PreguntaSimulacion::findOrFail($id)->delete();
            RespuestaPregunta::where('pregunta_id', '=', $id)->delete();

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
            'message'    => 'Se Elimino la pregunta',
            'alert-type' => 'success',
        ]);
    }

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
