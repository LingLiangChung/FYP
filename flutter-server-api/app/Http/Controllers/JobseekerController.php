<?php

namespace App\Http\Controllers;
use App\Models\Jobseeker;
use App\Models\User;
use Illuminate\Http\Request;

class JobseekerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return User::where('position', 'jobseeker')->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'password' => 'required',
            'contact_number' => 'required',
            'nric' => 'required',
            'email' => 'required'
        ]);
        return Jobseeker::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return User::find($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $jobseeker = User::find($id);
        $jobseeker->update($request->all());
        return $jobseeker;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return User::destroy($id);
    }

    /**
     * Search for a name
     *
     * @param  str  $id
     * @return \Illuminate\Http\Response
     */
    public function search($name)
    {
        return User::where('name', 'like', '%'.$name.'%')
                ->where('position', 'jobseeker')->get();
    }
}
