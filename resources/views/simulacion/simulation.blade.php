@extends('voyager::master')

@section('page_title', 'Laboratorio de Simulación')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-barbell"></i> Simulación
    </h1>
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">{{ $data->nombre }}</h5>
                    <p class="card-text">{{ $data->descripcion }}</p>
                    <img src="{{ asset(env('APP_URL') . '/storage/' . $data->imagen) }}" class="img-fluid card-img-top" alt="Imagen de caso de simulación" id="imgSimulation">
                </div>
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    @if ($data->preguntas != null)

                    @php
                    $pregunta = $data->preguntas->random();
                    @endphp

                    <h5 class="card-title">
                        Pregunta:
                        <span class="badge pull-right" style="background-color: {{ $pregunta->nivel->color }}" id="nivel">{{ $pregunta->nivel->nombre }}</span>
                        <span class="badge badge-secondary pull-right">{{ $pregunta->categoria->nombre }}</span>
                    </h5>
                    <p class="card-text">{{ $pregunta->pregunta }}</p>
                    <form action="{{ route('lab-simulacion.store') }}" method="post">
                        @csrf
                        <input type="hidden" name="ti" value="{{ date('Y-m-d G:i:s') }}">
                        <input type="hidden" name="question" value="{{ $pregunta->id }}">

                        @foreach ($pregunta->respuestas as $pr)
                        <div class="form-group">
                            <input type="hidden" name="recurso[]" value="{{ $pr->recurso_id }}">
                            <label for="{{ $pr->recurso->nombre }}">{{ $pr->recurso->nombre }}</label>

                            @if ($pr->campo_id == 2)
                            <input type="number" name="answer[]" min="0" class="form-control">
                            @elseif ($pr->campo_id == 3)
                            <select name="answer[]" class="form-control viaAplicacion"></select>
                            @endif

                        </div>
                        @endforeach

                        <input type="submit" value="Evaluar" class="btn btn-primary pull-right" />
                    </form>
                    @else
                    <h5 class="card-title text-center">
                        Caso Sin preguntas
                        <i class="fa fa-frown-o" aria-hidden="true"></i>
                    </h5>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('css')
<link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">
<style>
    .badge {
        padding: 8px;
        margin-left: 3px;
        margin-right: 3px;
    }

    .text-red {
        color: red;
    }

    .justify-content-center {
        display: flex;
        justify-content: center;
    }
</style>
@stop

@section('javascript')
<script src="{{ voyager_asset('lib/js/dataTables.responsive.min.js') }}"></script>
<script>
    let url = "{{env('APP_URL')}}";

    if ($('.viaAplicacion').length > 0) {
        $('.viaAplicacion').select2({
            ajax: {
                url: url + '/api/select/tipoAplicacion',
                dataType: 'json',
                type: 'get',
                delay: 250,
                data: function(params) {
                    return {
                        term: params.term, // search term
                        page: params.page
                    };
                },
                processResults: function(data, params) {
                    params.page = params.page || 1;
                    return {
                        results: data.results.data,
                        pagination: {
                            more: (params.page * 30) < data.total_count
                        }
                    };
                },
                cache: true
            },
            placeholder: 'Seleccione una Opción',
        });
    }
</script>
@stop