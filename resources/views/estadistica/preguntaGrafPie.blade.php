@extends('voyager::master')

@section('page_title', 'Estadística')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-pie-graph"></i> Estadística
    </h1>
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <h5 class="card-title text-left">Pregunta: <span>{{ $pregu->pregunta }}</span></h5>
                <div class="card-body">
                    <div class="">
                        <ul class="list-group">
                            <li class="list-group-item"><span style="font-weight: bold;">Respuesta Correcta: </span> {{ implode(', ', $resCo) }}</li>
                            <li class="list-group-item"><span style="font-weight: bold;">Escenario: </span> {{ $pregu->escenario->nombre }}</li>
                            <li class="list-group-item"><span style="font-weight: bold;">Nivel: </span> {{ $pregu->nivel->nombre }}</li>
                        </ul>
                    </div>
                    <table class="table table-striped" id="dataTable">
                        <thead>
                            <tr>
                                <th scope="col">Respuestas Enviadas</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($resDig as $dig)
                            <tr>
                                <td>{{ implode(', ', $dig) }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" style="margin-bottom: 10px;">
                <h5 class="card-title text-center">Aprobación</h5>
                <div class="card-body">
                    <div>
                        <canvas id="gPregunta" height="100%"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('css')
@stop

@section('javascript')
<script src="{{ asset('js/chart.js') }}" defer></script>

<script type="text/javascript">
    $(document).ready(function() {
        let fecha = [];
        let pregunta = [];
        let nota = [];

        let TableResult = $('#dataTable').DataTable({
            destroy: true,
            pageLength: 10,
            lengthChange: true,
            paging: true,
            searching: true,
            ordering: true,
            info: true,
            responsive: true,
            order: [
                [0, 'desc']
            ],
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json',
            }
        });

        const gPregunta = new Chart(
            document.getElementById('gPregunta'), {
                type: 'pie',
                data: {
                    labels: ['Aprobado', 'Perdido'], // Etiquetas para los segmentos
                    datasets: [{
                        label: 'Grafica Aprobación',
                        backgroundColor: ['rgb(75, 192, 75)', 'rgb(255, 99, 132)'], // Colores para los segmentos
                        borderColor: 'white', // Color del borde
                        data: ['{{$aprobado}}', '{{100 - $aprobado}}'], // Porcentaje de aprobados y perdidos (ajusta estos valores)
                    }]
                },
                options: {}
            }
        );
    });
</script>
@stop