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

        $id = Auth::user()->id;
        foreach ($roles as $role) {
            if (User::find($id)->roles) {
                return $next($request);
            }
        }

        return abort(403, 'No tienes permiso para acceder a esta página.');
    }
}
