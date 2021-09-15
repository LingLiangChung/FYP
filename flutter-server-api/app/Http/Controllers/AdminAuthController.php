<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\admin;
use Illuminate\Support\Facades\Hash;

class AdminAuthController extends Controller
{   

    public function register(Request $request){
        $fields = $request->validate([
            'name' => 'required|string',
            'password' => 'required|string|confirmed',
        ]);

        $admin = admin::create([
            'name' => $fields['name'],
            'password' => bcrypt($fields['password']),
        ]);

        $token = $admin->createToken('adminRegisterToken')->plainTextToken;

        $response = [
            'admin' => $admin,
            'token' => $token
        ];

        return response($response,201);
    }

    public function login(Request $request){
        $fields = $request->validate([
            'name' => 'required|string',
            'password' => 'required|string',
        ]);

        // Check email
        $admin = admin::where('name',$fields['name'])->first();

        // Check password
        if(!$admin || !Hash::check($fields['password'], $admin->password)){
            return response([
                'message' => 'Failed'
            ],401);
        }

        $token = $admin->createToken('jobseekerLoginToken')->plainTextToken;

        $response = [
            'admin' => $admin,
            'token' => $token
        ];

        return response($response,201);
    }

    public function logout(Request $request) {
        auth()->user()->tokens()->delete();

        return [
            'message' => 'Logout success'
        ];
    }
}
