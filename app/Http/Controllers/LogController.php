<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Input;
use Request;
use Mail;
use \Vicens\Captcha\Facades\Captcha;
use Illuminate\Support\Facades\Cookie;

class LogController extends Controller
{
    /**
     * 处理登录认证
     *
     * @return Response
     * @translator laravelacademy.org
     */
    public function authenticate()
    {
      try {
        date_default_timezone_set('Asia/Shanghai');
        $token = "";
        $input=Request::all();
    //    $input['username']="jojo";
    //    $input['password']="19920430vin";
        $vercode = Input::get('vercode');
        if(!Captcha::test($vercode))
        {
          return array("code" => 1001 ,"msg" => "验证码错误!" ,"data" => array("access_token" => ""));
        }
        $ip = $_SERVER["REMOTE_ADDR"];
        $time = date('Y-m-d H:i:s',time());
        $isrecordexists = DB::table('ip_lock')->where('ip', $ip)->exists();
        if($isrecordexists == true)
        {
          $getlockdata = DB::table('ip_lock')->where('ip', $ip)->first();
          $second1 = strtotime($getlockdata->sign_time);
          $second2 = strtotime($time);
          $rest = ($second2 - $second1) / 60;//分钟

          if($getlockdata->islock==1)
          {
            if($getlockdata->lock_level==1)
            {
              if($rest<=20)
              {
                return array("code" => 1001 ,"msg" => "对不起，您尝试错误密码超过5次，20分钟内将禁止登录" ,"data" => array("access_token" => ""));
              }
              else
              {
                DB::table('ip_lock')
                ->where('ip', $ip)
                ->update(['islock' => 0]);
              }
            }
            if($getlockdata->lock_level==2)
            {
              if($rest<=300)
              {
                return array("code" => 1001 ,"msg" => "对不起，您尝试错误密码超过10次，5小时内将禁止登录" ,"data" => array("access_token" => ""));
              }
              else
              {
                DB::table('ip_lock')
                ->where('ip', $ip)
                ->update(['islock' => 0]);
              }
            }
          }
        }

        if (Auth::attempt(['name' => $input['username'], 'password' => $input['password']])) {
            // 认证通过...
            $token = md5($input['username'].(string)intval(time())).md5(rand(1,77));
            $getdata = DB::table('users')->where('name', $input['username'])->first();
            $id = $getdata->id;

            DB::table('user_data')
            ->where('name', $input['username'])
            ->update(['access_token' => $token,'loginIP' => $ip,'loginTime' => $time]);

            Session::put('userid',$id);
            Session::put('username', $input['username']);
            Session::put('islogin','true');
            if(DB::table('ip_lock')->where('ip', $ip)->exists())
            {
              DB::table('ip_lock')->where('ip', $ip)->delete();
            }
            return array("code" => 0 ,"msg" => "登陆成功!" ,"data" => array("access_token" => $token));
        }
        //密码验证错误
        if($isrecordexists == true)
        {
          DB::table('ip_lock')->increment('times');
          $getlockdata = DB::table('ip_lock')->where('ip', $ip)->first();
          if($getlockdata->times==6&&$getlockdata->lock_level==0)
          {
            DB::table('ip_lock')
            ->where('ip', $ip)
            ->update(['islock' => 1,'sign_time' => $time,'lock_level' => 1]);

          }
          else if($getlockdata->times==11)
          {
            DB::table('ip_lock')
            ->where('ip', $ip)
            ->update(['islock' => 1,'sign_time' => $time,'lock_level' => 2]);
          }

        }
        else {
          DB::table('ip_lock')->insert(
            ['ip'=>$ip,'islock'=>0,'sign_time'=>$time,'times'=>1,'lock_level'=>0]
          );
        }

        return array("code" => 1001 ,"msg" => "用户名或密码错误!" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "请重新登录!" ,"data" => array("access_token" => (string)$e));

      }


    }
    public function logout()
    {
      try {

        Auth::logout();


        return array("code" => 0 ,"msg" => "退出成功!" ,"data" => array("access_token" => ""));

      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "请重新登录!" ,"data" => array("access_token" => ""));


      }


    }

    public function setpass()
    {
      try {
        $token = "";
        $input=Request::all();
        $user_id = Session::get('userid');
        $user_token = Input::get('access_token');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        if($getuserdata->access_token == $user_token)
        {

          if (Auth::attempt(['id' => $user_id, 'password' => $input['oldPassword']]))
          {
            // 认证通过...
              if($input['password']!=$input['repassword'])
              {
                return array("code" => 0 ,"msg" => "两次密码输入不一致!" ,"data" => array("access_token" => "","stats"=>"NO"));
              }
              if($input['password']==$input['oldPassword'])
              {
                return array("code" => 0 ,"msg" => "新密码与旧密码相同!" ,"data" => array("access_token" => "","stats"=>"NO"));
              }
              DB::table('users')
              ->where('id', $user_id)
              ->update(['password' => bcrypt($input['password'])]);


              return array("code" => 0 ,"msg" => "修改成功!" ,"data" => array("access_token" => $token,"stats"=>"OK"));
            }
            return array("code" => 0 ,"msg" => "验证密码错误!" ,"data" => array("access_token" => "","stats"=>"NO"));
          }
          return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));

      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "请重新登录!" ,"data" => array("access_token" => ""));
      }
    }

    public function userreg()
    {
      try {
        date_default_timezone_set('Asia/Shanghai');
        $nickname = Input::get('nickname');
        $password = Input::get('password');
        $repass = Input::get('repass');
        $email = Input::get('email');
        $cellphone = Input::get('cellphone');
        $vercode = Input::get('vercode');
        $agreement = Input::get('agreement');

        if($agreement!="on")
        {
          return array("code" => 0 ,"msg" => "注册本网站会员需同意《用户协议》" ,"data" => array("stats" => "2"));
        }
        if(DB::table('users')->where('name', $nickname)->exists())
        {
          return array("code" => 0 ,"msg" => "该用户名已被使用" ,"data" => array("stats" => "2"));
        }
        if($password!=$repass)
        {
          return array("code" => 0 ,"msg" => "两次密码输入不一致" ,"data" => array("stats" => "2"));
        }
        if(DB::table('user_data')->where('mobile', $cellphone)->exists())
        {
          return array("code" => 0 ,"msg" => "该手机号码已被使用" ,"data" => array("stats" => "2"));
        }
        if(DB::table('users')->where('email', $email)->exists())
        {
          return array("code" => 0 ,"msg" => "该邮箱已被占用" ,"data" => array("stats" => "2"));
        }
        if(DB::table('sms_temp')->where('mobile', $cellphone)->doesntExist())
        {
          return array("code" => 0 ,"msg" => "未向该手机号码发送验证码，请核对" ,"data" => array("stats" => "2"));
        }

        $getsmstemp = DB::table('sms_temp')->where('mobile', $cellphone)->first();
        if($vercode==$getsmstemp->vercode)
        {

          DB::table('users')->insert(
            ['role_id' => 2, 'name' => $nickname, 'email'=>$email,'avatar'=>'users/default.png','password'=>bcrypt($password)]
          );
          $user = DB::table('users')->where('name', $nickname)->first();
          $user_id = $user->id;

          DB::table('user_data')->insert(
            ['id'=>$user_id,'name' => $nickname,'user_sta'=>1,'vip_level'=>0,'mp'=>0,'balance'=>0,'sex'=>'保密','mobile'=>$cellphone,'mobile_check'=>1,'email_check'=>0,'remark'=>'这个人很懒，没留下备注。']
          );

          DB::table('numsieve_service')->insert(
            ['userid' => $user_id, 'level'=>'free']
          );

          //用户写入成功
          //开始配发验证邮件和添加通知

          $chars = "ABCDEFGHJKMNPQRSTUVWXYZ123456789";
          //$chars = "0123456789";
          mt_srand(10000000*(double)microtime());
          for ($i = 0, $str = '', $lc = strlen($chars)-1; $i < 64; $i++) {
              $str .= $chars[mt_rand(0, $lc)];
          }

          $url = "http://member.onsigma.com/checkemail?uid=".$user_id."&vercode=".$str."&time=".time();
          Mail::send('email',['name'=>$nickname,'title'=>'ONSIGMA邮箱验证','url'=>$url],function ($message)use($email) {
                  // 发件人（你自己的邮箱和名称）
                  $message->from('admin@mail.onsigma.com', 'ONSIGMA');
                  // 收件人的邮箱地址
                  $message->to(urldecode($email));
                  // 邮件主题
                  $message->subject('ONSIGMA会员验证邮件');
              });


         DB::table('user_data')
         ->where('id', $user_id)
         ->update(['email_temp' => $str,'email_check'=>0]);

         //添加通知
         $content='你好，'.$nickname.':<p>欢迎您成为ONSIGMA的会员，一封包含激活链接的邮件已经发往您的邮箱，请您点击后完成注册。</p><p>如有任何疑问，可发送邮件到<a href="mailto:kiros@onsigma.com">kiros@onsigma.com</a>进行反馈。</p>';
         DB::table('notice')->insert(
           ['type'=>'notice','time'=>date('Y-m-d H:i:s',time()),'userid'=>$user_id,'username'=>$nickname,'isread'=>0,'title'=>'欢迎成为ONSIGMA会员','content'=>$content,'isdeleted'=>0]
         );



          return array("code" => 0 ,'datas'=>$getsmstemp,"msg" => "注册成功，验证邮件已发送到您的邮箱" ,"data" => array("stats" => "0"));
        }
        return array("code" => 0 ,"msg" => "验证码错误" ,"data" => array("stats" => "1"));



      } catch (\Exception $e) {
        return array("code" => 0 ,"msg" => "注册失败，请联系管理员" ,"data" => array("stats" => "2"));
      }
    }


    public function forget()
    {
      try {
        $cellphone = Input::get('cellphone');
        $smsvercode = Input::get('smsvercode');

        $vercode = Input::get('vercode');
        if(!Captcha::test($vercode))
        {
          return array("code" => 0 ,"msg" => "图形验证码错误!" ,"data" => array("stats" => "2"));
        }

        if(DB::table('sms_temp')->where('mobile', $cellphone)->doesntExist())
        {
          return array("code" => 0 ,"msg" => "未向该手机号码发送验证码，请核对" ,"data" => array("stats" => "2"));
        }
        if(DB::table('user_data')->where('mobile', $cellphone)->doesntExist())
        {
          return array("code" => 0 ,"msg" => "该手机号码尚未在本网站注册" ,"data" => array("stats" => "2"));
        }
        $getsmstemp = DB::table('sms_temp')->where('mobile', $cellphone)->first();
        if($smsvercode==$getsmstemp->vercode)
        {//验证通过
            $getuserdata = DB::table('user_data')->where('mobile', $cellphone)->first();
            $token = md5($getuserdata->name.(string)intval(time())).md5(rand(1,77));
            DB::table('user_data')
            ->where('mobile', $cellphone)
            ->update(['access_token' => $token]);
            return array("code" => 0 ,"msg" => "验证成功" ,"data" => array("stats" => "0","access_token" => $token));
        }
        return array("code" => 0 ,"msg" => "短信验证码错误" ,"data" => array("stats" => "2"));

      } catch (\Exception $e) {
        return array("code" => 0 ,"msg" => "验证失败" ,"data" => array("stats" => "2"));
      }
    }

    public function resetpass()
    {
      try {
        $password = Input::get('password');
        $repass = Input::get('repass');
        $user_token = Input::get('access_token');


        if($password!=$repass)
        {
          return array("code" => 0 ,"msg" => "两次密码输入不一样" ,"data" => array("stats" => "2"));
        }
        if(DB::table('user_data')->where('access_token', $user_token)->doesntExist())
        {
          return array("code" => 0 ,"msg" => "密码找回失败" ,"data" => array("stats" => "2"));
        }
        $getuserdata = DB::table('user_data')->where('access_token', $user_token)->first();
        DB::table('users')
        ->where('id', $getuserdata->id)
        ->update(['password' => bcrypt($repass)]);


        return array("code" => 0 ,"msg" => "密码修改成功" ,"data" => array("stats" => "0"));

      } catch (\Exception $e) {
        return array("code" => 0 ,"msg" => "验证失败" ,"data" => array("stats" => "2"));
      }
    }

}
