<?php

namespace App\Http\Controllers\Simulacion;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use App\Http\Controllers\Controller;
use App\Http\Requests\VacunacionRequest;
use App\Models\Categoria;
use App\Models\Estudiante;
use App\Models\Examen;
use App\Models\ExamenPregunta;
use App\Models\PreguntaSimulacion;
use App\Models\Profesor;
use App\Models\Recurso;
use App\Models\RecursoCampo;
use App\Models\RespuestaSimulacion;
use App\Models\Simulacion;
use App\Models\User;
use App\Models\ViaAplicacion;
use App\Repositories\Simulacion\ExamenRepository;
use App\Repositories\Simulacion\SimulacionRepository;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

/**
 * Controlador Maneja Lógica de Examen
 *
 * Controlador que maneja la lógica de Examen.
 *
 * @package    Controllers
 * @subpackage \Simulacion
 * @copyright  2023 sofvap
 * @author     Santiago Roncancio <Sntgrncnc@gmail.com>
 * @version    v1.0
 */

class ExamenController extends Controller
{
    /**
     * Objeto examenRepository.
     *
     * @var object
     */
    private $examenRepository;

    /**
     * Objeto simulacionRepository.
     *
     * @var object
     */
    private $simulacionRepository;

    /**
     * Constructor de la clase.
     *
     * @access public
     * @param examenRepository $examenRepository
     */
    public function __construct(ExamenRepository $examenRepository, SimulacionRepository $simulacionRepository)
    {
        $this->examenRepository = $examenRepository;
        $this->simulacionRepository = $simulacionRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $usuario = Auth::user()->id;
        $role = User::find($usuario)->roles;
        $examen = Examen::all();

        return view('examen.index', compact('examen', 'role'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $usuario = Auth::user()->id;
        $role = User::find($usuario)->roles;

        $profesor = Profesor::all();
        if ($role->contains('name', 'teacher')) {
            $profesor = Profesor::where('usuario_id', '=', $usuario);
        }
        $pregunta = PreguntaSimulacion::all();
        return view('examen.create', compact('profesor', 'pregunta', 'role'));
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

            $fechai = Carbon::createFromFormat('d/m/Y g:i A', $request->fecha_inicial);
            $fechaiF = $fechai->format('Y-m-d H:i:s');

            $fechaf = Carbon::createFromFormat('d/m/Y g:i A', $request->fecha_final);
            $fechafF = $fechaf->format('Y-m-d H:i:s');

            $examen = Examen::create([
                'nombre' => $request->nombre,
                'descripcion' => $request->descripcion,
                'fecha_inicial' => $fechaiF,
                'fecha_final' => $fechafF,
                'estado' => $request->estado,
                'profesor_id' => $request->profesor,
                'duracion' => $request->duracion,
                'n_pregunta' => $request->n_pregunta
            ]);

            foreach ($request->question as $q) {
                ExamenPregunta::create([
                    'examen_id' => $examen->id,
                    'pregunta_id' => $q
                ]);
            }

            DB::commit();
        } catch (Exception $ex) {
            Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
            DB::rollBack();
            return redirect()->route('examen.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }
        return redirect()->route('examen.index')->with([
            'message'    => 'Se registro el examen',
            'alert-type' => 'success',
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return redirect()->route('examen.index');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(VacunacionRequest $request, $id)
    {
        try {
            DB::beginTransaction();

            DB::commit();
        } catch (Exception $ex) {
            Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
            DB::rollBack();
            return redirect()->route('vacunacion.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }
        return redirect()->route('vacunacion.index')->with([
            'message'    => 'Se Actualizo la vacuna',
            'alert-type' => 'success',
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $usuario = Auth::user()->id;
        $role = User::find($usuario)->roles;

        $profesor = Profesor::all();
        if ($role->contains('name', 'teacher')) {
            $profesor = Profesor::where('usuario_id', '=', $usuario);
        }
        $pregunta = PreguntaSimulacion::all();
        return view('examen.create', compact('profesor', 'pregunta', 'role'));
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

            Examen::findOrFail($id)->update([
                'estado' => 'c'
            ]);

            DB::commit();
        } catch (Exception $ex) {
            Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
            DB::rollBack();
            return redirect()->route('examen.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }
        return redirect()->route('examen.index')->with([
            'message'    => 'Examen anulado',
            'alert-type' => 'success',
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function finish($id)
    {
        try {
            DB::beginTransaction();

            Examen::findOrFail($id)->update([
                'estado' => 'f'
            ]);

            DB::commit();
        } catch (Exception $ex) {
            Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
            DB::rollBack();
            return redirect()->route('examen.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }
        return redirect()->route('examen.index')->with([
            'message'    => 'Examen finalizado',
            'alert-type' => 'success',
        ]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function indexPlay()
    {
        return redirect()->route('examen.index');
    }

    /**
     * Devuelve los tipos de aplicacion
     *
     * @param $string $term dato de entrada para busqueda.
     * @param $int $page pagina de busqueda.
     *
     * @return array
     */
    public function play(Request $request, $id)
    {
        $bandera = true;
        $usuario = Auth::user()->id;
        $role = User::find($usuario)->roles;
        $estu = Estudiante::where('usuario_id', '=', $usuario)->first();

        $examen = Examen::find($id);
        $preguntas = $examen->preguntas;

        $pregunta = [];
        if (count($preguntas) > 0) {
            $simu = Simulacion::where('examen_id', '=', $examen->id)
                ->where('estudiante_id', '=', $estu->id)
                ->get();

            if (count($simu) >= $examen->n_pregunta || count($simu) >= count($preguntas)) {
                $bandera = false; // Fin del examen
            }

            $pregunta = $preguntas->reject(function ($objeto1) use ($simu) {
                return $simu->contains('pregunta_id', $objeto1->pregunta_id);
            });

            $pregunta = count($pregunta) > 0 ? $pregunta->random() : 0;
        }
        return view('examen.play', compact('examen', 'pregunta', 'role', 'bandera'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function savePlay(Request $request)
    {
        try {
            DB::beginTransaction();
            $estudiante = Estudiante::where('usuario_id', '=', auth()->id())->first();
            $sim = Simulacion::create([
                'nota' => $this->simulacionRepository->calcNota($request->question, $request->answer, $request->recurso),
                'tiempo' => $this->simulacionRepository->calcTime($request->ti),
                'pregunta_id' => $request->question,
                'estudiante_id' => $estudiante->id,
                'campo_id' => $request->campo,
                'examen_id' => $request->examen
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
            Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
            DB::rollBack();
            return redirect()->route('examen.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }
        return redirect()->route('examen.play', $request->examen)->with([
            'message'    => 'Se registro su respuesta',
            'alert-type' => 'success'
        ]);
    }
}
