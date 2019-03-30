<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Input;
use Request;
use Mail;

class DataController extends Controller
{
    /**
     * 处理信息获取
     *
     * @return Response
     * @translator laravelacademy.org
     */
    public function new()
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
/*
        DB::table('temp')
        ->where('id', 1)
        ->update(['content' => $user_token]);

        DB::table('temp')
        ->where('id', 2)
        ->update(['content' => $getuserdata->access_token]);
*/
        if($getuserdata->access_token == $user_token)
        {
          $findnotice = DB::table('notice')->where([
            ['userid', '=', $user_id],
            ['isread', '<>', '1'],
            ['isdeleted', '<>', '1'],
          ])->count();
          return array("code" => 0 ,"msg" => "" ,"data" => array("newmsg" => $findnotice));
        }
        return array("code" => 1001 ,"msg" => "请重新登录!" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "请重新登录!" ,"data" => array("access_token" => ""));

      }



    }

    public function session()
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        if($getuserdata->access_token == $user_token)
        {
          $sex = $getuserdata->sex;
          $getusers = DB::table('users')->where('id', $user_id)->first();
          $name = $getusers->name;
          $role = $getusers->role_id;
          return array("code" => 0 ,"msg" => "" ,"data" => array("username" => $name , "sex" => $sex,"role" => $role));
        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));


      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));


      }


    }

    public function info()
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        if($getuserdata->access_token == $user_token)
        {
          $sex = $getuserdata->sex;
          $getusers = DB::table('users')->where('id', $user_id)->first();
          $name = $getusers->name;
          $role = $getusers->role_id;
          $remark = $getuserdata->remark;
          $mobile = $getuserdata->mobile;
          $email = $getusers->email;
          $emailcheck = $getuserdata->email_check;
          $mobilecheck = $getuserdata->mobile_check;
          $user_sta = $getuserdata->user_sta;
          $vip_level = $getuserdata->vip_level;
          $MP = $getuserdata->mp;
          $balance = $getuserdata->balance;
          return array("code" => 0 ,"msg" => "" ,"data" => array("username" => $name ,"viplevel"=>$vip_level,"MP"=>$MP ,"usersta"=>$user_sta,"sex" => $sex,"email"=>$email,"mobile"=>$mobile,"role" => $role,"remark" => $remark,"mobile_check" => $mobilecheck, "email_check" => $emailcheck,"balance" => $balance));
        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ""));

      }
    }

    public function setmobile()
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $phone = Input::get('cellphone');
        $vercode = Input::get('vercode');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();

        if($getuserdata->access_token == $user_token)
        {
          if(DB::table('user_data')->where('mobile', $phone)->exists())
          {
            return array("code" => 0 ,"msg" => "该号码已被绑定" ,"data" => array("stats" => "2"));
          }
          if($getuserdata->mobile_temp == $phone)
          {//获取验证码的手机号与提交的号码
              $getsmstemp = DB::table('sms_temp')->where('mobile', $phone)->first();
              if($vercode==$getsmstemp->vercode)
              {
                DB::table('user_data')->where([
                  ['id', '=', $user_id],
                ])->update(['mobile' => $phone,'mobile_check' => 1]);
                return array("code" => 0 ,"msg" => "修改成功" ,"data" => array("stats" => "0"));
              }
              return array("code" => 0 ,"msg" => "短信验证码错误" ,"data" => array("stats" => "1"));
          }
          return array("code" => 0 ,"msg" => "接收号码不符" ,"data" => array("stats" => "2"));

        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));


      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      }
    }


    public function setemail()
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $email = Input::get('email');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();

        if($getuserdata->access_token == $user_token)
        {
          if(DB::table('users')->where('email', $email)->exists())
          {
            return array("code" => 0 ,"msg" => "该邮箱已被占用" ,"data" => array("stats" => "2"));
          }

           $chars = "ABCDEFGHJKMNPQRSTUVWXYZ123456789";
           //$chars = "0123456789";
           mt_srand(10000000*(double)microtime());
           for ($i = 0, $str = '', $lc = strlen($chars)-1; $i < 64; $i++) {
               $str .= $chars[mt_rand(0, $lc)];
           }

           $url = "https://www.numbcube.com/checkemail?uid=".$user_id."&vercode=".$str."&time=".time();
           Mail::send('email',['name'=>$getuserdata->name,'title'=>'numbcube邮箱验证','url'=>$url],function ($message)use($email) {
                   // 发件人（你自己的邮箱和名称）
                   $message->from('admin@mail.numbcube.com', 'numbcube');
                   // 收件人的邮箱地址
                   $message->to(urldecode($email));
                   // 邮件主题
                   $message->subject('numbcube会员验证邮件');
               });


          DB::table('user_data')
          ->where('id', $user_id)
          ->update(['email_temp' => $str,'email_check'=>0]);

          DB::table('users')
          ->where('id', $user_id)
          ->update(['email'=>$email]);

          return array("code" => 0 ,"msg" => "修改成功,请前往您的邮箱验证" ,"data" => array("stats" => "0"));
        }
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      }
    }

    public function sendemail()
    {
      try {

        $user_id = Session::get('userid');
        $user_token = Input::get('access_token');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();

        if($getuserdata->access_token == $user_token)
        {

           $chars = "ABCDEFGHJKMNPQRSTUVWXYZ123456789";
           //$chars = "0123456789";
           mt_srand(10000000*(double)microtime());
           for ($i = 0, $str = '', $lc = strlen($chars)-1; $i < 64; $i++) {
               $str .= $chars[mt_rand(0, $lc)];
           }
           $getusers = DB::table('users')->where('id', $user_id)->first();

           $url = "https://www.numbcube.com.com/checkemail?uid=".$user_id."&vercode=".$str."&time=".time();
           Mail::send('email',['name'=>$getuserdata->name,'title'=>'numbcube邮箱验证','url'=>$url],function ($message)use($getusers) {
                   // 发件人（你自己的邮箱和名称）
                   $message->from('admin@mail.numbcube.com', 'numbcube');
                   // 收件人的邮箱地址
                   $message->to(urldecode($getusers->email));
                   // 邮件主题
                   $message->subject('numbcube会员验证邮件');
               });

               DB::table('user_data')
               ->where('id', $user_id)
               ->update(['email_temp' => $str]);

          return array("code" => 0 ,"msg" => "发送成功,请前往您的邮箱验证" ,"data" => array("stats" => "0"));
        }
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      }


    }


    public function setinfo()
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $sex = Input::get('sex');
        $remarks = Input::get('remarks');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        if($getuserdata->access_token == $user_token)
        {
          if($sex!="男"&&$sex!="女"&&$sex!="保密")
          {
            $sex="保密";
          }
          if(strlen($remarks) > 200)
          {
            $remarks = substr($remarks,0,200);
          }
          DB::table('user_data')->where([
            ['id', '=', $user_id],
            ])->update(['sex' => $sex,'remark' => $remarks]);

          return array("code" => 0 ,"msg" => "更新成功" ,"data" => array("access_token" => ""));
        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));


      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ""));

      }
    }


    public function checkemail()
    {
      try {
        $user_id = Input::get('uid');
        $vercode = Input::get('vercode');
        $time = Input::get('time');
        if(DB::table('users')->where('id', $user_id)->doesntExist())
        {
          return array("code" => 0 ,"msg" => "用户不存在" ,"data" => array("stats" => "2"));
        }
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        if($getuserdata->email_temp==$vercode)
        {
          DB::table('user_data')->where([
            ['id', '=', $user_id],
            ])->update(['email_check' => 1,'email_temp'=>'']);

            return view('emailcheck', ['result' => '成功']);
          return array("code" => 0 ,"msg" => "验证成功" ,"data" => array("stats" => "0"));
        }
        return view('emailcheck', ['result' => '失败']);
        return array("code" => 0 ,"msg" => "用户不存在" ,"data" => array("stats" => "2"));

      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ""));

      }
    }


    public function bill()
    {
      try {
        date_default_timezone_set('Asia/Shanghai');
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $page = Input::get('page');
        $limit = Input::get('limit');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        $offset = $page - 1;
        $offset = $offset * $limit;
        if($getuserdata->access_token == $user_token)
      //  if(true)
        {
          $data = array();

          $count = DB::table('bill')->where([
            ['name', '=', $getuserdata->name],

          ])->count();
          $getbilldata = DB::table('bill')
          ->orderBy('time', 'desc')
          ->where([
            ['name', '=', $getuserdata->name],
          ])->offset($offset)->limit($limit)->get();
          foreach ($getbilldata as $piece) {
            $time = (int)strtotime($piece->time)*1000;
            if($piece->direction == 1)
            {
              array_push($data,array("id" => $piece->id,"change"=>"+".$piece->amount,"title"=>$piece->usefor,"time"=>$piece->time,"isread"=>1));
            }
            else if ($piece->direction == 0)
            {
              array_push($data,array("id" => $piece->id,"change"=>"-".$piece->amount,"title"=>$piece->usefor,"time"=>$piece->time,"isread"=>1));
            }
          }

          return array("code" => 0 ,"msg" => "","count" => $count ,"data" => $data);
        }
        return array("code" => 1001 ,"msg" => "获取信息失败" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "获取信息失败" ,"data" => array("access_token" => ""));

      }


    }



}
