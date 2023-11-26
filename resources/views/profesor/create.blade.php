@extends('voyager::master')

@section('page_title', 'Nuevo Profesor')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="icon voyager-study"></i>
        Nuevo Profesor
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
                    <form action="{{ route('profesores.store') }}" id="formProfesor" method="post">
                        @csrf
                        <fieldset>
                            <legend>Datos Basicos</legend>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group {{ $errors->has('tidentification') ? 'has-error' : '' }}">
                                        <label for="tidentification" class="is-required">Tipo de documento</label>
                                        <select name="tidentification" id="tidentification" required class="form-control select2">
                                            <option value="" selected disabled hidden>Seleccione una Opción</option>
                                            @foreach ($tDocumento as $tdocu)
                                            <option value="{{$tdocu->id}}" @if(old('tidentification')==$tdocu->id) selected @endif>{{$tdocu->nombre}}</option>
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
                                        <input type="text" name="identification" id="identification" value="{{ old('identification') }}" required class="form-control">
                                        @if ($errors->has('identification'))
                                        <span class="form-validation">{{ $errors->first('identification') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                                        <label for="name" class="is-required">Nombre</label>
                                        <input type="text" name="name" id="name" value="{{ old('name') }}" required class="form-control">
                                        @if ($errors->has('name'))
                                        <span class="form-validation">{{ $errors->first('name') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group {{ $errors->has('surname') ? 'has-error' : '' }}">
                                        <label for="surname" class="is-required">Apellido</label>
                                        <input type="text" name="surname" id="surname" value="{{ old('surname') }}" required class="form-control">
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
                                        <input type="email" name="email" id="email" value="{{ old('email') }}" required class="form-control">
                                        @if ($errors->has('email'))
                                        <span class="form-validation">{{ $errors->first('email') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group {{ $errors->has('passw') ? 'has-error' : '' }}">
                                        <label for="passw" class="is-required">Contraseña</label>
                                        <input type="password" name="passw" id="passw" value="{{ old('passw') }}" required class="form-control">
                                        @if ($errors->has('passw'))
                                        <span class="form-validation">{{ $errors->first('passw') }}</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset>
                            <legend>Datos del Profesor</legend>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group {{ $errors->has('estado') ? 'has-error' : '' }}">
                                        <label for="estado" class="is-required">Estado</label>
                                        <select name="estado" id="estado" required class="form-control select2">
                                            <option value="" selected disabled hidden>Seleccione una Opción</option>
                                            <option value="a">Activo</option>
                                            <option value="i">Inactivo</option>
                                        </select>
                                        @if ($errors->has('estado'))
                                        <span class="form-validation">{{ $errors->first('estado') }}</span>
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
                title: '¿Deseas guardar el profesor?',
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
                    $('#formProfesor').submit();
                }
            });
    });
</script>
@stop