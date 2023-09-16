<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('job_order', function (Blueprint $table) {
            //
            $table->string('nama_pengawas')->nullable();
            $table->string('nohp_pengawas')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('job_order', function (Blueprint $table) {
            //
            $table->dropColumn('nama_pengawas');
            $table->dropColumn('nohp_pengawas');
        });
    }
};
