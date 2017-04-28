<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\ImageManagerStatic as Image;

class UploadController extends Controller
{
    public function image(Request $request)
    {
        $image = $request->file('photo');
        if (empty(config('image')['mime'][$image->getClientMimeType()])) {
            return response(['not type image'], 500);
        }
        $result = Image::make($image->getRealPath())
                    ->save(public_path("img/{$image->getClientOriginalName()}"));
        return $image->getClientOriginalName();
    }
    public function delete($name)
    {
        $rs = Storage::delete("img/{$name}");
        if ($rs) {
            return response([], 200);
        }
    }
}
