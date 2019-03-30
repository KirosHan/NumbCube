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

Route::get('/member', function () {
    return view('usercenter');
});

Route::get('/scene','MainController@scene');

Route::get('/movie/{room?}','MainController@movie');//放映厅
Route::get('live/{room?}','MainController@live');//直播间

Route::any('/auto','MainController@auto');
Route::any('/setplay/{sceneid}','MainController@setplay');

Route::redirect('/', '/movie', 301);//重定向

Route::get('/checkemail','DataController@checkemail');//发送验证邮件

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
