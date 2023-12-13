@extends('voyager::master')

@section('page_title', 'Nuevo Examen')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-book"></i>
        Nuevo Examen
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
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('examen.store') }}" id="formExamen" method="post">
                        @csrf
                        <fieldset>
                            <legend>Datos del Examen</legend>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group {{ $errors->has('nombre') ? 'has-error' : '' }}">
                                        <label for="nombre" class="is-required">Nombre del examen</label>
                                        <input type="text" name="nombre" id="nombre" value="{{ old('nombre') }}" required class="form-control">
                                        @if ($errors->has('nombre'))
                                        <span class="form-validation">{{ $errors->first('nombre') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group {{ $errors->has('descripcion') ? 'has-error' : '' }}">
                                        <label for="descripcion">Descripción</label>
                                        <textarea name="descripcion" class="form-control" id="descripcion" cols="10" rows="4">{{ old('descripcion') }}</textarea>
                                        @if ($errors->has('descripcion'))
                                        <span class="form-validation">{{ $errors->first('descripcion') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group {{ $errors->has('fecha_inicial') ? 'has-error' : '' }}">
                                        <label for="fecha_inicial" class="is-required">Fecha Inicial</label>
                                        <input type="datetime" name="fecha_inicial" id="fecha_inicial" value="{{ old('fecha_inicial') }}" required class="form-control datepicker">
                                        @if ($errors->has('fecha_inicial'))
                                        <span class="form-validation">{{ $errors->first('fecha_inicial') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group {{ $errors->has('fecha_final') ? 'has-error' : '' }}">
                                        <label for="fecha_final" class="is-required">Fecha Final</label>
                                        <input type="datetime" name="fecha_final" id="fecha_final" value="{{ old('fecha_final') }}" required class="form-control datepicker">
                                        @if ($errors->has('fecha_final'))
                                        <span class="form-validation">{{ $errors->first('fecha_final') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group {{ $errors->has('grupo') ? 'has-error' : '' }}">
                                        <label for="grupo" class="is-required">Grupo</label>
                                        <select name="grupo" id="grupo" required class="form-control select2">
                                            <option value="" selected disabled hidden>Seleccione una Opción</option>
                                            <option value="0">Todos</option>
                                            @foreach ($grupo as $grup)
                                            <option value="{{$grup->id}}" @if(old('grupo')==$grup->id) selected @endif>{{$grup->nombre}} - {{$grup->annio}}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('grupo'))
                                        <span class="form-validation">{{ $errors->first('grupo') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group {{ $errors->has('n_pregunta') ? 'has-error' : '' }}">
                                        <label for="n_pregunta" class="is-required">Numero Pregunta</label>
                                        <input type="number" min="0" name="n_pregunta" id="n_pregunta" value="{{ old('n_pregunta', 0) }}" required class="form-control">
                                        @if ($errors->has('n_pregunta'))
                                        <span class="form-validation">{{ $errors->first('n_pregunta') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group {{ $errors->has('estado') ? 'has-error' : '' }}">
                                        <label for="estado" class="is-required">Estado</label>
                                        <select name="estado" id="estado" required class="form-control select2">
                                            <option value="" selected disabled hidden>Seleccione una Opción</option>
                                            <option value="s">Activo</option>
                                            <option value="n">Inactivo</option>
                                        </select>
                                        @if ($errors->has('estado'))
                                        <span class="form-validation">{{ $errors->first('estado') }}</span>
                                        @endif
                                    </div>
                                </div>
                                @if ($role->contains(function ($valor, $clave) {
                                return in_array($valor['name'], ['admin']);
                                }))
                                <div class="col-md-4">
                                    <div class="form-group {{ $errors->has('profesor') ? 'has-error' : '' }}">
                                        <label for="profesor" class="is-required">Profesor</label>
                                        <select name="profesor" id="profesor" required class="form-control select2">
                                            <option value="" selected disabled hidden>Seleccione una Opción</option>
                                            @foreach ($profesor as $p)
                                            <option value="{{ $p->id }}">{{ $p->user->identification }} - {{ $p->user->name }} {{ $p->user->surname }}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('profesor'))
                                        <span class="form-validation">{{ $errors->first('profesor') }}</span>
                                        @endif
                                    </div>
                                </div>
                                @elseif ($role->contains(function ($valor, $clave) {
                                return in_array($valor['name'], ['teacher']);
                                }))
                                <input type="hidden" name="profesor" value="{{ $profesor->id }}">
                                @endif
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Banco de Preguntas</legend>
                            <div class="row">
                                <div class="col-md-12" style="margin-bottom: 0;">
                                    <div class="form-group {{ $errors->has('valor') ? 'has-error' : '' }}">
                                        <table id="preguntas" class="table table-striped">
                                            <caption class="is-required">Banco de Preguntas</caption>
                                            <thead>
                                                <th scope="col">Pregunta</th>
                                                <th scope="col">Escenario</th>
                                                <th scope="col">Categoria</th>
                                                <th scope="col">Dificultad</th>
                                                <th scope="col">Acción</th>
                                            </thead>
                                            <tbody>
                                                @foreach ($pregunta as $p)
                                                <tr>
                                                    <td>{{ $p->pregunta }}</td>
                                                    <td>{{ $p->escenario->nombre }}</td>
                                                    <td>{{ $p->categoria->nombre }}</td>
                                                    <td>{{ $p->nivel->nombre }}</td>
                                                    <td style="text-align: center;" id="btn-sel">
                                                        <input type="hidden" name="question[]" id="question{{ $p->id }}" disabled="disabled" value="{{ $p->id }}">
                                                        <button class="btn btn-sm btn-success voyager-list-add" id="btn{{ $p->id }}" data-id="{{ $p->id }}"></button>
                                                    </td>
                                                </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                        @if ($errors->has('valor'))
                                        <span class="form-validation">{{ $errors->first('valor') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </fieldset>
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

    if ($('#preguntas').length > 0) {
        let tableQuestion = $('#preguntas').DataTable({
            destroy: true,
            lengthChange: true,
            pageLength: 10,
            searching: true,
            ordering: true,
            info: true,
            responsive: false,
            paging: true,
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json',
            }
        });

        tableQuestion.on('click', '.btn-success', function(e) {
            e.stopPropagation();
            e.preventDefault();

            let id = $(this).data('id');
            $('#question' + id).attr('disabled', false);
            $('#btn' + id).removeClass('btn-success').addClass('btn-danger');
            $('#btn' + id).removeClass('voyager-list-add').addClass('voyager-trash');
        });

        tableQuestion.on('click', '.btn-danger', function(e) {
            e.stopPropagation();
            e.preventDefault();

            let id = $(this).data('id');
            $('#question' + id).attr('disabled', true);
            $('#btn' + id).removeClass('btn-danger').addClass('btn-success');
            $('#btn' + id).removeClass('voyager-trash').addClass('voyager-list-add');
        });
    }

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
                    $('#formExamen').submit();
                }
            });
    });
</script>
@stop