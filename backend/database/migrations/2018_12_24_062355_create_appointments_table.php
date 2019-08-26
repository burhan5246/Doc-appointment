<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAppointmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('appointments', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('doc_id')->length(10)->unsigned();
            $table->integer('clinic_id')->length(10)->unsigned();
            $table->string('name', 200);
            $table->string('mob', 200);
            $table->string('email', 200);
            $table->string('gender', 200);
            $table->integer('age')->length(10)->unsigned();
            $table->string('address', 200);
            $table->string('city', 200);
            $table->string('state', 200);
            $table->string('country', 200);
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
        Schema::dropIfExists('appointments');
    }
}
