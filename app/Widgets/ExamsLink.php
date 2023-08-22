<?php

namespace App\Widgets;

use App\Models\User;
use TCG\Voyager\Facades\Voyager;
use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Facades\Auth;

class ExamsLink extends AbstractWidget
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
        $user = auth()->user();
        $role = User::find($user->id)->roles;


        if ($role->contains(function ($valor, $clave) {
            return in_array($valor['name'], ['admin', 'teacher']);
        })) {
            $message = 'Adéntrate en el mundo de la prueba y el descubrimiento';
            $buttonText = 'Ir a Exámenes';
            $buttonLink = route('examen.index');
        } else {
            $message = 'Realiza tus exámenes aquí.';
            $buttonText = 'Ir a Realizar Exámenes';
            $buttonLink = route('examen.index');
        }

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-pen',
            'title'  => 'Exámenes',
            'text'   => $message,
            'button' => [
                'text' => $buttonText,
                'link' => $buttonLink,
            ],
            'image' => '/img/examenW.jpg',
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
