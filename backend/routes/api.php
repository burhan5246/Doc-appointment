<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('/adminlogin', 'API\APIController@adminLogin');
Route::post('/createclinic', 'API\APIController@createClinic');
Route::get('/listclinic', 'API\APIController@ClinicList');
Route::get('/clinicdelete/{id}', 'API\APIController@ClinicDelete');
Route::get('/showclinic/{id}', 'API\APIController@ClinicShow');
Route::post('/updateclinic', 'API\APIController@ClinicUpdate');
Route::post('/createdoctor', 'API\APIController@CreateDoctor');
Route::get('/listdoctor/{id}', 'API\APIController@ListDoctor');
Route::get('/doctordelete/{id}', 'API\APIController@DoctorDelete');
Route::post('/updatedoctor', 'API\APIController@DoctorUpdate');
Route::get('/showdoctor/{id}', 'API\APIController@DoctorShow');
Route::post('/newappointment', 'API\APIController@CreateAppointment');
Route::get('/appointmentlist/{id}', 'API\APIController@AppointmentList');
Route::get('/appointmentlistfilter/{getDate}/{userid}', 'API\APIController@AppointmentListFilter');
Route::get('/attendend/{id}', 'API\APIController@Attendend');
Route::get('/todayappointmentlist/{id}', 'API\APIController@todayAppointmentList');