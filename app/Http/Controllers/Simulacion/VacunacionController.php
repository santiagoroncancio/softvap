<?php

namespace App\Http\Controllers\Simulacion;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use App\Http\Controllers\Controller;
use App\Models\Recurso;
use App\Models\RecursoCampo;
use App\Models\ViaAplicacion;
use App\Repositories\Vacunacion\VacunacionRepository;

/**
 * Controlador Maneja Lógica de Vacunacion
 *
 * Controlador que maneja la lógica de Vacunacion.
 *
 * @package    Controllers
 * @subpackage \Simulacion
 * @copyright  2023 Sofmedip
 * @author     Santiago Roncancio <Sntgrncnc@gmail.com>
 * @version    v1.0
 */

class VacunacionController extends Controller
{
    /**
     * Objeto vacunacionRepository.
     *
     * @var object
     */
    private $vacunacionRepository;

    /**
     * Constructor de la clase.
     *
     * @access public
     * @param VacunacionRepository $vacunacionRepository
     */
    public function __construct(VacunacionRepository $vacunacionRepository)
    {
        $this->vacunacionRepository = $vacunacionRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = $this->vacunacionRepository->index();
        return view('vacunacion.index', compact('data'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('vacunacion.create');
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

            $recurso = Recurso::create([
                'nombre' => $request->nombre
            ]);

            RecursoCampo::create([
                'recurso_id' => $recurso->id,
                'campo_id' => 1,
                'valor' => $request->nombre
            ]);

            RecursoCampo::create([
                'recurso_id' => $recurso->id,
                'campo_id' => 2,
                'valor' => $request->calibre
            ]);

            RecursoCampo::create([
                'recurso_id' => $recurso->id,
                'campo_id' => 3,
                'valor' => $request->via_aplicacion
            ]);

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
            'message'    => 'Se registro la vacuna',
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
        $data = $this->vacunacionRepository->show($id);
        return view('vacunacion.edit', compact('data'));
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
        try {
            DB::beginTransaction();

            Recurso::find($id)
                ->where([
                    'nombre' => $request->nombre
                ]);

            RecursoCampo::where('recurso_id', '=', $id)
                ->where('campo_id', '=', 1)
                ->update([
                    'valor' => $request->nombre
                ]);

            RecursoCampo::where('recurso_id', '=', $id)
                ->where('campo_id', '=', 2)
                ->update([
                    'valor' => $request->calibre
                ]);

            RecursoCampo::where('recurso_id', '=', $id)
                ->where('campo_id', '=', 3)
                ->update([
                    'valor' => $request->via_aplicacion
                ]);

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
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            DB::beginTransaction();

            Recurso::findOrFail($id)->delete();
            RecursoCampo::where('recurso_id', '=', $id)->delete();

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
    public function selectTipoAplicacion(Request $request)
    {
        $term = trim($request->term) ?? '';
        $page = $request->page ?? '1';

        $um = ViaAplicacion::where('nombre', 'LIKE', '%' . $term . '%')
            ->orWhere('abreviatura', 'LIKE', '%' . $term . '%')
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
