<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\News;

class NewsController extends Controller
{
    public function create(Request $request)
    {
        $result = News::create([
            'data' => $request->data,
            'name' => $request->name
        ]);
        return response()->json($result->id, 200);
    }

    public function getById(Request $request)
    {
        $news = News::where('id', $request->id)->first();
        return response()->json($news, 200);
    }

    public function getAllNews()
    {
        $news = News::orderBy('created_at', 'desc')
                    ->take(10)
                    ->get();
        return response()->json($news, 200);
    }

    public function delete(Request $request)
    {
        $result = News::where('id', $request->id)->delete();
        return response($result, 200);
    }
}
