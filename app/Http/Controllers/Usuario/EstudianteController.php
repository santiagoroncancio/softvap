<?php

namespace App\Http\Controllers\Usuario;

use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Http\Requests\EstudianteEditRequest;
use App\Http\Requests\EstudianteRequest;
use App\Models\Estudiante;
use App\Models\Grupo;
use App\Models\TipoDocumento;
use App\Models\User;
use App\Repositories\Simulacion\ExamenRepository;
use App\Repositories\Usuario\EstudianteRepository;
use App\Repositories\Usuario\UsuarioRepository;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

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

class EstudianteController extends Controller
{
    /**
     * Objeto usuarioRepository.
     *
     * @var object
     */
    private $usuarioRepository;

    /**
     * Objeto estudianteRepository.
     *
     * @var object
     */
    private $estudianteRepository;

    /**
     * Constructor de la clase.
     *
     * @access public
     * @param examenRepository $examenRepository
     */
    public function __construct(UsuarioRepository $usuarioRepository, EstudianteRepository $estudianteRepository)
    {
        $this->usuarioRepository = $usuarioRepository;
        $this->estudianteRepository = $estudianteRepository;
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
        $estudiante = Estudiante::all();
        return view('estudiante.index', compact('estudiante', 'role'));
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

        $tDocumento = TipoDocumento::all();
        $grupo = Grupo::all();

        return view('estudiante.create', compact('role', 'tDocumento', 'grupo'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(EstudianteRequest $request)
    {
        try {
            DB::beginTransaction();

            $uUser = User::create([
                'tipo_documento' => $request->tidentification,
                'identification' => $request->identification,
                'name' => $request->name,
                'surname' => $request->surname,
                'email' => $request->email,
                'password' => bcrypt($request->passw),
                'estado' => $request->estado
            ]);

            Estudiante::create([
                'codigo_estudiante' => $request->codigoEstudiante,
                'usuario_id' => $uUser->id,
                'grupo_id' => $request->grupo
            ]);

            DB::commit();
        } catch (Exception $ex) {
            Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
            DB::rollBack();
            return redirect()->route('estudiantes.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }
        return redirect()->route('estudiantes.index')->with([
            'message'    => 'Se registro el estudiante',
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
        // $usuario = Auth::user()->id;
        $estu = Estudiante::find($id);
        $uUser = User::find($estu->usuario_id);

        $role = User::find($estu->usuario_id)->roles;

        $tDocumento = TipoDocumento::all();
        $grupo = Grupo::all();

        return view('estudiante.edit', compact('role', 'tDocumento', 'grupo', 'uUser', 'estu'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(EstudianteEditRequest $request, $id)
    {
        try {
            DB::beginTransaction();

            $estu = Estudiante::find($id);
            $user = User::find($estu->usuario_id);

            $updateData = [
                'tipo_documento' => $request->tidentification,
                'identification' => $request->identification,
                'name' => $request->name,
                'surname' => $request->surname,
                'email' => $request->email
            ];

            // Verifica si la contraseña proporcionada no está vacía
            if (!empty($request->passw)) {
                $updateData['password'] = bcrypt($request->passw);
            }

            $user->update($updateData);
            $estu->update([
                'codigo_estudiante' => $request->codigoEstudiante,
                'grupo_id' => $request->grupo,
                'estado' => $request->estado
            ]);

            DB::commit();
        } catch (Exception $ex) {
            Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
            DB::rollBack();
            return redirect()->route('estudiantes.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }
        return redirect()->route('estudiantes.index')->with([
            'message'    => 'Se Actualizo el estudiante',
            'alert-type' => 'success',
        ]);
    }
}
