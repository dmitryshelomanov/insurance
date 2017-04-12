<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Agent;

class AgentController extends Controller
{
    public function getAllAgents () {
        $data = Agent::all();
        return response()->json($data);
    }
    public function addAgent (Request $request) {
        $data = Agent::insert([
            'name' => $request->name,
            'text' => $request->text,
            'phone' => $request->phone
        ]);
        if ($data) {
            return response()->json([
                'success' => true,
                'data' => 'агент добавлен'
            ], 200);
        }
    }
}
