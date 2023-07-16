<?php

namespace App\Repositories\Usuario;

use Illuminate\Support\Facades\DB;

/**
 * Repositorio Usuario
 *
 * Repositorio que controla la lógica de Usuario
 *
 * @package    Repositories
 * @subpackage \Usuario
 * @copyright  2023 Unillanos
 * @author     Santiago Roncancio <sntgrncnc@gmail.com>
 * @version    v1.0.0
 */
class UsuarioRepository
{
    /**
     * Mostrar una lista del recurso
     *
     * @access public
     * @return \Illuminate\Database\Query\Builder resultados encontrados.
     */
    public function index()
    {
        // return DB::table('recursos as r')
        //     ->join('recurso_campos as n', function ($e) {
        //         $e->on('n.recurso_id', '=', 'r.id')
        //             ->where('n.campo_id', '=', 1);
        //     })
        //     ->join('recurso_campos as ta', function ($e) {
        //         $e->on('ta.recurso_id', '=', 'r.id')
        //             ->where('ta.campo_id', '=', 2);
        //     })
        //     ->join('recurso_campos as va', function ($e) {
        //         $e->on('va.recurso_id', '=', 'r.id')
        //             ->where('va.campo_id', '=', 3);
        //     })
        //     ->join('via_aplicaciones as vpl', 'vpl.id', '=', 'va.valor')
        //     ->select(
        //         'r.id',
        //         'n.valor as nombre',
        //         'ta.valor as tipo_aplicacion',
        //         'vpl.nombre as via_aplicacion'
        //     )
        //     ->get();
    }
}
