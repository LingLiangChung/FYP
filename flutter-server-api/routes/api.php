<?php
use App\Models\User;
use App\Models\admin;
use App\Models\Job;
use App\Models\Jobseeker;
use App\Http\Controllers\JobseekerController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\EmployerAuthController;
use App\Http\Controllers\JobsController;
use App\Http\Controllers\EmployerController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\AdminAuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


// Public routes - jobseekers
Route::post('/jobseeker_register', [AuthController::class,'register']);
Route::post('/jobseeker_login', [AuthController::class,'login']);
Route::get('/all_jobseeker', [JobseekerController::class,'index']);
Route::get('/search_jobseeker/{name}', [JobseekerController::class, 'search']);
Route::resource('jobseeker', JobseekerController::class);

// Public routes - Jobs
Route::resource('jobs', JobsController::class);
Route::get('/all_jobs', [JobsController::class,'index']);
Route::post('/createJob', [JobsController::class,'store']);
Route::resource('search_id', JobsController::class);
Route::get('/search_jobs/{name}', [JobsController::class, 'search']);
Route::post('/jobs/{$id}', [JobsController::class,'update']);

// Public routes - Employers
Route::post('/employer_register', [EmployerAuthController::class,'register']);
Route::get('/employers', [EmployerController::class,'index']);
Route::get('/employers/search/{name}', [EmployerController::class, 'search']);
Route::resource('employers', EmployerController::class);
Route::post('/employer_login', [EmployerAuthController::class,'login']);

// Public routes - admins
Route::resource('admin', AdminController::class);
Route::get('/admins', [AdminController::class,'index']);
Route::post('/admin_register', [AdminAuthController::class,'register']);
Route::post('/admin_login', [AdminAuthController::class,'login']);

// Public routes - chat (to be moved to protected route)
Route::post('getAllUser', [App\Http\Controllers\ChatController::class, 'getAllUser']);
Route::post('chat/sendMessage', [App\Http\Controllers\ChatController::class, 'sendMessage']);
Route::post('chat/getUserChat', [App\Http\Controllers\ChatController::class, 'getUserChat']);


// Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {
    // Jobseekers
    Route::post('/store', [JobseekerController::class,'store']);
    Route::put('/jobseeker/{$id}', [JobseekerController::class,'update']);
    Route::delete('/destroy/{$id}', [JobseekerController::class,'destroy']);
    Route::post('/logout', [AuthController::class,'logout']);
    
    // Jobs
    // Route::get('/jobs', [JobsController::class,'index']);
    
    // // Employer
    // Route::post('/employer_store', [EmployerController::class,'store']);
    // Route::put('/update/{$id}', [EmployerController::class,'update']);
    // Route::delete('/employer_destroy/{$id}', [EmployerController::class,'destroy']);
    Route::post('/employer_logout', [EmployerController::class,'logout']);

    Route::post('/admin_logout', [AdminAuthController::class,'logout']);
});


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
