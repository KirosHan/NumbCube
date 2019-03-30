<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Input;
use Request;
use Aliyun\DySDKLite\SignatureHelper;

class smsController extends Controller
{
    /**
     * 处理信息获取
     *
     * @return Response
     * @translator laravelacademy.org
     */

     /**
      * 发送短信
      */
     function sendsms() {
       try {
         $getuserdata = "";
         $user_token = Input::get('access_token');
         $phone = Input::get('phone');
         $user_id = Session::get('userid');
         $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
         if($getuserdata->access_token == $user_token)
         {
          // $chars = "ABCDEFGHJKMNPQRSTUVWXYZ123456789";
           $chars = "0123456789";
           mt_srand(10000000*(double)microtime());
           for ($i = 0, $str = '', $lc = strlen($chars)-1; $i < 6; $i++) {
               $str .= $chars[mt_rand(0, $lc)];
           }


           //阿里云短信有分钟流限制
           $alisms = app('alisms.note');
           $flag = $alisms->send('register',$phone,['code'=>$str]);//code 为模板中的变量名
        if($flag === true){
            //todo 发送成功处理
              if( DB::table('sms_temp')->where('mobile', $phone)->exists())
              {
                DB::table('sms_temp')->where([
                  ['mobile', '=', $phone],
                  ])->update(['vercode' => $str,'mobile' => $phone]);

                  DB::table('user_data')->where([
                    ['id', '=', $user_id],
                    ])->update(['mobile_temp' => $phone]);

              }
              else
              {
                DB::table('sms_temp')->insert(
                  ['mobile' => $phone, 'vercode' => $str,'userid' =>$user_id]
                );

                DB::table('user_data')->where([
                  ['id', '=', $user_id],
                  ])->update(['mobile_temp' => $phone]);

              }
              return array("code" => 0 ,"msg" => "发送成功" ,"data" => "");

            }
            return array("code" => 0 ,"msg" => "发送失败" ,"data" => "");
         }
         return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));


       } catch (\Exception $e) {
         return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ""));

       }

     }

     /**
      * 发送注册验证短信
      */
     function sendregsms() {
       try {
         $phone = Input::get('phone');

          // $chars = "ABCDEFGHJKMNPQRSTUVWXYZ123456789";
           $chars = "0123456789";
           mt_srand(10000000*(double)microtime());
           for ($i = 0, $str = '', $lc = strlen($chars)-1; $i < 6; $i++) {
               $str .= $chars[mt_rand(0, $lc)];
           }


           //阿里云短信有分钟流限制
           $alisms = app('alisms.note');
           $flag = $alisms->send('register',$phone,['code'=>$str]);//code 为模板中的变量名
           if($flag === true){
            //todo 发送成功处理
              if( DB::table('sms_temp')->where('mobile', $phone)->exists())
              {
                DB::table('sms_temp')->where([
                  ['mobile', '=', $phone],
                  ])->update(['vercode' => $str,'mobile' => $phone]);

              }
              else
              {
                DB::table('sms_temp')->insert(
                  ['mobile' => $phone, 'vercode' => $str]
                );

              }
              return array("code" => 0 ,"msg" => "发送成功" ,"data" => "");

            }
            return array("code" => 0 ,"msg" => "发送失败" ,"data" => "");


       } catch (\Exception $e) {
         return array("code" => 0 ,"msg" => "发送失败" ,"data" => "");

       }

     }

     /**
      * 发送找回验证短信
      */
     function sendforgetsms() {
       try {
         $phone = Input::get('phone');

          if(DB::table('user_data')->where('mobile', $phone)->doesntExist())
          {
            return array("code" => 0 ,"msg" => "发送失败,该手机号未注册" ,"data" => "");

          }

          // $chars = "ABCDEFGHJKMNPQRSTUVWXYZ123456789";
           $chars = "0123456789";
           mt_srand(10000000*(double)microtime());
           for ($i = 0, $str = '', $lc = strlen($chars)-1; $i < 6; $i++) {
               $str .= $chars[mt_rand(0, $lc)];
           }


           //阿里云短信有分钟流限制
           $alisms = app('alisms.note');
           $flag = $alisms->send('register',$phone,['code'=>$str]);//code 为模板中的变量名
           if($flag === true){
            //todo 发送成功处理
              if( DB::table('sms_temp')->where('mobile', $phone)->exists())
              {
                DB::table('sms_temp')->where([
                  ['mobile', '=', $phone],
                  ])->update(['vercode' => $str,'mobile' => $phone]);

              }
              else
              {
                DB::table('sms_temp')->insert(
                  ['mobile' => $phone, 'vercode' => $str]
                );

              }
              return array("code" => 0 ,"msg" => "发送成功" ,"data" => "");

            }
            return array("code" => 0 ,"msg" => "发送失败" ,"data" => "");


       } catch (\Exception $e) {
         return array("code" => 0 ,"msg" => "发送失败" ,"data" => "");

       }

     }

}
