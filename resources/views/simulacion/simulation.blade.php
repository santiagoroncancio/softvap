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
    <div class="row">
        <div class="col-md-8">
            <img src="{{ asset(env('APP_URL') . '/storage/' . $data->imagen) }}" class="img-fluid card-img-top" alt="Imagen de caso de simulación" id="imgSimulation">
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">{{ $data->nombre }}</h5>
                    <p class="card-text">{{ $data->descripcion }}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
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

                        <div class="row">
                            <div class="col-sm-8">
                                <input type="text" name="answer" id="answer" value="{{ old('annio_produccion') }}" class="form-control">
                                @if ($errors->has('answer'))
                                <span class="form-validation text-red">{{ $errors->first('answer') }}</span>
                                @endif
                            </div>
                            <div class="col-sm-4">
                                <select name="answeru" id="answeru" style="width: 100%;"></select>
                                @if ($errors->has('answeru'))
                                <span class="form-validation text-red">{{ $errors->first('answeru') }}</span>
                                @endif
                            </div>
                        </div>

                        <input type="submit" value="Evaluar" class="btn btn-primary pull-right" />
                    </form>
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

    .text-red {
        color: red;
    }
</style>
@stop

@section('javascript')
<script src="{{ voyager_asset('lib/js/dataTables.responsive.min.js') }}"></script>
<script>
    let url = "{{env('APP_URL')}}";

    if ($('#answeru').length > 0) {
        $('#answeru').select2({
            ajax: {
                url: url + '/api/select/unidad-medida',
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