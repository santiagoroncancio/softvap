<?php

namespace App\Widgets;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use Arrilot\Widgets\AbstractWidget;

class UserProfileLink extends AbstractWidget
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
            $count = Voyager::model('User')->count();
            $string = trans_choice('voyager::dimmer.user', $count);

            return view('voyager::dimmer', array_merge($this->config, [
                'icon'   => 'voyager-group',
                'title'  => "{$count} {$string}",
                'text'   => __('voyager::dimmer.user_text', ['count' => $count, 'string' => Str::lower($string)]),
                'button' => [
                    'text' => __('voyager::dimmer.user_link_text'),
                    'link' => route('voyager.users.index'),
                ],
                'image' => '/img/student.jpg',
            ]));
        } else {
            $message = 'Ver perfil';
            $buttonText = 'Ir a tu Perfil';
            $buttonLink = '/profile';

            return view('voyager::dimmer', array_merge($this->config, [
                'icon'   => 'voyager-person',
                'title'  => 'Perfil',
                'text'   => $message,
                'button' => [
                    'text' => $buttonText,
                    'link' => $buttonLink,
                ],
                'image' => '/img/student.jpg',
            ]));
        }
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
