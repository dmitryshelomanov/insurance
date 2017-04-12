<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class AdminPolicy
{
    use HandlesAuthorization;

    public function admin($user)
    {
        if ($user->role == 2) {
            return false;
        }
        return true;
    }
    public function moder($user)
    {
        if ($user->role == 1 || $user->role == 2) {
            return false;
        }
        return true;
    }
}
