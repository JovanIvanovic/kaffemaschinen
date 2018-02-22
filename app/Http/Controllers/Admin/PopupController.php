<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Database\Popup;
use App\Models\Database\Package;

class PopupController extends Controller
{
    public function index()
    {
        $dataGrid = DataGrid::model(Popup::query())
            ->column('title', ['sortable' => true, 'label' => __('lang.title')])
            ->linkColumn(__('lang.edit'), [], function ($model) {
                return "<a href='" . route('admin.home.edit', $model->id) . "' >".__('lang.edit')."</a>";
            })
            ->linkColumn('destroy', ['label' => __('lang.destroy')], function ($model) {
                return  "<a href=' " . route('admin.home.destroy', $model->id) . " ' >".__('lang.destroy')."</a>";
            })
            ->setPagination(100);

        return view('admin.popup.index')->with('dataGrid', $dataGrid);
    }


    public function create()
    {
        $packages = Package::all();

        return view('admin.popup.create')
            ->with('packages', $packages);
    }


    public function store(Request $request)
    {
        $this->validate($request, [
            'package_id' => 'required',
            'title' => 'required',
            'image' => 'required|url',
            'active' => 'required',
            'end_date' => 'required'
        ]);

        $image = $request->image;
        $name = time() . $image->getClientOriginalName();
        $folder = '\front\assets\img\popup\\';
        $savePath = public_path($folder);
        Image::make($image->getRealPath())->resize(1140, 480)->save($savePath . $name);
        $dbPath = $folder . $name;

        PageHome::create([
            'package_id' => $request->package_id,
            'title' => $request->title,
            'image' => $dbPath,
            'active' => $request->active,
            'end_date' => $request->end_date,
        ]);

        return redirect()->route('admin.popup.index');
    }


    public function edit($id)
    {
        $packages = Package::all();
        $popup = Popup::findOrFail($id);

        return view('admin.popup.edit')
            ->with('popup', $popup)
            ->with('packages', $packages);
    }


    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'package_id' => 'required',
            'title' => 'required',
            'image' => 'required|url',
            'end_date' => 'required'
        ]);

        $popup = Popup::findorfail($id);
        $popup->update($request->all());

        return redirect()->route('admin.popup.index');
    }


    public function destroy($id)
    {
        $popup = Popup::findorfail($id);
        File::delete(public_path($popup->image));
        $popup->delete();
        return redirect()->back();
    }
}
