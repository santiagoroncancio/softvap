@extends('voyager::master')

@section('page_title', 'Nuevo Estudiantes')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="icon voyager-study"></i>
        Nuevos Estudiante
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
                    <form action="{{ route('estudiantes.masivo') }}" id="formEstudiante" method="post">
                        @csrf
                        <fieldset>
                            <legend>Lista de datos</legend>
                            <button type="button" id="btnAddList" class="btn btn-success float-right">Agregar <i class="icon voyager-list-add"></i></button>
                            <table class="table table-striped" id="dataTable">
                                <thead>
                                    <tr>
                                        <th scope="col">Tipo Documento</th>
                                        <th scope="col">Documento</th>
                                        <th scope="col">Codigo</th>
                                        <th scope="col">Nombre</th>
                                        <th scope="col">Apellido</th>
                                        <th scope="col">Correo</th>
                                        <th scope="col">Grupo</th>
                                        <th scope="col">Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <select name="tidentification[]" required class="form-control tdocumento" style="width: 100%;"></select>
                                        </td>
                                        <td>
                                            <input type="text" name="identification[]" required class="form-control" style="width: 100%;">
                                        </td>
                                        <td>
                                            <input type="text" name="codigo[]" required class="form-control" style="width: 100%;">
                                        </td>
                                        <td>
                                            <input type="text" name="name[]" required class="form-control" style="width: 100%;">
                                        </td>
                                        <td>
                                            <input type="text" name="surname[]" required class="form-control" style="width: 100%;">
                                        </td>
                                        <td>
                                            <input type="email" name="email[]" required class="form-control" style="width: 100%;">
                                        </td>
                                        <td>
                                            <select name="grupo[]" required class="form-control grupo" style="width: 100%;"></select>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-danger">Eliminar</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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
    let url = "{{env('APP_URL')}}";

    let listEstudiantes = $('#dataTable').DataTable({
        destroy: true,
        pageLength: 10,
        lengthChange: false,
        paging: true,
        searching: true,
        ordering: true,
        info: true,
        responsive: true,
        language: {
            url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json',
        }
    });

    $(".select2").select2({
        placeholder: "Seleccione una Opción",
        allowClear: false
    });

    if ($('.tdocumento').length > 0) {
        $('.tdocumento').select2({
            ajax: {
                url: url + '/api/select/tipo-documento',
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

    if ($('.grupo').length > 0) {
        $('.grupo').select2({
            ajax: {
                url: url + '/api/select/grupo',
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

    $("#btnAddList").on('click', function(event) {
        event.preventDefault();
        event.stopPropagation();

        listEstudiantes.row.add([
            '<select name="tidentification[]" required class="form-control tdocumento" style="width: 100%;">',
            '<input type="text" name="identification[]" required class="form-control" style="width: 100%;">',
            '<input type="text" name="codigo[]" required class="form-control" style="width: 100%;">',
            '<input type="text" name="name[]" required class="form-control" style="width: 100%;">',
            '<input type="text" name="surname[]" required class="form-control" style="width: 100%;">',
            '<input type="email" name="email[]" required class="form-control" style="width: 100%;">',
            '<select name="grupo[]" required class="form-control grupo" style="width: 100%;"></select>',
            '<button type="button" class="btn btn-danger eliminar">Eliminar</button>'
        ]).draw();

        $('.grupo').select2({
            ajax: {
                url: url + '/api/select/grupo',
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

        $('.tdocumento').select2({
            ajax: {
                url: url + '/api/select/tipo-documento',
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
    });

    // Evento al hacer clic en el botón de eliminar dentro de la tabla
    $('#dataTable').on('click', '.eliminar', function() {
        var fila = $(this).closest('tr');
        listEstudiantes.row(fila).remove().draw(false);
    });

    $('#btnSave').on('click', function() {
        event.preventDefault();
        event.stopPropagation();

        Swal.fire({
                title: '¿Deseas guardar el listado de estudiante?',
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