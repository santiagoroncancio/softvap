@extends('voyager::master')

@section('page_title', 'Editar Estudiante')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="icon voyager-study"></i>
        Editar Estudiante
    </h1>
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('estudiantes.update', $estu->id) }}" id="formEstudiante" method="post">
                        @csrf
                        {{ method_field('PUT') }}
                        <fieldset>
                            <legend>Datos Basicos</legend>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group {{ $errors->has('tidentification') ? 'has-error' : '' }}">
                                        <label for="tidentification" class="is-required">Tipo de documento</label>
                                        <select name="tidentification" id="tidentification" required class="form-control select2">
                                            <option value="" selected disabled hidden>Seleccione una Opción</option>
                                            @foreach ($tDocumento as $tdocu)
                                            <option value="{{$tdocu->id}}" @if(old('tidentification', $uUser->tipo_documento)==$tdocu->id) selected @endif>{{$tdocu->nombre}}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('tidentification'))
                                        <span class="form-validation">{{ $errors->first('tidentification') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group {{ $errors->has('identification') ? 'has-error' : '' }}">
                                        <label for="identification" class="is-required">Identificación</label>
                                        <input type="text" name="identification" id="identification" value="{{ old('identification', $uUser->identification) }}" required class="form-control">
                                        @if ($errors->has('identification'))
                                        <span class="form-validation">{{ $errors->first('identification') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                                        <label for="name" class="is-required">Nombre</label>
                                        <input type="text" name="name" id="name" value="{{ old('name', $uUser->name) }}" required class="form-control">
                                        @if ($errors->has('name'))
                                        <span class="form-validation">{{ $errors->first('name') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group {{ $errors->has('surname') ? 'has-error' : '' }}">
                                        <label for="surname" class="is-required">Apellido</label>
                                        <input type="text" name="surname" id="surname" value="{{ old('surname', $uUser->surname) }}" required class="form-control">
                                        @if ($errors->has('surname'))
                                        <span class="form-validation">{{ $errors->first('surname') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('email') ? 'has-error' : '' }}">
                                        <label for="email" class="is-required">Correo Eletronico</label>
                                        <input type="email" name="email" id="email" value="{{ old('email', $uUser->email) }}" required class="form-control">
                                        @if ($errors->has('email'))
                                        <span class="form-validation">{{ $errors->first('email') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('passw') ? 'has-error' : '' }}">
                                        <label for="passw" class="">Contraseña</label>
                                        <input type="password" name="passw" id="passw" value="{{ old('passw') }}" class="form-control">
                                        @if ($errors->has('passw'))
                                        <span class="form-validation">{{ $errors->first('passw') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>Datos del Estudiante</legend>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('codigoEstudiante') ? 'has-error' : '' }}">
                                        <label for="codigoEstudiante" class="is-required">Código de Estudiante</label>
                                        <input type="text" name="codigoEstudiante" id="codigoEstudiante" value="{{ old('codigoEstudiante', $estu->codigo_estudiante) }}" required class="form-control">
                                        @if ($errors->has('codigoEstudiante'))
                                        <span class="form-validation">{{ $errors->first('codigoEstudiante') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group {{ $errors->has('grupo') ? 'has-error' : '' }}">
                                        <label for="grupo" class="is-required">Grupo</label>
                                        <select name="grupo" id="grupo" required class="form-control select2">
                                            <option value="" selected disabled hidden>Seleccione una Opción</option>
                                            @foreach ($grupo as $grup)
                                            <option value="{{$grup->id}}" @if(old('grupo', $estu->grupo_id)==$grup->id) selected @endif>{{$grup->nombre}} - {{$grup->annio}}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('grupo'))
                                        <span class="form-validation">{{ $errors->first('grupo') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group {{ $errors->has('estado') ? 'has-error' : '' }}">
                                        <label for="estado" class="is-required">Estado</label>
                                        <select name="estado" id="estado" required class="form-control select2">
                                            <option value="" disabled hidden>Seleccione una Opción</option>
                                            <option value="a" @if($estu->estado == 'a') selected @endif >Activo</option>
                                            <option value="i" @if($estu->estado == 'i') selected @endif>Inactivo</option>
                                        </select>
                                        @if ($errors->has('estado'))
                                        <span class="form-validation">{{ $errors->first('estado') }}</span>
                                        @endif
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
</style>
@stop

@section('javascript')
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $(".select2").select2({
        placeholder: "Seleccione una Opción",
        allowClear: false
    });

    $('#btnSave').on('click', function() {
        event.preventDefault();
        event.stopPropagation();

        Swal.fire({
                title: '¿Deseas guardar el estudiante?',
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
                    $('#formEstudiante').submit();
                }
            });
    });
</script>
@stop