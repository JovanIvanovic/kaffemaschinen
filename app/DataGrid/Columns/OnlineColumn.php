<?php

namespace App\DataGrid\Columns;

class OnlineColumn extends AbstractColumn
{
    protected $type = 'online';

    public function ascUrl()
    {
        $currentRouteName = Route::getCurrentRoute()->getName();
        return route($currentRouteName, ['asc' => $this->identifier()]);
    }

    public function descUrl()
    {
        $currentRouteName = Route::getCurrentRoute()->getName();
        return route($currentRouteName, ['desc' => $this->identifier()]);
    }
}