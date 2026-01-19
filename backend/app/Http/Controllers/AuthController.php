<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class AuthController extends Controller {

    public function login(Request $request) {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:6'
        ]);

        // Login logic and hashing the password
        if(!Auth::attempt($request->only('email','password'))) {
            return response()->json([
                'message' => 'Wrong credentials'
            ], 401);
        }

        //Generate token
        $user = $request->user();
        $user->tokens()->delete();
        $token = $user->createToken('auth token')->plainTextToken;

        // We return the token
        return response()->json([
            'token' => 'Bearer ' . $token,
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
            ],
        ]);
    }
}