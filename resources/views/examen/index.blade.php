@extends('voyager::master')

@section('page_title', 'Simulación Examen')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-news"></i>
        Simulación Examen
    </h1>
    @if ($role->contains(function ($valor, $clave) {
    return in_array($valor['name'], ['admin', 'teacher']);
    }))
    <a href="{{ route('examen.create') }}" class="btn btn-success">
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
                                <th scope="col">Nombre</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Profesor</th>
                                <th scope="col">Duración (Minutos)</th>
                                <th scope="col">N Preguntas</th>
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($examen as $d)
                            <tr>
                                <td>{{ $d->nombre }}</td>
                                <td>{{ $d->tipoEstado->nombre }}</td>
                                <td>{{ $d->profesor->user->identification }} - {{ $d->profesor->user->name }} {{ $d->profesor->user->surname }}</td>
                                <td>{{ $d->duracion }}</td>
                                <td>{{ count($d->preguntas) }}</td>
                                <td>
                                    <div class="actions">
                                        @if ($role->contains(function ($valor, $clave) {
                                        return in_array($valor['name'], ['admin', 'teacher']);
                                        }))

                                        @if ($d->estado == 's' || $d->estado == 'n')
                                        <div>
                                            <a href="{{ route('examen.edit', $d->id) }}" class="btn btn-sm btn-primary pull-right edit">
                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                <span class="hidden-xs hidden-sm">Editar</span>
                                            </a>
                                        </div>
                                        <div>
                                            <form action="{{ route('examen.destroy', $d->id) }}" id="delete{{ $d->id }}" method="POST">
                                                @csrf
                                                {{ method_field('DELETE') }}
                                                <input type="submit" value="Anular" class="btn btn-sm btn-danger" onclick="verificar('{{$d->id}}')">
                                            </form>
                                        </div>
                                        <div>
                                            <form action="" id="finish{{ $d->id }}" method="POST">
                                                @csrf
                                                <input type="submit" value="Finalizar" class="btn btn-sm btn-success" onclick="finalizar('{{$d->id}}')">
                                            </form>
                                        </div>
                                        @elseif ($d->estado == 'f')
                                        <div>
                                            <a href="{{ examen.results }}" class="btn btn-sm btn-primary pull-right edit">
                                                <i class="fa fa-signal" aria-hidden="true"></i>
                                                <span class="hidden-xs hidden-sm">Resultados</span>
                                            </a>
                                        </div>
                                        @endif
                                        @endif

                                        @if ($role->contains(function ($valor, $clave) {
                                        return in_array($valor['name'], ['student']);
                                        }) && $d->estado == 's')
                                        <div>
                                            <a href="{{ route('examen.play', $d->id) }}" class="btn btn-sm btn-primary pull-right edit">
                                                <i class="voyager-play" aria-hidden="true"></i>
                                                <span class="hidden-xs hidden-sm">Empezar</span>
                                            </a>
                                        </div>
                                        @endif
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
                title: '¿Deseas Anular el registro?',
                text: 'El registro de examen se Anula del sistema',
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

    function finalizar(id) {
        event.preventDefault();
        event.stopPropagation();
        Swal.fire({
                title: '¿Deseas Finalizar el Examen?',
                text: 'El examen Finalizara en el sistema',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3c8dbc',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Confirmar',
                cancelButtonText: 'Cancelar'
            })
            .then((result) => {
                if (result.isConfirmed) {
                    $('#finish' + id).submit();
                }
            });
    }
</script>
@stop