<?php

namespace App\Http\Controllers;
use App\Models\Job;
use Illuminate\Http\Request;

class JobsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Job::all();
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
            'job_title' => 'required',
            'job_content' => 'required',
            'total_payment' => 'required',
            'startDate_at' => 'required',
            'endDate_at' => 'required',
            'startTime_at' => 'required',
            'job_status' => 'required',
        ]);
        return Job::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Job::find($id);
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
        $job = Job::find($id);
        $job->update($request->all());
        return $job;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return Job::destroy($id);
    }

    /**
     * Search for a name
     *
     * @param  str  $id
     * @return \Illuminate\Http\Response
     */
    public function search($title)
    {
        return Job::where('job_title', 'like', '%'.$title.'%')->get();
    }
}
