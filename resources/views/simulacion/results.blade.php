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
                                <td>{{ $resultado->pregunta->respuesta_medida }} {{ $resultado->pregunta->unidad->abreviatura }}</td>
                                <td>{{ $resultado->respuesta_medida }} {{ $resultado->unidad->abreviatura }}</td>
                                <td>{{ $resultado->tiempo }}</td>
                                <td>{{ $resultado->nota }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <img src="{{ asset(env('APP_URL') . '/storage/' . $resultado->pregunta->escenario->imagen) }}" class="img-fluid card-img-top" alt="Imagen de caso de simulación" id="imgSimulation">
        </div>
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">{{ $resultado->pregunta->escenario->nombre }}</h5>
                    <p class="card-text">{{ $resultado->pregunta->escenario->descripcion }}</p>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        Pregunta:
                        <span class="badge pull-right" style="background-color: {{ $resultado->pregunta->nivel->color }}" id="nivel">{{ $resultado->pregunta->nivel->nombre }}</span>
                        <span class="badge badge-secondary pull-right">{{ $resultado->pregunta->categoria->nombre }}</span>
                    </h5>
                    <p class="card-text">{{ $resultado->pregunta->pregunta }}</p>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('css')
<link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">
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
<script src="{{ voyager_asset('lib/js/dataTables.responsive.min.js') }}"></script>
@stop