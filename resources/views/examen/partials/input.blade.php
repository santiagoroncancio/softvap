@for($i = 0; $i<$pregunta->respuestas->count(); $i++)
    <div class="form-group">
        <input type="text" name="answer[]" id="answer{{$i}}" style="width: 100%;">
    </div>
    @endfor