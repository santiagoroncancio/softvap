@extends('voyager::master')

@section('page_title', 'Resultados de Examen')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-barbell"></i> Resultado de Simulación Examen
    </h1>
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body podium">
                    <h5 class="card-title">
                        Resultados
                    </h5>
                    <table class="table table-striped" id="tableResultados">
                        <thead>
                            <tr>
                                <th scope="col">Puesto</th>
                                <th class="col">Estudiante</th>
                                <th scope="col">Nota</th>
                                <th scope="col">Tiempo</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($resultados as $result)
                            <tr>
                                <th scope="row">{{ $loop->index + 1 }}</th>
                                <td>{{ $result->estudiante->user->getName() }}</td>
                                <td>{{ $result->nota }}</td>
                                <td>{{ $result->tiempo }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        Respuestas
                    </h5>
                    <table class="table table-striped" id="tablaPreguntas">
                        <thead>
                            <tr>
                                @if ($role->contains(function ($valor, $clave) {
                                return in_array($valor['name'], ['admin', 'teacher']);
                                }))
                                <th scope="col">Estudiante</th>
                                @endif
                                <th scope="col">Pregunta</th>
                                <th scope="col">Respuesta Correcta</th>
                                <th scope="col">Respuesta Digitada</th>
                                <th scope="col">Tiempo</th>
                                <th scope="col">Nota</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($dataResultado as $data)
                            <tr>
                                @if ($role->contains(function ($valor, $clave) {
                                return in_array($valor['name'], ['admin', 'teacher']);
                                }))
                                <th>{{ $data["res"]->estudiante->user->getName() }}</th>
                                @endif
                                <th>{{ $data["res"]->pregunta->pregunta }}</th>
                                <td>{{implode(', ', $data["resCo"])}}</td>
                                <td>{{implode(', ', $data["resDig"])}}</td>
                                <td>{{ $data["res"]->tiempo }}</td>
                                <td>{{ $data["res"]->nota }}</td>
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
<style>
    .card {
        margin: 1em;
    }

    .podium {
        padding-top: 15% !important;
        background-image: url("{{ asset('img/podium.png') }}");
        background-position: top;
        background-repeat: no-repeat;
        background-size: 30%;
    }

    .badge {
        padding: 8px;
        margin-left: 3px;
        margin-right: 3px;
    }

    .image-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .image-container img {
        width: 20%;
        height: 100%;
    }
</style>
@stop

@section('javascript')
<script>
    $('#tableResultados').DataTable({
        destroy: true,
        pageLength: 10,
        lengthChange: false,
        paging: true,
        searching: true,
        ordering: true,
        info: true,
        responsive: true,
        language: {
            url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json',
        }
    });

    $('#tablaPreguntas').DataTable({
        destroy: true,
        pageLength: 10,
        lengthChange: false,
        paging: true,
        searching: true,
        ordering: true,
        info: true,
        responsive: true,
        language: {
            url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json',
        }
    });
</script>
@stop