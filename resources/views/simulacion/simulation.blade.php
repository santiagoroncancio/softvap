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
    @include('simulacion.case')
</div>
@stop

@section('css')
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
        align-items: center;
    }
</style>
@stop

@section('javascript')
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

    if ($('.vacunacion').length > 0) {
        $('.vacunacion').select2({
            ajax: {
                url: url + '/api/select/recursos',
                dataType: 'json',
                type: 'get',
                delay: 250,
                data: function(params) {
                    return {
                        term: params.term, // search term
                        page: params.page,
                        categoria: 2 || params.categoria
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
            placeholder: 'Seleccione Una o Varias Opciones',
        });
    }
</script>
@stop