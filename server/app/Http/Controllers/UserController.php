<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function getUsers () {
        $data = User::all();
        return response()->json($data, 200);
    }
    public function updateStatus (Request $request) {
        $rs = User::where('id', $request->id)->update (['role' => $request->role]);
        if ($rs) {
            return response()->json('success', 200);
        }
        return response()->json('error', 500);
    }

    public function logout(Request $request)
    {
        $request->user()->token()->delete();
        return response([], 200);
    }
}
