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
    protected $fillable =['name', 'description', 'delivery_price', 'price', 'qty', 'tax_amount'];

    public function products()
    {
        return $this->belongsToMany(Product::class, 'package_products');
    }

    public function popups()
    {
        return $this->belongsToMany(Popup::class);
    }

    public function getTotalPriceAttribute()
    {
        return $this->products()->sum('price');
    }

    public function getPercentageAttribute()
    {
        return round(($this->total_price / $this->price) * 100);
    }
}
