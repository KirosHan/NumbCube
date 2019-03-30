<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use \Vicens\Captcha\Facades\Captcha;


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

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::any('liveapply','MainController@liveapply');//申请直播间
Route::any('liveapplyinfo','MainController@liveapplyinfo');//直播间申请信息
Route::any('setlive','MainController@setlive');//设置直播信息
Route::any('liveinfo','MainController@liveinfo');//获取直播间
Route::any('resetstream','MainController@resetstream');//重置流
Route::any('setlivestatus','MainController@setlivestatus');//设置播放状态
Route::any('vodmoviedata','MainController@vodmoviedata');//获取点映电影信息
Route::any('vod','MainController@vod');//点映电影
Route::any('buyticket',"MainController@buyticket");//买票



Route::any('userreg','LogController@userreg');//注册接口
Route::any('userlogin','LogController@authenticate');//登录接口
Route::any('setpass','LogController@setpass');//修改密码
Route::any('userlogout','LogController@logout');//登出
Route::any('forget','LogController@forget');//忘记密码
Route::any('resetpass','LogController@resetpass');//重置密码

Route::any('new','DataController@new');//通知数量

Route::any('session','DataController@session');//用户信息
Route::any('bill','DataController@bill');//用户账单信息
Route::any('info','DataController@info');//用户信息(修改信息页面)
Route::any('setinfo','DataController@setinfo');//修改用户信息(修改信息页面)
Route::any('setmobile','DataController@setmobile');//设置手机号
Route::any('sendsms','smsController@sendsms');//发送手机验证码
Route::any('sendregsms','smsController@sendregsms');//发送注册手机验证码
Route::any('sendforgetsms','smsController@sendforgetsms');//发送找回手机验证码
Route::any('setemail','DataController@setemail');//发送验证邮件
Route::any('sendemail','DataController@sendemail');//发送验证邮件



Route::any('message/notice','MessageController@notice');//通知
Route::any('message/direct','MessageController@direct');//私信
Route::any('message/detail','MessageController@detail');//信息详情
Route::any('message/setread','MessageController@setread');//标记已读
Route::any('message/setreadall','MessageController@setreadall');//全部标记已读
Route::any('message/setdel','MessageController@setdel');//标记删除



Route::any('verimg',function(){ //验证码
  $image = Captcha::width(100)->height(40)->make();
  return array("code" => 0 ,"msg" => "img" ,"data" => array('img'=> $image->getBase64()));

});



Route::any('sendcdkey',function(){

    try {
      $email = Input::get('email');
      $cdkey = Input::get('cdkey');

      Mail::send('sendcdkey',['name'=>"你好",'title'=>'Numsieve激活码','cdkey'=>$cdkey],function ($message) {
              // 发件人（你自己的邮箱和名称）
              $message->from('admin@mail.onsigma.com', 'ONSIGMA');
              // 收件人的邮箱地址
              $message->to(urldecode($email));
              // 邮件主题
              $message->subject('Numsieve激活码');
          });
          return "成功";
      } catch (\Exception $e) {
        return "失败".$e;
      }
});
