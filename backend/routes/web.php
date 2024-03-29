<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('testView', function () {
    return view('helloworld');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

/*Route::get('/post/create', function (Request $request) {
    return "hello world";
});*/