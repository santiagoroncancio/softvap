@extends('voyager::master')

@section('page_title', 'Vacunación')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-news"></i>
        Vacunación
    </h1>
    <a href="{{ route('vacunacion.create') }}" class="btn btn-success">
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
                                <th scope="col">Nombre</th>
                                <th scope="col">Calibre Aguja</th>
                                <th scope="col">Vía Aplicación</th>
                                <th scope="col">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $d)
                            <tr>
                                <td>{{ $d->nombre }}</td>
                                <td>{{ $d->tipo_aplicacion }}</td>
                                <td>{{ $d->via_aplicacion }}</td>
                                <td>
                                    <div class="actions">
                                        <a href="{{ route('preguntas.edit', $d->id) }}" class="btn btn-sm btn-primary pull-right edit">
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
<link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">
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
<script src="{{ voyager_asset('lib/js/dataTables.responsive.min.js') }}"></script>
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
</script>
@stop