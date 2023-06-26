@extends('voyager::master')

@section('page_title', 'Nueva Pregunta')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-news"></i>
        Nueva Pregunta de Vacunación
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
                    <form action="{{ route('preguntas.store') }}" method="post">
                        @csrf
                        <fieldset>
                            <legend>Datos de la pregunta</legend>
                            <div class="form-group">
                                <label for="escenario">Escenario de simulación</label>
                                <select name="escenario" id="escenario" required class="form-control"></select>
                            </div>
                            <div class="form-group">
                                <label for="nivel">Nivel</label>
                                <select name="nivel" id="nivel" required class="form-control"></select>
                            </div>
                            <div class="form-group">
                                <label for="pregunta">Pregunta</label>
                                <input type="text" name="pregunta" id="pregunta" required class="form-control">
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Datos de la respuesta</legend>
                            <div class="form-group">
                                <div class="float-right">
                                    <input type="checkbox" name="pabierta" id="pabierta" value="s">
                                    <label for="pabierta"> Pregunta abierta</label>
                                </div>
                            </div>
                            <div class="form-group tc">
                                <label for="recurso">Respuesta</label>
                                <select name="valor[]" id="recurso" class="form-control" multiple></select>
                            </div>
                            <div class="form-group tc">
                                <label for="campo">Campo</label>
                                <select name="campo" id="campo" class="form-control"></select>
                            </div>
                            <div class="form-group ta">
                                <label for="valor">Respuesta</label>
                                <input type="text" id="valor" name="valor[]" class="form-control">
                            </div>
                        </fieldset>
                        <input type="hidden" name="categoria" id="categoria" value="{{ $categoria->id }}">
                        <input type="submit" value="Guardar" class="btn btn-primary pull-right">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('css')
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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    let url = "{{env('APP_URL')}}";
    let categoria = $('#categoria').val();

    if ($('#escenario').length > 0) {
        $('#escenario').select2({
            ajax: {
                url: url + '/api/select/escenarios',
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

    if ($('#nivel').length > 0) {
        $('#nivel').select2({
            ajax: {
                url: url + '/api/select/niveles',
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

    if ($('#recurso').length > 0) {
        $('#recurso').select2({
            ajax: {
                url: url + '/api/select/recursos',
                dataType: 'json',
                type: 'get',
                delay: 250,
                data: function(params) {
                    return {
                        term: params.term, // search term
                        page: params.page,
                        categoria: categoria
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

    if ($('#campo').length > 0) {
        $('#campo').select2({
            ajax: {
                url: url + '/api/select/campos',
                dataType: 'json',
                type: 'get',
                delay: 250,
                data: function(params) {
                    return {
                        term: params.term, // search term
                        page: params.page,
                        categoria: categoria
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

    function abierta() {
        $('#recurso').empty();
        $('#campo').empty();
        $('#valor').val('');

        if ($(this).is(':checked')) {
            $('.tc').hide();
            $('.ta').show();
        } else {
            $('.tc').show();
            $('.ta').hide();
        }
    }

    $('#pabierta').on('click', abierta);
    abierta();
</script>
@stop