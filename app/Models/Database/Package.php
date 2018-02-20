<?php

namespace App\Models\Database;

use App\Traits\Orderable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Package extends Model
{
    use SoftDeletes, Orderable;

    protected $dates = ['deleted_at'];
    protected $appends = ['image'];
    protected $fillable =['name', 'description', 'price', 'qty', 'tax_amount'];

    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
