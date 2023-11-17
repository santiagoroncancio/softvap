@extends('voyager::master')

@section('page_title', 'Simulación Examen')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-book"></i>
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
                                @if ($role->contains(function ($valor, $clave) {
                                return in_array($valor['name'], ['admin', 'teacher']);
                                }))
                                <th scope="col">Creación</th>
                                @endif
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($examen as $d)
                            <tr>
                                <td>{{ $d->nombre }}</td>
                                <td>{{ $d->tipoEstado->nombre }}</td>
                                <td>{{ $d->profesor != null ? $d->profesor->user->getName() : '' }}</td>
                                <td>{{ $d->duracion }}</td>
                                <td>{{ count($d->preguntas) }}</td>
                                @if ($role->contains(function ($valor, $clave) {
                                return in_array($valor['name'], ['admin', 'teacher']);
                                }))
                                <td>{{ $d->created_at }}</td>
                                @endif
                                <td>
                                    <div class="actions">
                                        @if ($role->contains(function ($valor, $clave) {
                                        return in_array($valor['name'], ['admin', 'teacher']);
                                        }))

                                        @if ($d->estado == 's' || $d->estado == 'n')

                                        @if ($d->estado == 's')
                                        <div>
                                            <form action="{{ route('examen.state', $d->id) }}" id="state{{ $d->id }}" method="POST">
                                                @csrf
                                                <input type="submit" value="Inactivar" class="btn btn-sm btn-warning" onclick="verificarEstado('{{$d->id}}')">
                                            </form>
                                        </div>
                                        @elseif ($d->estado == 'n')
                                        <div>
                                            <form action="{{ route('examen.state', $d->id) }}" id="state{{ $d->id }}" method="POST">
                                                @csrf
                                                <input type="submit" value="Activar" class="btn btn-sm btn-success" onclick="verificarEstado('{{$d->id}}')">
                                            </form>
                                        </div>
                                        @endif

                                        <div>
                                            <form action="{{ route('examen.destroy', $d->id) }}" id="delete{{ $d->id }}" method="POST">
                                                @csrf
                                                {{ method_field('DELETE') }}
                                                <input type="submit" value="Anular" class="btn btn-sm btn-danger" onclick="verificarAnulacion('{{$d->id}}')">
                                            </form>
                                        </div>
                                        <div>
                                            <form action="{{ route('examen.finish', $d->id) }}" id="finish{{ $d->id }}" method="POST">
                                                @csrf
                                                <input type="submit" value="Finalizar" class="btn btn-sm btn-primary" onclick="finalizar('{{$d->id}}')">
                                            </form>
                                        </div>
                                        @elseif ($d->estado == 'f')
                                        <div>
                                            <a href="{{ route('examen.results', $d->id) }}" class="btn btn-sm btn-primary pull-right edit">
                                                <i class="fa fa-signal" aria-hidden="true"></i>
                                                <span class="hidden-xs hidden-sm">Resultados</span>
                                            </a>
                                        </div>
                                        @endif
                                        @endif

                                        @if ($role->contains(function ($valor, $clave) {
                                        return in_array($valor['name'], ['student']);
                                        }))

                                        @if ($d->estado == 's')
                                        <div>
                                            <a href="{{ route('examen.play', $d->id) }}" class="btn btn-sm btn-primary pull-right edit">
                                                <i class="voyager-play" aria-hidden="true"></i>
                                                <span class="hidden-xs hidden-sm">Empezar</span>
                                            </a>
                                        </div>
                                        @elseif ($d->estado == 'f')
                                        <div>
                                            <a href="{{ route('examen.results', $d->id) }}" class="btn btn-sm btn-primary pull-right edit">
                                                <i class="fa fa-signal" aria-hidden="true"></i>
                                                <span class="hidden-xs hidden-sm">Resultados</span>
                                            </a>
                                        </div>
                                        @endif

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

    function verificarEstado(id) {
        event.preventDefault();
        event.stopPropagation();
        Swal.fire({
                title: '¿Deseas Cambiar el estado?',
                text: 'El registro del examen cambiara su estado',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3c8dbc',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Confirmar',
                cancelButtonText: 'Cancelar'
            })
            .then((result) => {
                if (result.isConfirmed) {
                    $('#state' + id).submit();
                }
            });
    }

    function verificarAnulacion(id) {
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