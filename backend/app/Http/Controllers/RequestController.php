<?php

namespace App\Http\Controllers;

use App\Models\Request as RequestModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RequestController extends Controller
{

    public function index()
    {
        // Order by the newest requests
        return RequestModel::where('user_id', Auth::id())
                            ->orderBy('created_at', 'desc')
                            ->get();
    }


    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
        ]);

        $newRequest = RequestModel::create([
            'user_id' => Auth::id(), // It will link to the logged in user
            'title' => $request->title,
            'description' => $request->description,
            'status' => 'Pendiente',
        ]);

        return response()->json($newRequest, 201);
    }

    public function show($id)
    {
        $req = RequestModel::find($id);
        if (!$req) {
            return response()->json(['Message' => "User was not found"], 404);
        }

        return response()->json($req);
    }

    
    public function create()
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request)
    {
        //
    }


    public function update(Request $request, $id)
    {
        $req = RequestModel::find($id);
        if(!$req) {
            return response()->json(['Message' => "User was not found"], 404);
        }

        $request->validate([
            'status' => 'required|string',
        ]);

        $req->status = $request->status;
        $req->save();

        return response()->json($req);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        //
    }
}
