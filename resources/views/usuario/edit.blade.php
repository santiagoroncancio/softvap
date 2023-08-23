@extends('voyager::master')

@section('page_title', 'Editar Usuario')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-person"></i>
        Editar Usuario
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
                    <h5 class="card-title">Editar un Registro</h5>
                    <form action="{{ route('vacunacion.update', $data->id) }}" method="post" id="formVacunacion">
                        @csrf
                        {{ method_field('PUT') }}
                        <fieldset>
                            <legend>Datos de la vacuna</legend>
                            <div class="form-group {{ $errors->has('nombre') ? 'has-error' : '' }}">
                                <label for="nombre">Nombre</label>
                                <input type="text" name="nombre" id="nombre" value="{{ old('nombre', $data->nombre) }}" required class="form-control">
                                @if ($errors->has('nombre'))
                                <span class="form-validation">{{ $errors->first('nombre') }}</span>
                                @endif
                            </div>
                            <div class="form-group {{ $errors->has('calibre') ? 'has-error' : '' }}">
                                <label for="calibre">calibre de la aguja</label>
                                <input type="number" name="calibre" id="calibre" value="{{ old('calibre', $data->tipo_aplicacion) }}" class="form-control">
                                @if ($errors->has('calibre'))
                                <span class="form-validation">{{ $errors->first('calibre') }}</span>
                                @endif
                            </div>
                            <div class="form-group {{ $errors->has('via_aplicacion') ? 'has-error' : '' }}">
                                <label for="via_aplicacion">Nivel</label>
                                <select name="via_aplicacion" id="via_aplicacion" required class="form-control">
                                    <option value="{{ $data->via_aplicacion }}">{{ $data->nombre_via_aplicacion }}</option>
                                </select>
                                @if ($errors->has('via_aplicacion'))
                                <span class="form-validation">{{ $errors->first('via_aplicacion') }}</span>
                                @endif
                            </div>
                        </fieldset>
                        <input type="submit" id="btnSave" value="Guardar" class="btn btn-primary pull-right">
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
                    $('#formVacunacion').submit();
                }
            });
    });
</script>
@stop