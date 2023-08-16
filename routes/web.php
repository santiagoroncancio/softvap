<?php

use App\Http\Controllers\Estadistica\EstadisticaController;
use App\Http\Controllers\Simulacion\PreguntasController;
use App\Http\Controllers\Simulacion\SimulacionController;
use App\Http\Controllers\Simulacion\VacunacionController;
use App\Http\Controllers\Simulacion\ExamenController;
use App\Http\Controllers\Usuario\UsuarioController;
use Illuminate\Support\Facades\Route;
use TCG\Voyager\Facades\Voyager;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('lab-simulacion/random', [SimulacionController::class, 'random'])->name('lab-simulacion.random');
Route::get('lab-simulacion/resultados', [SimulacionController::class, 'results'])->name('lab-simulacion.results');

Route::get('examen/results', [ExamenController::class, 'resultados'])->name('examen.resultados');
Route::get('examen/play', [ExamenController::class, 'indexPlay'])->name('examen.indexPlay');
Route::get('examen/play/{id}', [ExamenController::class, 'play'])->name('examen.play');
Route::post('examen/savePlay', [ExamenController::class, 'savePlay'])->name('examen.savePlay');

Route::resource('lab-simulacion', SimulacionController::class);
Route::resource('examen', ExamenController::class);
Route::resource('vacunacion', VacunacionController::class);
Route::resource('preguntas', PreguntasController::class);
Route::resource('usuarios', UsuarioController::class);
Route::resource('estadistica', EstadisticaController::class);


Route::group(['prefix' => '/'], function () {
    Voyager::routes();
});
