<?php

namespace App\Http\Controllers\Usuario;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Http\Requests\VacunacionRequest;
use App\Models\TipoDocumento;
use App\Repositories\Simulacion\ExamenRepository;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;

/**
 * Controlador Maneja Lógica de Estudiante
 *
 * Controlador que maneja la lógica de Estudiante.
 *
 * @package    Controllers
 * @subpackage \Usuario
 * @copyright  2023 softvap 1.0
 * @author     Santiago Roncancio <Sntgrncnc@gmail.com>
 * @version    v1.0
 */

class UsuarioController extends Controller
{
    /**
     * Constructor de la clase.
     *
     * @access public
     * @param examenRepository $examenRepository
     */
    public function __construct()
    {
        // $this->usuarioRepository = $usuarioRepository;
        // $this->estudianteRepository = $estudianteRepository;
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

        $um = TipoDocumento::where('nombre', 'LIKE', '%' . $term . '%')
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
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $usuario = Auth::user()->id;
        // $role = User::find($usuario)->roles;
        // $estudiante = Estudiante::all();
        // return view('estudiante.index', compact('estudiante', 'role'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //     $usuario = Auth::user()->id;
        //     $role = User::find($usuario)->roles;

        //     return view('estudiante.create', compact('role'));
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
        // try {
        //     DB::beginTransaction();

        //     DB::commit();
        // } catch (Exception $ex) {
        //     Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
        //     DB::rollBack();
        //     return redirect()->route('vacunacion.index')->with([
        //         'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
        //         'alert-type' => 'error',
        //     ]);
        // }
        // return redirect()->route('vacunacion.index')->with([
        //     'message'    => 'Se Actualizo la vacuna',
        //     'alert-type' => 'success',
        // ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // $usuario = Auth::user()->id;
        // $role = User::find($usuario)->roles;

        // $profesor = Profesor::all();
        // if ($role->contains('name', 'teacher')) {
        //     $profesor = Profesor::where('usuario_id', '=', $usuario);
        // }
        // $pregunta = PreguntaSimulacion::all();
        // return view('examen.create', compact('profesor', 'pregunta', 'role'));
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
}
