<?php

namespace App\Jobs\Estadistica;

use App\Exports\Estadistica\EstadisticaParticipacionExport;
use Exception;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;
use Ramsey\Uuid\Uuid;

class JobEstadistica implements ShouldQueue
{
    use Dispatchable;
    use InteractsWithQueue;
    use Queueable;
    use SerializesModels;

    /**
     * Cantidad de intentos.
     *
     * @var int
     */
    public $tries = 2;

    /**
     * Tiempo de ejecución.
     *
     * @var int
     */
    public $timeout = 9999999;

    /**
     * Datos de la solicitud.
     *
     * @var array
     */
    private $data;

    /**
     * Constuctor de la clase.
     *
     * @access public
     * @param array $data
     */
    public function __construct(array $data)
    {
        $this->data = $data;
    }

    /**
     * Ejecutar jobs.
     *
     * @access public
     * @return void
     */
    public function handle()
    {
        ini_set('memory_limit', '-1');

        try {
            // Generamos nombre del documento.
            $uuid4 = Uuid::uuid4();
            $documento = $uuid4->toString() . '.xlsx';
            $url = Storage::disk('public')->url('excel/' . $documento);
            Excel::store(new EstadisticaParticipacionExport($this->data), 'excel/' . $documento, 'public');

            return $url;
        } catch (Exception $e) {
            Log::error($e->getMessage());
        }
    }


    /**
     * Evento fallido del jobs Rity.
     *
     * @access public
     * @return void
     */
    public function failed(): void
    {
    }
}
