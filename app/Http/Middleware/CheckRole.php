<?php

namespace App\Http\Middleware;

use App\Models\User;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckRole
{
    public function handle(Request $request, Closure $next, ...$roles)
    {
        if (!Auth::check()) {
            return redirect(route('login'));
        }

        if (Auth::user()->roles->contains(function ($valor, $clave) use ($roles) {
            return in_array($valor['name'], $roles);
        })) {
            return $next($request);
        }

        return redirect()->route('voyager.dashboard')->with([
            'message'    => 'Error del sistema: No tienes permiso para acceder a esta página, Por favor comunicarse con el administrador',
            'alert-type' => 'error',
        ]);
    }
}
