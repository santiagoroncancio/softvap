<?php

namespace App\Http\Controllers\Estadistica;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Estudiante;
use App\Models\Simulacion;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

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
            // Admin and teacher
            $simu = Simulacion::all();
            // dd();
        } else {
            $estu = Estudiante::where('usuario_id', '=', $user->id)->first();
            $simu = Simulacion::where('estudiante_id', '=', $estu->id)->get();
        }
        return view('estadistica.index', compact('user', 'role', 'simu'));
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
