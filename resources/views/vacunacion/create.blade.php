@extends('voyager::master')

@section('page_title', 'Vacunación')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-news"></i>
        Vacunación
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
                    <h5 class="card-title">Nuevo Registro</h5>
                    <form action="{{ route('vacunacion.store') }}" method="post">
                        @csrf
                        <fieldset>
                            <legend>Datos de la vacuna</legend>
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" name="nombre" id="nombre" required class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="calibre">calibre de la aguja</label>
                                <input type="number" name="calibre" id="calibre" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="via_aplicacion">Nivel</label>
                                <select name="via_aplicacion" id="via_aplicacion" required class="form-control"></select>
                            </div>
                        </fieldset>
                        <input type="submit" value="Guardar" class="btn btn-primary pull-right">
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
    legend {
        font-size: 10px;
        text-align: right;
    }

    fieldset {
        margin-top: 20px;
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

    if ($('#via_aplicacion').length > 0) {
        $('#via_aplicacion').select2({
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