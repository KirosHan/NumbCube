<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /**
     * 处理登录认证
     *
     * @return Response
     * @translator laravelacademy.org
     */
    public function authenticate()
    {
        $token = "";
        if (Auth::attempt(['name' => $username, 'password' => $password])) {
            // 认证通过...
            $token = "c262e61cd13ad99fc650e6908c7e5e65b63d2f32185ecfed6b801ee3fbdd5c0a";
            return array("code" => 0 ,"msg" => "登陆成功!" ,"data" => array("access_token" => $token));
        }
        return array("code" => 1001 ,"msg" => "用户名或密码错误!" ,"data" => array("access_token" => $token));
    }
}
