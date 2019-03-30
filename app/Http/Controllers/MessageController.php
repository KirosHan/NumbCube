<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Input;
use Request;

class MessageController extends Controller
{
    /**
     * 处理信息获取
     *
     * @return Response
     * @translator laravelacademy.org
     */
    public function notice()
    {
      try {
        date_default_timezone_set('Asia/Shanghai');
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        $page = Input::get('page');
        $limit = Input::get('limit');
        $offset = $page - 1;
        $offset = $offset * $limit;
        if($getuserdata->access_token == $user_token)
      //  if(true)
        {
          $data = array();

          $count = DB::table('notice')->where([
            ['userid', '=', $user_id],
            ['type', '=', 'notice'],
            ['isdeleted', '<>', '1'],
          ])->count();
          $getnoticedata = DB::table('notice')
          ->orderBy('time', 'desc')
          ->where([
            ['userid', '=', $user_id],
            ['type', '=', 'notice'],
            ['isdeleted', '<>', '1'],
          ])->offset($offset)->limit($limit)->get();
          foreach ($getnoticedata as $piece) {
            $time = (int)strtotime($piece->time)*1000;
            array_push($data,array("id" => $piece->id,"title"=>$piece->title,"time"=>$time,"isread"=>$piece->isread));
          }
          return array("code" => 0 ,"msg" => "","count" => $count ,"data" => $data);
        }
        return array("code" => 1001 ,"msg" => "获取信息失败" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "获取信息失败" ,"data" => array("access_token" => ""));

      }


    }

    public function direct()
    {
      try {
        date_default_timezone_set('Asia/Shanghai');
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        $page = Input::get('page');
        $limit = Input::get('limit');
        $offset = $page - 1;
        $offset = $offset * $limit;
        if($getuserdata->access_token == $user_token)
      //  if(true)
        {
          $data = array();

          $count = DB::table('notice')->where([
            ['userid', '=', $user_id],
            ['type', '=', 'direct'],
            ['isdeleted', '<>', '1'],
          ])->count();
          $getnoticedata = DB::table('notice')
          ->orderBy('time', 'desc')
          ->where([
            ['userid', '=', $user_id],
            ['type', '=', 'direct'],
            ['isdeleted', '<>', '1'],
          ])->offset($offset)->limit($limit)->get();
          foreach ($getnoticedata as $piece) {
            $time = (int)strtotime($piece->time)*1000;
            array_push($data,array("id" => $piece->id,"title"=>$piece->title,"time"=>$time,"isread"=>$piece->isread));
          }
          return array("code" => 0 ,"msg" => "","count" => $count ,"data" => $data);
        }
        return array("code" => 1001 ,"msg" => "获取信息失败" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "获取信息失败" ,"data" => array("access_token" => ""));

      }


    }

    public function detail()
    {
      try {
        date_default_timezone_set('Asia/Shanghai');
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $detailid = Input::get('id');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();

        if($getuserdata->access_token == $user_token)
        {
          $noticedata = DB::table('notice')->where([
            ['userid', '=', $user_id],
            ['id', '=', $detailid],
          ])->first();
          $time = (int)strtotime($noticedata->time)*1000;

          DB::table('notice')->where([
            ['userid', '=', $user_id],
            ['id', '=', $detailid],
          ])->update(['isread' => 1]);

          return array("code" => 0 ,"msg" => "" ,"data" => array("id"=>$noticedata->id,"title"=>$noticedata->title,"content"=>$noticedata->content,"time"=>$time));
        }
        return array("code" => 1001 ,"msg" => "获取信息失败" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "获取信息失败" ,"data" => array("access_token" => ""));

      }


    }

    public function setread()
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $getids = Input::get('ids');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();

        if($getuserdata->access_token == $user_token)
        {
          $ids = explode("|",$getids);
          foreach ($ids as $id) {
            DB::table('notice')
            ->where('id', $id)
            ->update(['isread' => 1]);
          }
          return array("code" => 0 ,"msg" => "标记为已读" ,"data" => "");
        }
        return array("code" => 1001 ,"msg" => "标记已读失败" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "标记已读失败" ,"data" => array("access_token" => ""));

      }


    }

    public function setdel()
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $getids = Input::get('ids');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();

        if($getuserdata->access_token == $user_token)
        {
          $ids = explode("|",$getids);
          foreach ($ids as $id) {
            DB::table('notice')
            ->where('id', $id)
            ->update(['isdeleted' => 1]);
          }
          return array("code" => 0 ,"msg" => "已删除" ,"data" => "");
        }
        return array("code" => 1001 ,"msg" => "删除失败" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "删除失败" ,"data" => array("access_token" => ""));

      }


    }

    public function setreadall()
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();

        if($getuserdata->access_token == $user_token)
        {
            DB::table('notice')
            ->where('userid', $user_id)
            ->update(['isread' => 1]);
          return array("code" => 0 ,"msg" => "标记为已读" ,"data" => "");
        }
        return array("code" => 1001 ,"msg" => "标记已读失败" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "标记已读失败" ,"data" => array("access_token" => ""));

      }


    }

}
