<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJobOrderTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('job_order', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nomor_job_order')->nullable();
            $table->integer('customer_id')->index();
            $table->double('price')->default(0);
            $table->dateTime('mulai_date_riksa')->nullable();
            $table->dateTime('selesai_date_riksa')->nullable();
            $table->string('nomor_po')->nullable();
            $table->dateTime('date_pembayaran')->nullable();
            $table->integer('status_pembayaran')->default(0);
            $table->text('project_by')->nullable();
            $table->text('description')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('job_order');
    }
}
