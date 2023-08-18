<?php

namespace App\Http\Controllers\Simulacion;

use Exception;
use Illuminate\Http\Request;
use App\Models\Simulacion;
use App\Models\PreguntaSimulacion;
use App\Models\EscenarioSimulacion;
use App\Models\RespuestaSimulacion;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Http\Requests\SimulacionRequest;
use App\Models\Estudiante;
use App\Repositories\Simulacion\SimulacionRepository;

/**
 * Controlador Maneja Lógica de Simulacion.
 *
 * Controlador que maneja la lógica de Simulación.
 *
 * @package    Controllers
 * @subpackage \Simulacion
 * @copyright  2023 sofvap
 * @author     Santiago Roncancio <Sntgrncnc@gmail.com>
 * @version    v1.0
 */

class SimulacionController extends Controller
{
    private $simulacionRepository;

    /**
     * Constructor de la clase.
     *
     * @access public
     * @param SimulacionRepository $simulacionRepository
     */
    public function __construct(SimulacionRepository $simulacionRepository)
    {
        $this->simulacionRepository = $simulacionRepository;
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
    public function store(SimulacionRequest $request)
    {
        try {
            DB::beginTransaction();
            $estudiante = Estudiante::where('usuario_id', '=', auth()->id())->first();
            $sim = Simulacion::create([
                'nota' => $this->simulacionRepository->calcNota($request->question, $request->answer, $request->recurso),
                'tiempo' => $this->simulacionRepository->calcTime($request->ti),
                'pregunta_id' => $request->question,
                'estudiante_id' => $estudiante->id,
                'campo_id' => $request->campo
            ]);

            foreach ($this->simulacionRepository->sortCo($request->answer, $request->recurso) as $key => $rc) {
                RespuestaSimulacion::create([
                    'valor' => $rc,
                    'simulacion_id' => $sim->id,
                    'recurso_id' => $key != 0 ? $key : null
                ]);
            }

            DB::commit();
        } catch (Exception $ex) {
            DB::rollBack();
            Log::debug($ex);
            return redirect()->route('lab-simulacion.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);;
        }
        return redirect()->route('lab-simulacion.results', ['id' => $sim->id]);
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
    public function results(Request $request)
    {
        $resultado = Simulacion::find($request->id);
        $resCo = [];
        $resDig = [];
        foreach ($resultado->pregunta->respuestas as $aux) {
            $temp = null;
            if ($resultado->campo_id == 1) {
                $temp = $this->simulacionRepository->nombreVacuna($aux->valor);
            } elseif ($resultado->campo_id == 2) {
                $temp = $this->simulacionRepository->calibreVacuna($aux->valor);
            } elseif ($resultado->campo_id == 3) {
                $temp = $this->simulacionRepository->viaAplicacionVacuna($aux->valor);
            } else {
                $temp = $aux->valor;
            }
            array_push($resCo, $temp);
        }
        foreach ($resultado->respuesta as $aux) {
            $temp = null;
            if ($resultado->pregunta->campo_id == 1) {
                $temp = $this->simulacionRepository->nombreVacuna($aux->valor);
            } elseif ($resultado->pregunta->campo_id == 2) {
                $temp = $this->simulacionRepository->nombreVacuna($aux->recurso_id) . ' - ' . $aux->valor;
            } elseif ($resultado->pregunta->campo_id == 3) {
                $temp = $this->simulacionRepository->nombreVacuna($aux->recurso_id) . ' - ' . $this->simulacionRepository->viaAplicacion($aux->valor);
            } else {
                $temp = $aux->valor;
            }
            array_push($resDig, $temp);
        }
        return view('simulacion.results', compact('resultado', 'resCo', 'resDig'));
    }
}
