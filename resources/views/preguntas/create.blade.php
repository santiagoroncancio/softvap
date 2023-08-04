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
    <ul>
        @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
        @endforeach
    </ul>

    @include('voyager::alerts')
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('preguntas.store') }}" id="formPreguntas" method="post">
                        @csrf
                        <fieldset>
                            <legend>Datos de la pregunta</legend>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('escenario') ? 'has-error' : '' }}">
                                        <label for="escenario" class="is-required">Escenario de simulación</label>
                                        <select name="escenario" id="escenario" required class="form-control select2">
                                            <option value="" selected disabled hidden>Seleccione una Opción</option>
                                            @foreach ($escenario as $esce)
                                            <option value="{{$esce->id}}" @if(old('escenario')==$esce->id) selected @endif>{{$esce->nombre}}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('escenario'))
                                        <span class="form-validation">{{ $errors->first('escenario') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('nivel') ? 'has-error' : '' }}">
                                        <label for="nivel" class="is-required">Nivel</label>
                                        <select name="nivel" id="nivel" required class="form-control select2">
                                            <option value="" selected disabled hidden>Seleccione una Opción</option>
                                            @foreach ($nivel as $nive)
                                            <option value="{{$nive->id}}" @if(old('nivel')==$nive->id) selected @endif>{{$nive->nombre}}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('nivel'))
                                        <span class="form-validation">{{ $errors->first('nivel') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group {{ $errors->has('pregunta') ? 'has-error' : '' }}">
                                        <label for="pregunta" class="is-required">Pregunta</label>
                                        <input type="text" name="pregunta" id="pregunta" value="{{ old('pregunta') }}" required class="form-control">
                                        @if ($errors->has('pregunta'))
                                        <span class="form-validation">{{ $errors->first('pregunta') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Datos de la respuesta</legend>
                            <div class="float-right">
                                <input type="checkbox" name="pabierta" id="pabierta" value="s" @if (old('pabierta')=='s' ) checked @endif>
                                <label for="pabierta"> Pregunta abierta</label>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group tc {{ $errors->has('valor') ? 'has-error' : '' }}">
                                        <label for="valorc" class="is-required">Respuesta</label>
                                        <select name="valor[]" id="valorc" class="form-control select2" multiple>
                                            @foreach ($categoria->recurso as $val)
                                            <option value="{{$val->id}}" @if(old('valor')==$val->id) selected @endif>{{$val->nombre}}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('valor'))
                                        <span class="form-validation">{{ $errors->first('valor') }}</span>
                                        @endif
                                    </div>
                                    <div class="form-group tc {{ $errors->has('campo') ? 'has-error' : '' }}">
                                        <label for="campo" class="is-required">Campo</label>
                                        <select name="campo" id="campo" class="form-control select2">
                                            <option value="" selected disabled hidden>Seleccione una Opción</option>
                                            @foreach ($categoria->campo as $cap)
                                            <option value="{{$cap->id}}" @if(old('campo')==$cap->id) selected @endif>{{$cap->nombre}}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('campo'))
                                        <span class="form-validation">{{ $errors->first('campo') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-bottom: 0;">
                                <div class="col-md-12" style="margin-bottom: 0;">
                                    <div class="form-group ta {{ $errors->has('valor') ? 'has-error' : '' }}">
                                        <input type="button" value="Agregar" id="newAnswer" class="btn btn-success float-right">
                                        <table id="respuestas" class="table table-striped">
                                            <caption class="is-required">Respuestas</caption>
                                            <thead>
                                                <th scope="col">Respuesta</th>
                                                <th scope="col">Acción</th>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                        @if ($errors->has('valor'))
                                        <span class="form-validation">{{ $errors->first('valor') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <input type="hidden" name="categoria" id="categoria" value="{{ $categoria->id }}">
                        <input type="submit" value="Guardar" id="btnSave" class="btn btn-primary pull-right">
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

    #respuestas tr td:first-child {
        width: 90%;
    }

    #respuestas tr td:last-child {
        width: 10%;
    }
</style>
@stop

@section('javascript')
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $(".select2").select2({
        placeholder: "Seleccione una Opción",
        allowClear: false
    });

    function abierta() {
        if ($('#pabierta').is(':checked')) {
            $('.tc').hide();
            $('.ta').show();

            $('#recurso').prop("disabled", true);
            $('#campo').prop("disabled", true);
            $('#valor').prop("disabled", false);
        } else {
            $('.tc').show();
            $('.ta').hide();

            $('#recurso').prop("disabled", false);
            $('#campo').prop("disabled", false);
            $('#valor').prop("disabled", true);
        }
    }

    if ($('#respuestas').length > 0) {
        let tableAnswer = $('#respuestas').DataTable({
            destroy: true,
            lengthChange: false,
            false: true,
            searching: false,
            ordering: false,
            info: false,
            responsive: false,
            paging: false,
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json',
            }
        });

        $('#newAnswer').on('click', function(e) {
            e.stopPropagation();
            e.preventDefault();

            tableAnswer.row.add([
                '<input type="text" id="valor" name="valor[]" class="form-control" style="width: 100%;">',
                '<button class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></button>'
            ]).draw();
        });

        tableAnswer.on('click', '.btn-danger', function(e) {
            e.stopPropagation();
            e.preventDefault();

            let $tr = $(this).closest('tr');
            tableAnswer.row($tr).remove().draw(false);
        });

        $('#pabierta').on('click', function() {
            $('#recurso').empty();
            $('#campo').empty();
            tableAnswer.clear().draw();

            abierta();
        });
    }

    abierta();

    $('#btnSave').on('click', function() {
        event.preventDefault();
        event.stopPropagation();

        Swal.fire({
                title: '¿Deseas guardar el registro?',
                text: 'Asegúrese de que toda la información este correcta.',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3c8dbc',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Confirmar',
                cancelButtonText: 'Cancelar'
            })
            .then((result) => {
                if (result.isConfirmed) {
                    $('#formPreguntas').submit();
                }
            });
    });
</script>
@stop