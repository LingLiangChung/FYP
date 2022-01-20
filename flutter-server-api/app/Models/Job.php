<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Http\Middleware\Authenticate;
use Illuminate\Notifications\Notifiable;

class Job extends Model
{
    use HasFactory, Notifiable;
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id',
        'job_title',
        'job_content',
        'total_payment',
        'startDate_at',
        'endDate_at',
        'startTime_at',
        'job_status',
    ];
}
