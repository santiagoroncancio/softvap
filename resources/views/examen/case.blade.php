@include('voyager::alerts')
<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">{{ $data->nombre }}</h5>
                <p class="card-text">{{ $data->descripcion }}</p>
                <img src="{{ asset(env('APP_URL') . '/storage/' . $data->imagen) }}" class="img-fluid card-img-top" alt="Imagen de caso de simulación" id="imgSimulation">
            </div>
        </div>
    </div>
</div>
<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card">
            <div class="card-body">

                @if ($pregunta != null)

                <h5 class="card-title">
                    Pregunta:
                    <span class="badge pull-right" style="background-color: {{ $pregunta->nivel->color }}" id="nivel">{{ $pregunta->nivel->nombre }}</span>
                    <span class="badge badge-secondary pull-right">{{ $pregunta->categoria->nombre }}</span>
                </h5>
                <form action="{{ route('examen.savePlay') }}" method="post">
                    @csrf
                    <input type="hidden" name="campo" value="{{$pregunta->campo_id}}">
                    <input type="hidden" name="ti" value="{{ date('Y-m-d G:i:s') }}">
                    <input type="hidden" name="question" value="{{ $pregunta->id }}">

                    <p class="card-text">{{ $pregunta->pregunta }}</p>

                    @if ($pregunta->abierta == 's')
                    @include('simulacion.partials.input')
                    @else
                    @include('simulacion.partials.select')
                    @endif

                    <input type="submit" value="Evaluar" class="btn btn-primary pull-right" />
                </form>

                @else
                <h5 class="card-title text-center">
                    Caso Sin preguntas
                    <i class="fa fa-frown-o" aria-hidden="true"></i>
                </h5>
                @endif

            </div>
        </div>
    </div>
</div>