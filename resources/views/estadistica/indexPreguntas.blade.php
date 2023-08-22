@extends('voyager::master')

@section('page_title', 'Estadística')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-pie-graph"></i> Estadística
    </h1>
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <h5 class="card-title text-center">Preguntas</h5>
                <div class="card-body">
                    <table class="table table-striped" id="dataTable">
                        <thead>
                            <tr>
                                <th scope="col">Pregunta</th>
                                <th scope="col">Escenario</th>
                                <th scope="col">Nivel</th>
                                <th scope="col">Ver</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($pregu as $p)
                            <tr>
                                <td>{{ $p->pregunta }}</td>
                                <td>{{ $p->escenario->nombre }}</td>
                                <td>{{ $p->nivel->nombre }}</td>
                                <td>
                                    <a href="{{ route('estadistica.preguntas', $p->id) }}" class="btn btn-primary btn-sm">
                                        <i class="voyager-bar-chart"></i>
                                    </a>
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
@stop

@section('javascript')
<script type="text/javascript">
    $(document).ready(function() {
        let TableResult = $('#dataTable').DataTable({
            destroy: true,
            pageLength: 10,
            lengthChange: true,
            paging: true,
            searching: true,
            ordering: true,
            info: true,
            responsive: true,
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json',
            }
        });
    });
</script>
@stop