<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Insurance;

class InsuranceController extends Controller
{
    public function getAllInsurance () {
        $data = Insurance::all('id', 'name', 'price');
        return response()->json($data);
    }
    public function getInsuranceById (Request $request) {
        $data = Insurance::where('id', '=', $request->id)->first();
        return response()->json($data);
    }
    public function updateText (Request $request) {
        $data = Insurance::where('id', '=', $request->id)->update(['text' => $request->data]);
        if ($data) {
            return response()->json('', 200);
        }
    }
    public function addInsurance (Request $request) {
        $resault = Insurance::insert([
            'name' => $request->name,
            'text' => null,
            'price' => $request->price
        ]);
        if ($resault) {
            return response()->json([
                'success' => true,
                'data' => 'Страница добавлена'
            ], 200);
        }
    }
}
