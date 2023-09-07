<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateJobOrderDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('job_order_detail', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('job_order_id')->index();
            $table->integer('jasa_id')->index();
            $table->double('qty')->default(0);
            $table->double('price_per_unit')->default(0);
            $table->double('total_price')->default(0);
            $table->dateTime('mulai_date_riksa')->nullable();
            $table->dateTime('selesai_date_riksa')->nullable();
            $table->dateTime('mulai_pengecekan')->nullable();
            $table->dateTime('selesai_pengecekan')->nullable();
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
        Schema::dropIfExists('job_order_detail');
    }
}
