@extends('voyager::master')

@section('page_title', 'Preguntas de Simulación')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-question"></i>
        Preguntas de Simulación
    </h1>
    <a href="{{ route('preguntas.create') }}" class="btn btn-success">
        <i class="voyager-plus"></i> <span>Nuevo</span>
    </a>
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
                                <th scope="col">Pregunta</th>
                                <th scope="col">Escenario</th>
                                <th scope="col">Nivel</th>
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $d)
                            <tr>
                                <td>{{ $d->pregunta }}</td>
                                <td>{{ $d->escenario->nombre }}</td>
                                <td>{{ $d->nivel->nombre }}</td>
                                <td>
                                    <div class="actions">
                                        <div>
                                            <a href="{{ route('preguntas.edit', $d->id) }}" class="btn btn-sm btn-primary pull-right edit">
                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                <span class="hidden-xs hidden-sm">Editar</span>
                                            </a>
                                        </div>
                                        <div>
                                            <form action="{{ route('preguntas.destroy', $d->id) }}" id="delete{{ $d->id }}" method="POST">
                                                @csrf
                                                {{ method_field('DELETE') }}
                                                <input type="submit" value="Eliminar" class="btn btn-sm btn-danger" onclick="verificar('{{$d->id}}')">
                                            </form>
                                        </div>
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

    function verificar(id) {
        event.preventDefault();
        event.stopPropagation();
        Swal.fire({
                title: '¿Deseas borrar el registro?',
                text: 'El registro de pregunta se borrara del sistema',
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