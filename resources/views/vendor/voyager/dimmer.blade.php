<div class="panel widget center bgimage" style="margin-bottom:0;overflow:hidden;background-image:url('{{ $image }}');">
    <div class="dimmer" style="background-color: rgba(0, 0, 0, 0.6);"></div>
    <div class="panel-content">
        @if (isset($icon))<i class='{{ $icon }}'></i>@endif
        <h4 style="font-size: 25px;">{!! $title !!}</h4>
        <p style="font-size: 15px;">{!! $text !!}</p>
        @if (isset($button))<a href="{{ $button['link'] }}" class="btn btn-primary">{!! $button['text'] !!}</a>@endif
    </div>
</div>