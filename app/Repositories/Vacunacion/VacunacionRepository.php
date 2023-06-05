<?php

namespace App\Repositories\Vacunacion;

use Illuminate\Support\Facades\DB;

/**
 * Repositorio Vacunacion
 *
 * Repositorio que controla la lógica de Vacunacion
 *
 * @package    Repositories
 * @subpackage \vacunacion
 * @copyright  2022 Sisoft Soluciones Informáticas S.A.S.
 * @author     Santiago Roncancio <sntgrncnc@gmail.com>
 * @version    v1.0.0
 */
class VacunacionRepository
{
    /**
     * Constuctor de la clase.
     *
     * @access public
     */
    public function __construct()
    {
    }

    /**
     * Mostrar una lista del recurso
     *
     * @access public
     * @param int $company empresa a consultar.
     * @return \Illuminate\Database\Query\Builder resultados encontrados.
     */
    public function index()
    {
        return DB::table('recursos as r')
            ->join('recurso_campos as n', function ($e) {
                $e->on('n.recurso_id', '=', 'r.id')
                    ->where('n.campo_id', '=', 1);
            })
            ->join('recurso_campos as ta', function ($e) {
                $e->on('ta.recurso_id', '=', 'r.id')
                    ->where('ta.campo_id', '=', 2);
            })
            ->join('recurso_campos as va', function ($e) {
                $e->on('va.recurso_id', '=', 'r.id')
                    ->where('va.campo_id', '=', 3);
            })
            ->select(
                'r.id',
                'n.valor as nombre',
                'ta.valor as tipo_aplicacion',
                'va.valor as via_aplicacion'
            )
            ->get();
    }
}
