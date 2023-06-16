@foreach ($pregunta->respuestas as $pr)
<div class="form-group">

    @if ($pr->campo_id == 1)

    <input type="hidden" name="recurso[]" value="{{ $pr->recurso_id }}">
    <label for="{{ $pr->recurso->nombre }}">{{ $pr->recurso->nombre }}</label>
    <select name="answer" id="answer">

    </select>

    @endif

</div>
@endforeach


<select name="answer" id="">

</select>