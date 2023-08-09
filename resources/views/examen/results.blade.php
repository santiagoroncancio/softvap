@extends('voyager::master')

@section('page_title', 'Resultados de Simulación')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-barbell"></i> Resultado de Simulación
    </h1>
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        Resultados
                    </h5>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Pregunta</th>
                                <th class="col">Respuesta Correcta</th>
                                <th scope="col">Respuesta Digitada</th>
                                <th scope="col">Tiempo</th>
                                <th scope="col">Nota</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">{{ $resultado->pregunta->pregunta }}</th>
                                <td>{{implode(', ', $resCo)}}</td>
                                <td>{{implode(', ', $resDig)}}</td>
                                <td>{{ $resultado->tiempo }}</td>
                                <td>{{ $resultado->nota }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('css')
<style>
    .card {
        margin: 1em;
    }

    .badge {
        padding: 8px;
        margin-left: 3px;
        margin-right: 3px;
    }
</style>
@stop

@section('javascript')
@stop