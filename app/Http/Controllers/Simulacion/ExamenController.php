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
use App\Models\Examen;
use App\Models\ExamenPregunta;
use App\Models\PreguntaSimulacion;
use App\Models\Profesor;
use App\Models\Recurso;
use App\Models\RecursoCampo;
use App\Models\User;
use App\Models\ViaAplicacion;
use App\Repositories\Simulacion\ExamenRepository;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

/**
 * Controlador Maneja Lógica de Examen
 *
 * Controlador que maneja la lógica de Examen.
 *
 * @package    Controllers
 * @subpackage \Simulacion
 * @copyright  2023 Sofmedip
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
     * Constructor de la clase.
     *
     * @access public
     * @param examenRepository $examenRepository
     */
    public function __construct(ExamenRepository $examenRepository)
    {
        $this->examenRepository = $examenRepository;
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
        // $data = $this->vacunacionRepository->show($id);
        // return view('vacunacion.edit', compact('data'));
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
            'message'    => 'Se Elimino la vacuna',
            'alert-type' => 'success',
        ]);
    }

    /**
     * Devuelve los tipos de aplicacion
     *
     * @param $string $term dato de entrada para busqueda.
     * @param $int $page pagina de busqueda.
     *
     * @return array
     */
    public function play(Request $request)
    {
        $usuario = Auth::user()->id;
        $role = User::find($usuario)->roles;

        $examen = Examen::find($request->id);
        $pregunta = [];
        if (count($examen->preguntas) > 0) {
            $pregunta = $examen->preguntas->shuffle()->take($examen->n_pregunta);
        }
        return view('examen.play', compact('examen', 'pregunta', 'role'));
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
}
