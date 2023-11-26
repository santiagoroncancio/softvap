<?php

use App\Http\Controllers\Estadistica\EstadisticaController;
use App\Http\Controllers\Simulacion\PreguntasController;
use App\Http\Controllers\Simulacion\SimulacionController;
use App\Http\Controllers\Simulacion\VacunacionController;
use App\Http\Controllers\Simulacion\ExamenController;
use App\Http\Controllers\Usuario\EstudianteController;
use App\Http\Controllers\Usuario\ProfesorController;
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

Route::middleware(['auth'])->group(function () {
    Route::middleware(['checkRole:admin'])->group(function () {
        Route::resource('profesores', ProfesorController::class);
    });

    Route::middleware(['checkRole:admin,teacher'])->group(function () {
        Route::post('examen/finish/{id}', [ExamenController::class, 'finish'])->name('examen.finish');
        Route::post('examen/state/{id}', [ExamenController::class, 'state'])->name('examen.state');

        Route::resource('vacunacion', VacunacionController::class);
        Route::resource('preguntas', PreguntasController::class);
        Route::resource('usuarios', UsuarioController::class);
        Route::resource('estudiantes', EstudianteController::class);
    });

    // Rutas de examen
    Route::get('examen/play', [ExamenController::class, 'indexPlay'])->name('examen.indexPlay');
    Route::get('examen/play/{id}', [ExamenController::class, 'play'])->name('examen.play');
    Route::post('examen/savePlay', [ExamenController::class, 'savePlay'])->name('examen.savePlay');
    Route::get('examen/results/{id}', [ExamenController::class, 'resultados'])->name('examen.results');
    Route::resource('examen', ExamenController::class);

    // Rutas de Simulacion
    Route::get('lab-simulacion/random', [SimulacionController::class, 'random'])->name('lab-simulacion.random');
    Route::get('lab-simulacion/resultados', [SimulacionController::class, 'results'])->name('lab-simulacion.results');
    Route::resource('lab-simulacion', SimulacionController::class);

    // Rutas de estadisticas
    Route::get('estadistica/intentos', [EstadisticaController::class, 'intentos'])->name('estadistica.intentos');
    Route::get('estadistica/preguntas', [EstadisticaController::class, 'preguntas'])->name('estadistica.preguntas');
    Route::get('estadistica/preguntas/{id}', [EstadisticaController::class, 'cPregunta'])->name('estadistica.preguntas');
    Route::resource('estadistica', EstadisticaController::class);
});

Route::group(['prefix' => '/'], function () {
    Voyager::routes();
});
