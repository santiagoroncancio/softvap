<?php

namespace App\Http\Controllers\Estadistica;

use App\Exports\Estadistica\EstadisticaParticipacionExport;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Jobs\Estadistica\JobEstadistica;
use App\Models\Estudiante;
use App\Models\PreguntaSimulacion;
use App\Models\Simulacion;
use App\Models\User;
use App\Repositories\Simulacion\SimulacionRepository;
use Exception;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response as FacadesResponse;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;
use Ramsey\Uuid\Uuid;

/**
 * Controlador Maneja Lógica de Estadistica.
 *
 * Controlador que maneja la lógica de Simulación.
 *
 * @package    Controllers
 * @subpackage \Estadistica
 * @copyright  2023 softvap 1.0
 * @author     Santiago Roncancio <Sntgrncnc@gmail.com>
 * @version    v1.0
 */

class EstadisticaController extends Controller
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
        $user = Auth::user();
        $role = User::find($user->id)->roles;

        if ($role->contains(function ($valor, $clave) {
            return in_array($valor['name'], ['admin', 'teacher']);
        })) {
            $simu = Simulacion::all();
        } else {
            $estu = Estudiante::where('usuario_id', '=', $user->id)->first();
            $simu = Simulacion::where('estudiante_id', '=', $estu->id)->get();
        }
        return view('estadistica.grafIntento', compact('user', 'role', 'simu'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function intentos()
    {
        $user = Auth::user();
        $role = User::find($user->id)->roles;

        if ($role->contains(function ($valor, $clave) {
            return in_array($valor['name'], ['admin', 'teacher']);
        })) {
            $simu = Simulacion::all();
        } else {
            $estu = Estudiante::where('usuario_id', '=', $user->id)->first();
            $simu = Simulacion::where('estudiante_id', '=', $estu->id)->get();
        }
        return view('estadistica.grafIntento', compact('user', 'role', 'simu'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function preguntas()
    {
        $user = Auth::user();
        $role = User::find($user->id)->roles;

        $pregu = PreguntaSimulacion::all();

        return view('estadistica.indexPreguntas', compact('user', 'role', 'pregu'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function cPregunta($id)
    {
        $user = Auth::user();
        $role = User::find($user->id)->roles;

        $pregu = PreguntaSimulacion::find($id);

        $resCo = [];
        $resDig = [];
        $nota = [];

        foreach ($pregu->respuestas as $aux) {
            $temp = null;
            if ($pregu->campo_id == 1) {
                $temp = $this->simulacionRepository->nombreVacuna($aux->valor);
            } elseif ($pregu->campo_id == 2) {
                $temp = $this->simulacionRepository->calibreVacuna($aux->valor);
            } elseif ($pregu->campo_id == 3) {
                $temp = $this->simulacionRepository->viaAplicacionVacuna($aux->valor);
            } else {
                $temp = $aux->valor;
            }
            array_push($resCo, $temp);
        }
        foreach ($pregu->simulaciones as $simu) {
            $arrAux = [];
            foreach ($simu->respuesta as $aux) {
                $temp = null;
                if ($simu->pregunta->campo_id == 1) {
                    $temp = $this->simulacionRepository->nombreVacuna($aux->valor);
                } elseif ($simu->pregunta->campo_id == 2) {
                    $temp = $this->simulacionRepository->nombreVacuna($aux->recurso_id) . ' - ' . $aux->valor;
                } elseif ($simu->pregunta->campo_id == 3) {
                    $temp = $this->simulacionRepository->nombreVacuna($aux->recurso_id) . ' - ' . $this->simulacionRepository->viaAplicacion($aux->valor);
                } else {
                    $temp = $aux->valor;
                }
                array_push($arrAux, $temp);
            }
            array_push($nota, $simu->nota);
            array_push($resDig, $arrAux);
        }

        $aprobado = $this->simulacionRepository->aprobado($nota);

        return view('estadistica.preguntaGrafPie', compact('user', 'role', 'pregu', 'resCo', 'resDig', 'aprobado'));
    }


    /**
     * Genera reporte de Predios Dia
     *
     * @access public
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function export(Request $request)
    {
        try {
            // Llamamos al jobs.
            // JobEstadistica::dispatch($request->all());

            $uuid4 = Uuid::uuid4();
            $documento = $uuid4->toString() . '.xlsx';
            $url = Storage::disk('public')->url('excel/' . $documento);
            Excel::store(new EstadisticaParticipacionExport($request->all()), 'excel/' . $documento, 'public');
        } catch (Exception $ex) {
            Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
            return redirect()->route('estadistica.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }

        $file = public_path() . "/storage/excel/" . $documento;
        $headers = array(
            'Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', // Tipo de contenido para Excel
        );

        return FacadesResponse::download($file, $documento, $headers);
        // return redirect()->route('estadistica.index')->with([
        //     'message'    => 'Exportación exitosa.',
        //     'alert-type' => 'success',
        // ]);
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // 
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // 
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // 
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
}
