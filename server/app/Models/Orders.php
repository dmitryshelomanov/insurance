<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Orders extends Model
{
    public function user () {
        return $this->belongsTo('App\Models\User');
    }
    public function insurance () {
        return $this->belongsTo('App\Models\Insurance');
    }
    public function agent () {
        return $this->belongsTo('App\Models\Agent');
    }
}
