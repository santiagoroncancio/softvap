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
        <div class="col-md-12">
            <canvas id="myChart" height="100%"></canvas>
        </div>
    </div>
</div>
@stop

@section('css')
<link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">
@stop

@section('javascript')
<script src="{{ voyager_asset('lib/js/dataTables.responsive.min.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script type="text/javascript">
    const data = {
        labels: ["Pregunta", "Intentos"],
        datasets: [{
            label: 'Grafica de Pregunta por Intentos',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [1, 2, 3, 4, 5, 6],
        }]
    };

    const config = {
        type: 'line',
        data: data,
        options: {}
    };

    const myChart = new Chart(
        document.getElementById('myChart'),
        config
    );
</script>
@stop