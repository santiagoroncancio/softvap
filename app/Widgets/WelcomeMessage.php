<?php

namespace App\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use Arrilot\Widgets\AbstractWidget;

class WelcomeMessage extends AbstractWidget
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $user = Auth::user();

        if ($user) {
            $name = $user->name;
            $message = "¡Bienvenido de nuevo, $name!";
        } else {
            $message = "Bienvenido al panel de administración";
        }

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-rocket',
            'title'  => 'Bienvenida',
            'text'   => $message,
            'image' => '/img/portadaAzul2.jpeg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user() !== null; // Mostrar solo a usuarios autenticados
    }
}
