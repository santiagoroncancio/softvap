<?php

namespace App\Http\Controllers\Simulacion;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Http\Requests\VacunacionRequest;
use App\Models\Estudiante;
use App\Models\Examen;
use App\Models\ExamenEstudiante;
use App\Models\ExamenPregunta;
use App\Models\PreguntaSimulacion;
use App\Models\Profesor;
use App\Models\RespuestaSimulacion;
use App\Models\Simulacion;
use App\Models\User;
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
 * @copyright  2023 softvap 1.0
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

        $examen = $examen->map(function ($examen) {
            $examen->disponible = (date('Y-m-d H:i:s') >= $examen->fecha_inicial && $examen->fecha_final >= date('Y-m-d H:i:s')) ? true : false; // Agregar el atributo
            return $examen;
        });

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

        $profesor = Profesor::where('usuario_id', '=', $usuario);
        if ($role->contains(function ($valor, $clave) {
            return in_array($valor['name'], ['admin']);
        })) {
            $profesor = Profesor::all();
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

            $fechai = Carbon::createFromFormat('m/d/Y g:i A', $request->fecha_inicial)->format('Y-m-d H:i:s');
            $fechaf = Carbon::createFromFormat('m/d/Y g:i A', $request->fecha_final)->format('Y-m-d H:i:s');

            $examen = Examen::create([
                'nombre' => $request->nombre,
                'descripcion' => $request->descripcion,
                'fecha_inicial' => $fechai,
                'fecha_final' => $fechaf,
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
    public function state($id)
    {
        try {
            DB::beginTransaction();

            $exam = Examen::findOrFail($id);
            if ($exam == null || !(($exam->estado == 's') || ($exam->estado == 'n'))) {
                return redirect()->route('examen.index')->with([
                    'message'    => 'Estado examen no valido: Por favor comunicarse con el administrador',
                    'alert-type' => 'error',
                ]);
            }

            Examen::find($id)->update([
                'estado' => $exam->estado == 's' ? 'n' : 's'
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
            'message'    => 'Examen ',
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

            $examen = Examen::find($id);
            $simu = Simulacion::where('examen_id', '=', $id)
                ->get()
                ->groupBy('estudiante_id');

            foreach ($simu as $sm) {
                $suma = 0;
                foreach ($sm as $s) {
                    $duracionSegundos = strtotime($s->tiempo) - strtotime('00:00:00');
                    $suma += $duracionSegundos;
                }

                $cc = Carbon::parse($suma);
                $sum = $sm->sum('nota');
                $avg = $sum / $examen->n_pregunta;

                ExamenEstudiante::create([
                    'examen_id' => $sm->first()->examen_id,
                    'estudiante_id' => $sm->first()->estudiante_id,
                    'nota' => round($avg, 2),
                    'tiempo' => $cc->format('H:i:s')
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
            'message'    => 'Examen finalizado',
            'alert-type' => 'success',
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function resultados($id)
    {
        $usuario = Auth::user()->id;
        $role = User::find($usuario)->roles;
        $examen = Examen::find($id);
        $resultados = $examen->resultados->sortBy('tiempo')->sortByDesc('nota');

        $dataResultado = [];


        if ($role->contains(function ($valor, $clave) {
            return in_array($valor['name'], ['admin', 'teacher']);
        })) {
            $resultado = Simulacion::where('examen_id', '=', $id)
                ->get();
        } else {
            $resultado = Simulacion::where('examen_id', '=', $id)
                ->where('estudiante_id', '=', Estudiante::where('usuario_id', '=', $usuario)->first()->id)
                ->get();
        }

        foreach ($resultado as $res) {
            $resCo = [];
            $resDig = [];
            foreach ($res->pregunta->respuestas as $aux) {
                $temp = null;
                if ($res->campo_id == 1) {
                    $temp = $this->simulacionRepository->nombreVacuna($aux->valor);
                } elseif ($res->campo_id == 2) {
                    $temp = $this->simulacionRepository->calibreVacuna($aux->valor);
                } elseif ($res->campo_id == 3) {
                    $temp = $this->simulacionRepository->viaAplicacionVacuna($aux->valor);
                } else {
                    $temp = $aux->valor;
                }
                array_push($resCo, $temp);
            }
            foreach ($res->respuesta as $aux) {
                $temp = null;
                if ($res->pregunta->campo_id == 1) {
                    $temp = $this->simulacionRepository->nombreVacuna($aux->valor);
                } elseif ($res->pregunta->campo_id == 2) {
                    $temp = $this->simulacionRepository->nombreVacuna($aux->recurso_id) . ' - ' . $aux->valor;
                } elseif ($res->pregunta->campo_id == 3) {
                    $temp = $this->simulacionRepository->nombreVacuna($aux->recurso_id) . ' - ' . $this->simulacionRepository->viaAplicacion($aux->valor);
                } else {
                    $temp = $aux->valor;
                }
                array_push($resDig, $temp);
            }

            array_push($dataResultado, [
                "res" => $res,
                "resCo" => $resCo,
                "resDig" => $resDig
            ]);
        }

        return view('examen.results', compact('usuario', 'role', 'examen', 'resultados', 'dataResultado'));
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

        if ($examen->estado != 's') {
            return redirect()->route('examen.index')->with([
                'message'    => 'Examen no disponible: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }

        if ($estu == null) {
            return redirect()->route('lab-simulacion.index')->with([
                'message'    => 'Estudiante no valido: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }

        $preguntas = $examen->preguntas;

        $lim = (date('Y-m-d H:i:s') >= $examen->fecha_inicial && $examen->fecha_final >= date('Y-m-d H:i:s')) ? true : false;

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
        return view('examen.play', compact('examen', 'pregunta', 'role', 'bandera', 'lim'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function savePlay(Request $request)
    {

        $exam = Examen::find($request->examen);
        $estudiante = Estudiante::where('usuario_id', '=', auth()->id())->first();

        if ($exam->estado != 's') {
            return redirect()->route('examen.index')->with([
                'message'    => 'Examen no disponible: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }

        if ($estudiante == null) {
            return redirect()->route('lab-simulacion.index')->with([
                'message'    => 'Estudiante no valido: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }

        try {
            DB::beginTransaction();
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
