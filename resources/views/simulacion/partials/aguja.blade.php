@foreach ($pregunta->respuestas as $pr)
<div class="form-group">
    <input type="hidden" name="recurso[]" value="{{ $pr->recurso_id }}">
    <label for="{{ $pr->recurso->nombre }}">{{ $pr->recurso->nombre }}</label>

    @if ($pr->campo_id == 2)
    <input type="number" name="answer[]" min="0" class="form-control">
    @elseif ($pr->campo_id == 3)
    <select name="answer[]" class="form-control viaAplicacion"></select>
    @endif

</div>
@endforeach