@if ($pregunta->campo_id == 1)

<div class="form-group">
    <select name="answer[]" id="answer" style="width: 100%;" class="vacunacion" multiple></select>
</div>

@elseif($pregunta->campo_id == 2)

@foreach($pregunta->respuestas->shuffle() as $key => $res)
<div class="form-group row justify-content-center">
    <label for="answer{{$key}}" class="col-sm-2 col-form-label">{{$res->recurso->nombre}}</label>
    <input type="hidden" name="recurso[]" value="{{$res->valor}}">
    <div class="col-sm-10">
        <input type="number" class="form-control" id="answer{{$key}}" required min="0" name="answer[]">
    </div>
</div>
@endforeach

@elseif($pregunta->campo_id == 3)

@foreach($pregunta->respuestas->shuffle() as $key => $res)
<div class="form-group row justify-content-center">
    <label for="answer{{$key}}" class="col-sm-2 col-form-label">{{$res->recurso->nombre}}</label>
    <input type="hidden" name="recurso[]" value="{{$res->valor}}">
    <div class="col-sm-10">
        <select class="form-control viaAplicacion" id="answer{{$key}}" required name="answer[]"></select>
    </div>
</div>
@endforeach

@endif