<?php

namespace App\Models\Database;

use Illuminate\Database\Eloquent\Model;

class Popup extends Model
{
    protected $fillable = ['package_id', 'title', 'image', 'active', 'end_date'];

    public function package()
    {
        $this->hasOne(Package::class);
    }
}