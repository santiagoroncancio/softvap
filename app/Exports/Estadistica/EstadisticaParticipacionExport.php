<?php

namespace App\Exports\Estadistica;

use App\Exports\Traits\StyleCell;
use App\Models\User;
use App\Repositories\Simulacion\SimulacionRepository;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Events\AfterSheet;
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithCustomStartCell;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;

/**
 * Reporte Datos Estadistica Participacion
 *
 * Generar el reporte de Estadistica Participacion
 *
 * @package    Exports
 * @subpackage \Estadistica
 * @copyright  2023 SOFTVAP
 * @author     Santiago Roncancio <sntgrncnc@gmail.com>
 * @version    v1.0.0
 */

class EstadisticaParticipacionExport implements
    FromCollection,
    WithColumnFormatting,
    ShouldAutoSize,
    WithTitle,
    WithEvents,
    WithMapping,
    WithCustomStartCell,
    WithHeadings
{
    use Exportable;
    use StyleCell;

    /**
     * Datos de la solicitud.
     *
     * @var array
     */
    private $request;

    private $simulacionRepository;

    /**
     * Constuctor de la clase.
     *
     * @access public
     * @param array $request
     */
    public function __construct(array $request)
    {
        $this->request = $request;
        $this->simulacionRepository = new SimulacionRepository();
    }

    /**
     * Obtiene los datos del reporte.
     *
     * @access public
     * @return Illuminate\Support\Collection
     */
    public function collection()
    {
        // $data = collect([]);
        $data = $this->simulacionRepository->getReportsEstadistica();
        return collect($data);
    }

    /**
     * Agregar una fila de encabezado.
     *
     * @access public
     * @return array
     */
    public function headings(): array
    {
        return [];
    }

    /**
     * Celda de inicio personalizada.
     *
     * @access public
     * @return string
     */
    public function startCell(): string
    {
        return 'B8';
    }

    /**
     * Establece el título del libro de trabajo o de la hoja de trabajo.
     *
     * @access public
     * @return string
     */
    public function title(): string
    {
        return 'REPORTE DE PARTICIPACIÓN';
    }

    /**
     * Dar formato a determinadas columnas.
     *
     * @access public
     * @return array
     */
    public function columnFormats(): array
    {
        return [
            'I' => '#,##0.00'
        ];
    }

    /**
     * Mapeo de datos.
     *
     * @access public
     * @param Illuminate\Support\Collection
     * @return array
     */
    public function map($data): array
    {
        return [
            $data->codigo_estudiante,
            $data->nombre_estudiante,
            $data->grupo_estudiante,
            $data->escenario,
            $data->pregunta,
            $data->dificultad,
            $data->fecha,
            $data->tiempo,
            $data->nota,
            $data->escenario,
        ];
    }

    /**
     * Oyentes de eventos de registro automático.
     *
     * @access public
     * @return array
     */
    public function registerEvents(): array
    {
        $style1 = [
            'font' => [
                'color' => [
                    'rgb' => '355269'
                ],
                'size' => 20,
                'name' => 'Times New Roman'
            ]
        ];
        $style2 = [
            'font' => [
                'color' => [
                    'rgb' => 'ffffff'
                ],
                'size' => 9,
                'name' => 'Times New Roman'
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                'vertical'   => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                'wrap'       => true
            ],
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'color' => [
                    'rgb' => '355269'
                ]
            ]
        ];
        $style3 = [
            'font' => [
                'color' => [
                    'rgb' => '595959'
                ],
                'size' => 16,
                'name' => 'Times New Roman'
            ],
            'alignment' => [
                'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_TOP
            ]
        ];
        $style4 = [
            'font' => [
                'bold' => true,
                'color' => [
                    'rgb' => '595959'
                ],
                'size' => 11,
                'name' => 'Times New Roman'
            ]
        ];
        $style5 = [
            'font' => [
                'bold' => true,
                'color' => [
                    'rgb' => '355269'
                ],
                'size' => 11,
                'name' => 'Times New Roman'
            ]
        ];

        return [
            AfterSheet::class => function (AfterSheet $event) use ($style1, $style2, $style3, $style4, $style5) {
                $event->sheet->getDelegate()->getParent()->getDefaultStyle()->getFont()->setName('Times New Roman');
                $event->sheet->getDelegate()->getParent()->getDefaultStyle()->getFont()->setSize(10);
                $event->sheet->getColumnDimension('B')->setAutoSize(true);
                $event->sheet->getColumnDimension('C')->setAutoSize(true);
                $event->sheet->getColumnDimension('D')->setAutoSize(true);
                $event->sheet->getColumnDimension('E')->setAutoSize(true);
                $event->sheet->getColumnDimension('F')->setAutoSize(true);
                $event->sheet->getColumnDimension('G')->setAutoSize(true);
                $event->sheet->getColumnDimension('H')->setAutoSize(true);
                $event->sheet->getColumnDimension('I')->setAutoSize(true);

                // Estilos del encabezado principal.
                $event->sheet->getStyle('B1:E2')->applyFromArray($style1);
                $event->sheet->getStyle('B3:F4')->applyFromArray($style3);
                $event->sheet->getStyle('B5')->applyFromArray($style4);
                $event->sheet->getStyle('C5')->applyFromArray($style5);

                // Encabezado Principal.
                $event->sheet->getColumnDimension('A')->setWidth(3);
                $event->sheet->setCellValue('B1', 'REPORTE DE PARTICIPACIÓN');
                $event->sheet->mergeCells('B1:E2');
                $event->sheet->setCellValue('B3', "PROFESOR: " . User::find(Auth::user()->id)->getName());
                $event->sheet->mergeCells('B3:F4');
                $event->sheet->setCellValue('B5', 'FECHA CREACIÓN');
                $event->sheet->setCellValue('C5', Carbon::now());
                $event->sheet->mergeCells('C5:F5');

                // Estilos del encabezado del reporte.
                $event->sheet->getStyle('B7')->applyFromArray($style2);
                $event->sheet->getStyle('C7')->applyFromArray($style2);
                $event->sheet->getStyle('D7')->applyFromArray($style2);
                $event->sheet->getStyle('E7')->applyFromArray($style2);
                $event->sheet->getStyle('F7')->applyFromArray($style2);
                $event->sheet->getStyle('G7')->applyFromArray($style2);
                $event->sheet->getStyle('H7')->applyFromArray($style2);
                $event->sheet->getStyle('I7')->applyFromArray($style2);
                $event->sheet->getStyle('J7')->applyFromArray($style2);

                // Encabezados.
                $event->sheet->setCellValue('B7', 'CÓDIGO DEL ESTUDIANTE');
                $event->sheet->setCellValue('C7', 'NOMBRE DEL ESTUDIANTE');
                $event->sheet->setCellValue('D7', 'GRUPO');
                $event->sheet->setCellValue('E7', 'ESCENARIO');
                $event->sheet->setCellValue('F7', 'PREGUNTA');
                $event->sheet->setCellValue('G7', 'DIFICULTAD');
                $event->sheet->setCellValue('H7', 'FECHA');
                $event->sheet->setCellValue('I7', 'TIEMPO (seg)');
                $event->sheet->setCellValue('J7', 'NOTA');
            }
        ];
    }
}
