<div class="form-group">
    <select name="answer[]" id="answer" style="width: 100%;" @if($pregunta->respuestas->first()->campo_id == 1) class="vacunacion" multiple @endif></select>
</div>