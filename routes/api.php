<?php

use App\Http\Controllers\Simulacion\PreguntasController;
use App\Http\Controllers\Simulacion\VacunacionController;
use App\Http\Controllers\Usuario\UsuarioController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Datatables
Route::get('datatable/preguntas', [PreguntasController::class, 'datatableIndex']);

// Select
Route::get('select/tipo-documento', [UsuarioController::class, 'selectTipoDocumento']);
Route::get('select/grupo', [UsuarioController::class, 'selectGrupo']);

Route::get('select/escenarios', [PreguntasController::class, 'selectEscenario']);
Route::get('select/niveles', [PreguntasController::class, 'selectNivel']);
Route::get('select/categorias', [PreguntasController::class, 'selectCategoria']);
Route::get('select/recursos', [PreguntasController::class, 'selectRecursos']);
Route::get('select/tipoAplicacion', [VacunacionController::class, 'selectTipoAplicacion']);


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
