<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Orders;

class OrdersController extends Controller
{
   public function getOrdersByUser (Request $request) {
        $data = Orders::where('user_id', '=', $request->id)
                    ->with(['agent' => function ($q) {
                        $q->select('id', 'name');
                    }])
                    ->with(['insurance' => function ($q) {
                        $q->select('id', 'name');
                    }])
                    ->get();
        return response()->json($data);
   }
   public function createOrder (Request $request) {
       $data = Orders::insert([
           'user_id' => $request->user_id,
           'insurance_id' => $request->insurance,
           'agent_id' => $request->agent,
           'price' => $request->price,
           'duration' => $request->duration,
       ]);
       if ($data) {
           return response()->json([
               'success' => true,
               'data' => 'заказ сохранен'
           ], 200);
       }
   }
    public function getAllOrders () {
        $data = Orders::with(['agent' => function ($q) {
                    $q->select('id', 'name');
                }])
                ->with(['insurance' => function ($q) {
                    $q->select('id', 'name');
                }])
                ->with(['user' => function ($q) {
                    $q->select('id', 'name', 'address');
                }])
                ->get();
        return response()->json($data);
    }
    public function updStatus (Request $request) {
        $data = Orders::where('id', '=', $request->id)->update(['status' => $request->status]);
        if ($data) {
            return response()->json([], 200);
        }
    }
}
