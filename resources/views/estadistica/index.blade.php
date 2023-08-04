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
        <div class="col-md-3">
            <ul class="list-group">
                <li class="list-group-item">Simulaciones</li>
                <li class="list-group-item">Más aciertos</li>
                <li class="list-group-item">Menos aciertos</li>
            </ul>
        </div>
        <div class="col-md-9">
            <div class="card" style="margin-bottom: 10px;">
                <h5 class="card-title text-center">Grafica</h5>
                <div class="card-body">
                    <div>
                        <canvas id="fechaDias" height="100%"></canvas>
                    </div>
                </div>
            </div>

            <div class="card">
                <h5 class="card-title text-center">Resultados</h5>
                <div class="card-body">
                    <table class="table table-striped" id="dataTable">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Pregunta</th>
                                <th scope="col">Nota</th>
                                <th scope="col">Tiempo</th>
                                <th scope="col">Fecha</th>
                                @if ($user->id == 1) <th scope="col">Estudiante</th> @endif
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($simu as $dato)
                            <tr>
                                <td>{{ $dato->pregunta->id }}</td>
                                <td>{{ $dato->pregunta->pregunta }}</td>
                                <td>{{ $dato->nota }}</td>
                                <td>{{ $dato->tiempo }}</td>
                                <td>{{ date('d/m/Y', strtotime($dato->created_at)) }}</td>
                                @if ($user->id == 1) <td>{{$user->identification}} - {{$user->name}}</td> @endif
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('css')
@stop

@section('javascript')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

        const fechaDias = new Chart(
            document.getElementById('fechaDias'), {
                type: 'line',
                data: {
                    labels: [],
                    datasets: [{
                        label: 'Grafica de Intentos en Dias',
                        backgroundColor: 'rgb(255, 99, 132)',
                        borderColor: 'rgb(255, 99, 132)',
                        data: [],
                    }]
                },
                options: {}
            }
        );

        TableResult.on('draw.dt', function() {
            fecha = [];

            $('#dataTable tbody tr').each(function() {
                fecha.push($(this).find('td:eq(4)').text());
            });

            const datosAgrupados = fecha.reduce((resultado, fecha) => {
                if (!resultado[fecha]) {
                    resultado[fecha] = 1;
                } else {
                    resultado[fecha]++;
                }
                return resultado;
            }, {});

            fechaDias.data.labels = Object.keys(datosAgrupados);
            fechaDias.data.datasets[0].data = Object.values(datosAgrupados);
            fechaDias.update();
        });
    });
</script>
@stop