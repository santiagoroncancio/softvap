<?php

namespace App\Http\Controllers\Usuario;

use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use App\Http\Requests\EstudianteEditRequest;
use App\Http\Requests\EstudianteRequest;
use App\Http\Requests\ProfesorEditRequest;
use App\Http\Requests\ProfesorRequest;
use App\Models\Estudiante;
use App\Models\Grupo;
use App\Models\Profesor;
use App\Models\TipoDocumento;
use App\Models\User;
use App\Repositories\Simulacion\ExamenRepository;
use App\Repositories\Usuario\EstudianteRepository;
use App\Repositories\Usuario\UsuarioRepository;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

/**
 * Controlador Maneja Lógica de Profesor
 *
 * Controlador que maneja la lógica de Profesor.
 *
 * @package    Controllers
 * @subpackage \Usuario
 * @copyright  2023 softvap 1.0
 * @author     Santiago Roncancio <Sntgrncnc@gmail.com>
 * @version    v1.0
 */

class ProfesorController extends Controller
{
    /**
     * Objeto usuarioRepository.
     *
     * @var object
     */
    private $usuarioRepository;

    /**
     * Constructor de la clase.
     *
     * @access public
     * @param examenRepository $examenRepository
     */
    public function __construct(UsuarioRepository $usuarioRepository)
    {
        $this->usuarioRepository = $usuarioRepository;
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
        $profesores = Profesor::all();
        return view('profesor.index', compact('profesores', 'role'));
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

        return view('profesor.create', compact('role', 'tDocumento'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProfesorRequest $request)
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
            ]);

            Profesor::create([
                'usuario_id' => $uUser->id,
                'estado' => $request->estado
            ]);

            DB::commit();
        } catch (Exception $ex) {
            Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
            DB::rollBack();
            return redirect()->route('profesores.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }
        return redirect()->route('profesores.index')->with([
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
        $prof = Profesor::find($id);
        $uUser = User::find($prof->usuario_id);

        $role = User::find($prof->usuario_id)->roles;
        $tDocumento = TipoDocumento::all();

        return view('profesor.edit', compact('role', 'tDocumento', 'uUser', 'prof'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ProfesorEditRequest $request, $id)
    {
        try {
            DB::beginTransaction();

            $prof = Profesor::find($id);
            $user = User::find($prof->usuario_id);

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
            $prof->update([
                'estado' => $request->estado
            ]);

            DB::commit();
        } catch (Exception $ex) {
            Log::debug($ex->getMessage() . ' - ' . $ex->getLine() . ' - ' . $ex->getFile());
            DB::rollBack();
            return redirect()->route('profesores.index')->with([
                'message'    => 'Error del sistema: Por favor comunicarse con el administrador',
                'alert-type' => 'error',
            ]);
        }
        return redirect()->route('profesores.index')->with([
            'message'    => 'Se Actualizo el estudiante',
            'alert-type' => 'success',
        ]);
    }
}
