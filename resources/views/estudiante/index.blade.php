@extends('voyager::master')

@section('page_title', 'Estudiantes')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="icon voyager-study"></i>
        Listado de estudiantes
    </h1>
    @if ($role->contains(function ($valor, $clave) {
    return in_array($valor['name'], ['admin', 'teacher']);
    }))
    <a href="{{ route('estudiantes.create') }}" class="btn btn-success">
        <i class="voyager-plus"></i> <span>Nuevo</span>
    </a>
    @endif
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <table class="table table-striped" id="dataTable">
                        <thead>
                            <tr>
                                <th scope="col">Documento</th>
                                <th scope="col">Codigo</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Grupo</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($estudiante as $estu)
                            <tr>
                                <td>{{ $estu->user->identification }}</td>
                                <td>{{ $estu->codigo_estudiante }}</td>
                                <td>{{ $estu->user->name }}</td>
                                <td>{{ $estu->user->surname }}</td>
                                <td>{{ $estu->user->email }}</td>
                                <td>{{ $estu->grupo->nombre }}</td>
                                <td>{{ $estu->estado == 'i' ? 'Inactivo' : 'Activo'}}</td>
                                <td>
                                    <div class="actions">
                                        <a href="{{ route('estudiantes.edit', $estu->id) }}" class="btn btn-sm btn-primary pull-right edit">
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                            <span class="hidden-xs hidden-sm">Editar</span>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@stop

@section('css')
<style>
    #dataTable .actions a.btn {
        font-size: 12px;
        padding: 5px 10px;
    }

    #dataTable a {
        font-weight: 500;
        text-decoration: none;
    }
</style>
@stop

@section('javascript')
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    let QuestionTable = $('#dataTable').DataTable({
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

    function verificarSuspender(id) {
        event.preventDefault();
        event.stopPropagation();
        Swal.fire({
                title: '¿Deseas supender al estudiante',
                text: 'El perfil del estudiante no tendrá acceso.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3c8dbc',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Confirmar',
                cancelButtonText: 'Cancelar'
            })
            .then((result) => {
                if (result.isConfirmed) {
                    $('#delete' + id).submit();
                }
            });
    }
</script>
@stop