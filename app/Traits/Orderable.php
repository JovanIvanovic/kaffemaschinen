<?php

namespace App\Traits;

use App\Models\Database\Order;

trait Orderable
{
    public function orders()
    {
        return $this->morphMany(Order::class, 'orderable');
    }
}