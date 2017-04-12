<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Contracts\Auth\Factory as Auth;
use Illuminate\Auth\Middleware\Authenticate;

class ModerMiddleware extends Authenticate
{
    public function handle($request, Closure $next, ...$guards)
    {
        $this->authenticate($guards);
        if (policy($request->user ())->moder($request->user ())) {
            return response()->json('Unauthenticated', 401);
        }
        return $next($request);
    }
}
