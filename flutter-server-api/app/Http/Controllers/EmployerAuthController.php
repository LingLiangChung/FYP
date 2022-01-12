<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Employer;
use App\Models\User;
use Illuminate\Http\Responce;
use Illuminate\Support\Facades\Hash;

class EmployerAuthController extends Controller
{
    public function register(Request $request){
        $fields = $request->validate([
            'name' => 'required|string',
            'password' => 'required|string|confirmed',
            'contact_number' => 'required|integer',
            'nric' => 'required|integer',
            'email' => 'required|string',
        ]);

        $employer = User::create([
            'name' => $fields['name'],
            'password' => bcrypt($fields['password']),
            'contact_number' => $fields['contact_number'],
            'nric' => $fields['nric'],
            'email' => $fields['email'],
            'position' => 'employer',
        ]);

        $token = $employer->createToken('employerRegisterToken')->plainTextToken;

        $response = [
            'employer' => $employer,
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
        $employer = User::where('name',$fields['name'])
                    ->where('position', 'employer')->first();

        // Check password
        if(!$employer || !Hash::check($fields['password'], $employer->password)){
            return response([
                'message' => 'Failed'
            ],401);
        }

        $token = $employer->createToken('employerLoginToken')->plainTextToken;

        $response = [
            'jobseeker' => $employer,
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
