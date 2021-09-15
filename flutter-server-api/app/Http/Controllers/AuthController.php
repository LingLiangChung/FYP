<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Jobseeker;
use App\Models\User;
use Illuminate\Http\Responce;
use Illuminate\Support\Facades\Hash;


class AuthController extends Controller
{
    public function register(Request $request){
        $fields = $request->validate([
            'name' => 'required|string',
            'password' => 'required|string|confirmed',
            'contact_number' => 'required|integer',
            'nric' => 'required|integer',
            'email' => 'required|string|unique:jobseekers,email',
        ]);

        $jobseeker = Jobseeker::create([
            'name' => $fields['name'],
            'password' => bcrypt($fields['password']),
            'contact_number' => $fields['contact_number'],
            'nric' => $fields['nric'],
            'email' => $fields['email'],
        ]);

        $token = $jobseeker->createToken('jobseekerRegisterToken')->plainTextToken;

        $response = [
            'jobseeker' => $jobseeker,
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
        $jobseeker = Jobseeker::where('name',$fields['name'])->first();

        // Check password
        if(!$jobseeker || !Hash::check($fields['password'], $jobseeker->password)){
            return response([
                'message' => 'Failed'
            ],401);
        }

        $token = $jobseeker->createToken('jobseekerLoginToken')->plainTextToken;

        $response = [
            'jobseeker' => $jobseeker,
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
