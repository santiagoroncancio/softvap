@extends('voyager::master')

@section('page_title', 'Examen')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-barbell"></i> Examen {{ $examen->nombre }}
    </h1>
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @if ($examen->estado == 's')
    @foreach ($pregunta as $p)
    <p>{{$p->pregunta_id}}</p>

    @include('examen.case', ['data' => $p->pregunta->escenario, 'pregunta' => $p->pregunta])

    @endforeach
    @else
    <div style="text-align: center;">
        <h2>Examen no disponible <i class="voyager-frown"></i></h2>
        <p>Para mayor información comunicarse con el administrador</p>
    </div>
    @endif
</div>
@stop

@section('css')
<style>
    .badge {
        padding: 8px;
        margin-left: 3px;
        margin-right: 3px;
    }

    .text-red {
        color: red;
    }

    .justify-content-center {
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>
@stop

@section('javascript')
<script>

</script>
@stop