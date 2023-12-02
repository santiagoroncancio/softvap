<?php

namespace App\Exports\Traits;

/**
 * Tratis Para los Reportes de Presupuesto.
 * @package App\Exports\Traits
 */
trait StyleCell
{
	/**
	 * Retorna el estilo para celdas negras.
	 * @return array
	 */
	public function styleDark()
	{
		$style = [
			'font' => [
				'bold' => true,
				'color' => [
					'rgb' => '202020',
				],
			],
			'alignment' => [
				'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
				'vertical'   => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
				'wrap'       => true,
			],
			'borders' => [
				'allBorders' => [
					'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK,
					'color' => [
						'rgb' => '202020'
					],
				],
			],
			'fill' => [
				'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_GRADIENT_LINEAR,
				'rotation' => 90,
				'startColor' => [
					'argb' => 'FFA0A0A0',
				],
				'endColor' => [
					'argb' => 'FFA0A0A0',
				],
			],
		];
		return $style;
	}
	/**
	 * Retorna el estilo para celdas blanca.
	 * @return array
	 */
	public function styleWhite()
	{
		$style = [
			'font' => [
				'bold' => true,
				'color' => [
					'rgb' => '202020',
				],
			],
			'alignment' => [
				'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
				'vertical'   => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
				'wrap'       => true,
			],
			'borders' => [
				'allBorders' => [
					'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK,
					'color' => [
						'rgb' => '202020'
					],
				],
			],
		];
		return $style;
	}

	/**
	 * Retorna el estilo para celdas de otro color.
	 * @return array
	 */
	public function styleOther()
	{
		$style = [
			'font' => [
				'bold' => true,
				'color' => [
					'rgb' => '202020',
				],
			],
			'alignment' => [
				'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT,
				'vertical'   => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
				'wrap'       => true,
			],
			'borders' => [
				'allBorders' => [
					'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK,
					'color' => [
						'rgb' => '202020'
					],
				],
			],
			'fill' => [
				'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_GRADIENT_LINEAR,
				'rotation' => 90,
				'startColor' => [
					'argb' => '33A5FF',
				],
				'endColor' => [
					'argb' => '33A5FF',
				],
			],
		];
		return $style;
	}
}
