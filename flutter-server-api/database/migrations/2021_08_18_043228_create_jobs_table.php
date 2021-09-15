<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJobsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jobs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('employer_id');
            $table->foreignId('jobseeker_id');
            $table->foreignId('admin_id');
            $table->foreignId('payment_id');
            $table->string('job_title');
            $table->string('job_content');
            $table->integer('total_payment');
            $table->string('startDate_at');
            $table->string('endDate_at');
            $table->string('startTime_at');
            $table->string('job_status');
            $table->boolean('job_verification');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jobs');
    }
}
