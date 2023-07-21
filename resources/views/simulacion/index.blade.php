@extends('voyager::master')

@section('page_title', 'Laboratorio de Simulación')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-barbell"></i>
        Laboratorio de Simulación
    </h1>
    <a href="{{ route('lab-simulacion.random') }}" class="btn btn-primary">
        <i class="voyager-wand"></i> <span>Al Azar</span>
    </a>
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    <div class="row">
        @foreach($paginate as $data)
        <div class="col-md-4">
            <div class="card" id="dataTable">
                <img src="{{ asset(env('APP_URL') . '/storage/' . $data->imagen) }}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">{{ $data->nombre }}</h5>
                    <p class="card-text">{{ Str::limit($data->descripcion, 200) }}</p>
                    <div id="btn-action">
                        <a href="{{ route('lab-simulacion.show', $data->id) }}" class="btn btn-primary pull-right">Jugar</a>
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    </div>
    <div class="d-flex justify-content-center">
        {{ $paginate->links() }}
    </div>
</div>
@stop

@section('css')
<style type="text/css">
    img.card-img-top {
        height: 200px;
        object-fit: contain;
    }
</style>
@stop

@section('javascript')
<script src="js/simulacion.js"></script>
@stop