<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Input;
//use Request;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;

class MainController extends Controller
{
    /**
     * 处理信息获取
     *
     * @return Response
     * @translator laravelacademy.org
     */


    public function movie($room = 'room0',Request $request)
    {
      $q = Input::get('q');

      date_default_timezone_set('Asia/Shanghai');
      $user_id = Session::get('userid');

      $room = trim($room);
      if(!DB::table('liveroom')->where('room_id', trim($room))->exists())
      {
        $room = 'room0';
      }

      $islogin = 0;
      $moviename = '当前没有电影放映(已自动跳转首页)';
      $movieintro = '暂无';
      $movietype = '无';
      $movietime = '∞';
      $movieyears = '9102';
      $movieorigin = 'N/A';
      $movieactor = '';
      $moviedirector = 'N/A';
      $roomname = '展示厅';
      $roomurl = 'http://stream.numbcube.com:7777/numblive/';
      $roomcdnurl = 'http://stream.numbcube.com:7777/numblive/';
      $roomstream = '0000';
      $roompub = '当前没有电影放映(自动播放展示片段中)';
      $feedback = '';
      $isticket = 0;
      $isoverflow = 0;
      $sceneid = 0;
      $ispublic = true;

      $date = '';
      $now = date('Y-m-d H:i:s',time());
      $nowtime = strtotime($now);
	$quality = '_f';
      $ticketprice = 0;
      $cdnprice = 0;
      $iscdn = 0;



      $moviedata = DB::table('scene')
      ->join('movie', 'scene.movie_id', '=', 'movie.movie_id')
      ->join('liveroom', 'scene.room_id', '=', 'liveroom.room_id')
      ->select('scene.*', 'movie.*', 'liveroom.*')
      ->where([['scene.status','=','waiting'],['scene.room_id','=',$room]])
      ->orwhere([['scene.status','=','playing'],['scene.room_id','=',$room]])
      ->orderBy('scene.date', 'asc')
      ->get();
      if(!$moviedata->isEmpty()){
        foreach ($moviedata as $key => $data) {
          $starttime = strtotime($data->date)-600;
          $endtime = strtotime($data->date)+$data->movie_time*60+600;
          if($nowtime>=$starttime && $nowtime<=$endtime){
            $moviename = $data->movie_name;
            $movieintro = $data->movie_intro;
            $movietype = $data->movie_type;
            $movietime = $data->movie_time;
            $movieyears = $data->movie_years;
            $movieorigin = $data->movie_origin;
            $movieactor = $data->movie_actor;
            $moviedirector = $data->movie_director;
            $roomname = $data->room_name;
            $roomurl = $data->room_url;
            $roomcdnurl = $data->room_cdn_url;
            $roomstream = $data->room_stream;
            $roompub = $data->room_pub;
            $sceneid = $data->scene_id;
            $ticketprice = $data->ticket_price;
            $cdnprice = $data->cdn_price;
            $iscdn = $data->iscdn;
            $date = $data->date;
            if($data->room_id!='room0')
            {
              $ispublic = false;
            }


            //确定画质
            if($q !=null&&$q!='')
            {
              if($q == 'high')
              {
                $quality='_h';
              }
              if($q == 'normal')
              {
              	$quality='_n';
              }


            }

            if($user_id!=null&&$user_id!='')
            {
              //判断买票信息
              $tt = DB::table('numbcube_ticket')->where([
                  ['ticket_scene_id', '=', $data->scene_id],
                  ['ticket_user_id', '=', $user_id],
              ])->exists();
              if($tt)
              {
                $isticket = 1 ;
              }

              //判断人数是否满
              $mm = DB::table('numbcube_ticket')->where('ticket_scene_id', $data->scene_id)->count();
              if($mm >= $data->max_count)
              {
                $isoverflow = 1;
              }

              if($data->vod_userid==$user_id)
              {
                $isticket = 1 ;
              }



            }

          }
        }
      }else {

      }

      if($user_id!=null&&$user_id!='')
      {
          $islogin = 1;
          $getuser = DB::table('users')->where('id', $user_id)->first();
          if($getuser->role_id == 1)
          {
            $isticket = 1 ;
          }
      }






            //判断运营商****************************************
            if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), 'unknown')) {
              $ip = getenv('HTTP_CLIENT_IP');
            } elseif(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), 'unknown')) {
              $ip = getenv('HTTP_X_FORWARDED_FOR');
            } elseif(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown')) {
              $ip = getenv('REMOTE_ADDR');
            } elseif(isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown')) {
              $ip = $_SERVER['REMOTE_ADDR'];
            }
            $ipc = 'unknown';
            $myip =  preg_match ( '/[\d\.]{7,15}/', $ip, $matches ) ? $matches [0] : '';
            $url = 'http://api.map.baidu.com/location/ip?ak=百度地图接口AK&ip='.$myip;


            $ch = curl_init();
            $timeout = 10; // set to zero for no timeout
            curl_setopt ($ch, CURLOPT_URL,$url);
            curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
            $re = curl_exec($ch);
            $ipc1 = json_decode($re);

            if($ipc1->status==0)
            {
              $iparr=explode("|",$ipc1->address);

              $ipc= $iparr[4];
            }



            //************************************************




      $livedatas = DB::table('numbcube_room')
      ->join('user_data', 'numbcube_room.user_id', '=', 'user_data.id')
      ->select('numbcube_room.*', 'user_data.*')
      ->where([['numbcube_room.room_livestatus','=',1]])
      ->get();
      return view('movie', ['roomid' => $room ,
                            'userid' => Session::has('userid')?Session::get('userid'):'',
                            'username' => Session::has('username')?Session::get('username'):'',
                            'moviename' => $moviename,
                            'movieintro' => $movieintro,
                            'movietype' => $movietype,
                            'movietime' => $movietime,
                            'movieyears' => $movieyears,
                            'movieorigin' => $movieorigin,
                            'movieactor' => $movieactor,
                            'moviedirector' => $moviedirector,
                            'roomname' => $roomname,
                            'roomurl' => $roomurl,
                            'roomcdnurl' => $roomcdnurl,
                            'roomstream' => $roomstream,
                            'roompub' => $roompub,
                            'backid' => substr(md5('kiros'.(string)intval(time())).md5(rand(1,77)),3,6),
                            'livedatas' => $livedatas,
                            'isticket' => $isticket,
                            'isoverflow' => $isoverflow,
                            'islogin' => $islogin,
                            'sceneid' =>$sceneid,
                            'ispublic' =>$ispublic,
                            'movieprice' =>$ticketprice,
                            'cdnprice' =>$cdnprice,
                            'ipc'=> $ipc,
                            'iscdn' => $iscdn,
                            'date' =>$date,
                            'quality' => $quality
                          ]);

    }


    public function live($room = '00000',Request $request)
    {
      date_default_timezone_set('Asia/Shanghai');

      $room = trim($room);
      $status = 0;

      $livedata = DB::table('numbcube_room')
      ->join('user_data', 'numbcube_room.user_id', '=', 'user_data.id')
      ->select('numbcube_room.*', 'user_data.*')
      ->where([['numbcube_room.room_id','=',$room]])
      ->first();

      $livedatas = DB::table('numbcube_room')
      ->join('user_data', 'numbcube_room.user_id', '=', 'user_data.id')
      ->select('numbcube_room.*', 'user_data.*')
      ->where([['numbcube_room.room_livestatus','=',1]])
      ->get();

      if($livedata!=null){
        return view('live', ['status' => 1 ,
                              'data' => $livedata,
                              'userid' => Session::has('userid')?Session::get('userid'):'',
                              'username' => Session::has('username')?Session::get('username'):'',
                              'backid' => substr(md5('kiros'.(string)intval(time())).md5(rand(1,77)),3,6),
                              'livedatas' => $livedatas


                            ]);

      }else {
        return view('live', ['status' => 0 ,
                              'data' => '',
                              'userid' => Session::has('userid')?Session::get('userid'):'',
                              'username' => Session::has('username')?Session::get('username'):'',
                              'livedatas' => $livedatas


                            ]);
      }


    }


    public function scene()
    {
      date_default_timezone_set('Asia/Shanghai');


    //  $now = date('Y-m-d H:i:s',time());
    //  $nowtime = strtotime($now);


      $moviedata = DB::table('scene')
      ->join('movie', 'scene.movie_id', '=', 'movie.movie_id')
      ->join('liveroom', 'scene.room_id', '=', 'liveroom.room_id')
      ->select('scene.*', 'movie.*', 'liveroom.*')
      ->where('scene.status','=','waiting')
      ->orwhere('scene.status','=','playing')
      ->orwhere('scene.status','=','opening')
      ->orderBy('scene.date', 'asc')
      ->get();

      $livedatas = DB::table('numbcube_room')
      ->join('user_data', 'numbcube_room.user_id', '=', 'user_data.id')
      ->select('numbcube_room.*', 'user_data.*')
      ->where([['numbcube_room.room_livestatus','=',1]])
      ->get();


    return view('scene', ['userid' => Session::has('userid')?Session::get('userid'):'',
                              'username' => Session::has('username')?Session::get('username'):'',
                              'moviedata' => $moviedata,
                              'datanull' => false,
                              'livedatas' => $livedatas

                            ]);



  }
    public function buyticket()
    {
      try
      {
        date_default_timezone_set('Asia/Shanghai');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();

        $sceneid = Input::get('sceneid');
        //判断是否已经买过
        $tt = DB::table('numbcube_ticket')->where([
            ['ticket_scene_id', '=', $sceneid],
            ['ticket_user_id', '=', $user_id],
        ])->exists();
        if($tt)
        {
          return array("code" => 0 ,"msg" => "您已购买过该场次,请勿重复购买!" ,"data" => array("feedback" => 0));
        }

        $moviedata = DB::table('scene')
        ->join('movie', 'scene.movie_id', '=', 'movie.movie_id')
        ->join('liveroom', 'scene.room_id', '=', 'liveroom.room_id')
        ->select('scene.*', 'movie.*', 'liveroom.*')
        ->where([['scene.scene_id','=',$sceneid]])
        ->first();

        if($moviedata->vod_userid == $user_id)
        {
          return array("code" => 0 ,"msg" => "您点映的影片无需购买即可观看!" ,"data" => array("feedback" => 0));
        }

        $price = $moviedata->ticket_price+$moviedata->cdn_price;
        if($getuserdata->balance < $price)
        {
          return array("code" => 0 ,"msg" => "余额不足无法购买，请前往会员中心充值!" ,"data" => array("feedback" => 0));

        }

        $time = date('Y-m-d H:i:s',time());
        //写ticket表
        DB::table('numbcube_ticket')->insert(
          ['ticket_scene_id' => $sceneid,'ticket_user_id' => $user_id, 'ticket_time' => $time]
        );
        //扣钱
        DB::table('user_data')
        ->where('id', $user_id)
        ->update(['balance' => $getuserdata->balance-$price]);
        //积分
        $addpoint = $price;
        $point = $getuserdata->mp + $addpoint;
        $level = 0;
        if($point > 0)
        {$level=1;}
        if($point >= 100)
        {$level=2;}
        if($point >= 300)
        {$level=3;}
        if($point >= 600)
        {$level=4;}
        if($point >= 1000)
        {$level=5;}
        if($point >= 1500)
        {$level=6;}
        if($point >= 2100)
        {$level=7;}

        DB::table('user_data')
        ->where('id', $user_id)
        ->update(['mp' => $point,'vip_level'=>$level]);

        //写bill表
        DB::table('bill')->insert(
          ['name'=>$getuserdata->name,'direction' => 0, 'amount' => $price,"method"=>"online","time"=>$time,"usefor"=>"购买影票:《".$moviedata->movie_name."》(".$moviedata->date.")"]
        );

        //写notice
        $content="Hi!".$getuserdata->name.":<p>您已成功购买入场票：《".$moviedata->movie_name."》。</p><p>放映时间：".$moviedata->date.' 请准时观看。 （成功点映的场次无法取消）</p><p>本次消费获得积分：'.$addpoint.' </p><p><a target="_blank" href="/scene">点击查看场次列表</a></p>';
        DB::table('notice')->insert(
          ['type'=>'notice','time'=>$time,'userid'=>$user_id,'username'=>$getuserdata->name,'isread'=>0,'title'=>'购票成功通知','content'=>$content,'isdeleted'=>0]
        );


        $tmpuser = DB::table('user_data')->where('id', $moviedata->vod_userid)->first();
        //给点映人分钱
        DB::table('user_data')
        ->where('id', $moviedata->vod_userid)
        ->update(['balance' => $tmpuser->balance+$moviedata->ticket_price*0.6]);

        //给点映人写bill



        DB::table('bill')->insert(
          ['name'=>$tmpuser->name,'direction' => 1, 'amount' => $moviedata->ticket_price*0.6,"method"=>"online","time"=>$time,"usefor"=>"其他用户购买您了点映的场次:《".$moviedata->movie_name."》(".$moviedata->date.")"]
        );

        //给点映人写notice
        $content="Hi!".$tmpuser->name.":<p>其他用户购买了您点映的点映场次：《".$moviedata->movie_name."》。</p><p>放映时间：".$moviedata->date.'。本次您获得收益'.$moviedata->ticket_price*0.6.'元(已自动转入您的账户余额)</p>';
        DB::table('notice')->insert(
          ['type'=>'notice','time'=>$time,'userid'=>$moviedata->vod_userid,'username'=>$tmpuser->name,'isread'=>0,'title'=>'通知：其他用户购买了您的点映场次','content'=>$content,'isdeleted'=>0]
        );


        return array("code" => 0 ,"msg" => "购买成功!如果页面没有自动刷新，请手动点击刷新!" ,"data" => array("feedback" => 1));


      }
      catch(\Exception $e)
      {
        return array("code" => 0 ,"msg" => "购买失败!" ,"data" => array("feedback" => 0));

      }



    }

    public function auto()
    {
      date_default_timezone_set('Asia/Shanghai');
      $now = date('Y-m-d H:i:s',time());
      $nowtime = strtotime($now);

      $moviedata = DB::table('scene')
      ->join('movie', 'scene.movie_id', '=', 'movie.movie_id')
      ->join('liveroom', 'scene.room_id', '=', 'liveroom.room_id')
      ->select('scene.*', 'movie.*', 'liveroom.*')
      ->where('scene.status','=','waiting')
      ->orwhere('scene.status','=','playing')
      ->orwhere('scene.status','=','opening')
      ->orderBy('scene.date', 'asc')
      ->get();
      $returndata = array();
      if(!$moviedata->isEmpty()){
        foreach ($moviedata as $key => $data) {
          $starttime = strtotime($data->date);
          $endtime = strtotime($data->date)+$data->movie_time*60+300;
          if($nowtime>=$endtime && $data->status == 'playing'){
            DB::table('scene')
            ->where('scene_id', $data->scene_id)
            ->update(['status' => 'over']);
          }
          if($nowtime>=$starttime && $nowtime<=$endtime && $data->status == 'waiting'){
            $newstream = substr(md5('kiros'.(string)$data->date.(string)intval(time())).md5(rand(1,77)),3,15);

            DB::table('liveroom')
            ->where('room_id', $data->room_id)
            ->update(['room_stream' => $newstream]);

            DB::table('scene')
            ->where('scene_id', $data->scene_id)
            ->update(['status' => 'opening']);
            array_push($returndata,array("scene_id"=>$data->scene_id,"stream"=>$newstream,"movie_path"=>$data->movie_path,"needconvert"=>$data->needconvert));
          }
        }
      }

      return $returndata;

    }

    public function setplay($sceneid)
    {
      date_default_timezone_set('Asia/Shanghai');
      $now = date('Y-m-d H:i:s',time());
      $nowtime = strtotime($now);

      $moviedata = DB::table('scene')
      ->join('movie', 'scene.movie_id', '=', 'movie.movie_id')
      ->join('liveroom', 'scene.room_id', '=', 'liveroom.room_id')
      ->select('scene.*', 'movie.*', 'liveroom.*')
      ->where([['scene.status','=','opening'],['scene.scene_id','=',$sceneid]])
      ->orderBy('scene.date', 'asc')
      ->get();

      $returndata = array();
      if(!$moviedata->isEmpty()){
        foreach ($moviedata as $key => $data) {
          $starttime = strtotime($data->date);
          $endtime = strtotime($data->date)+$data->movie_time*60+600;

          if($nowtime>=$starttime && $nowtime<=$endtime && $data->status == 'opening'){
            DB::table('scene')
            ->where('scene_id', $data->scene_id)
            ->update(['status' => 'playing']);
            array_push($returndata,array("status"=>'ok'));
          }
        }
      }else{
        array_push($returndata,array("status"=>'no'));

      }

      return $returndata;

    }


    public function liveapply()//申请直播间
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $realname = trim(Input::get('name'));
        $idcard = trim(Input::get('idcard'));

        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();

        if($getuserdata->access_token == $user_token)
        {
          $getinfo = DB::table('numbcube_room')->where('user_id', $user_id)->first();
          if($getinfo!=null){

            return array("code" => 0 ,"msg" => "请勿重复提交申请" ,"data" => array("feedback" => 0));

          }
          else {
            if(strlen($realname)<6||strlen($realname)>12||strlen($idcard)!=18)
            {
              return array("code" => 0 ,"msg" => "信息不符合规范" ,"data" => array("feedback" => 0));

            }
            $getlatestroom = DB::table('numbcube_temp')->where('item', 'latestroom')->first();
            $number = (int)$getlatestroom->content + 1;
            while(DB::table('numbcube_room')->where('room_id', $number)->exists())
            {
              $number = $number + 1;
            }



            DB::table('numbcube_temp')
            ->where('item', 'latestroom')
            ->update(['content' => (string)$number]);
            $name = $getuserdata->name.'的房间';
            $stream = substr(md5($name.(string)intval(time())).md5(rand(1,77)),3,15);
            DB::table('numbcube_room')->insert(
              ['user_id'=>$user_id,'room_id'=>$number,'room_level'=>1,'room_title'=>$name,'room_pub'=>'暂无公告','room_url'=>'http://stream.numbcube.com:7777/numblive/','stream_url'=>'rtmp://stream.numbcube.com/numblive/','room_stream'=>$stream,'room_status'=>0,'room_livestatus'=>0,'room_lock'=>0,'room_password'=>'123456','real_name'=>$realname,'id_card'=>$idcard]
            );
            return array("code" => 0 ,"msg" => "已成功申请，请等待审核" ,"data" => array("feedback" => 1));
          }

        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ""));

      }
    }
    public function liveapplyinfo()//直播间申请信息
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        $status = "未申请";
        $name = "";
        $id = "";
        if($getuserdata->access_token == $user_token)
        {
          $getinfo = DB::table('numbcube_room')->where('user_id', $user_id)->first();
          if($getinfo!=null){
            if($getinfo->room_status == 2){
              $status = "已封禁";
            }
            else if($getinfo->room_status == 1)
            {
              $status = "已通过";
            }
            else{
              $status = "未审核";
            }
            if($getinfo->real_name != ''){
              $name = $getinfo->real_name;
            }
            if($getinfo->id_card != ''){
              $id = $getinfo->id_card;
            }
            return array("code" => 0 ,"msg" => "" ,"data" => array("status" => $status ,"name"=>$name,"id"=>$id ));

          }
          else {
            return array("code" => 0 ,"msg" => "" ,"data" => array("status" => $status ,"name"=>$name,"id"=>$id ));
          }

        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ""));

      }
    }
    public function setlive()//设置直播间信息
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        $newtitle = trim(Input::get('roomtitle'));
        $newpub = trim(Input::get('roompub'));
        if($getuserdata->access_token == $user_token)
        {
          $getinfo = DB::table('numbcube_room')->where('user_id', $user_id)->first();
          if($getinfo!=null){
            if(strlen($newtitle)==0||strlen($newtitle)>60){
              return array("code" => 0 ,"msg" => "房间标题不能为空或超过20字" ,"data" => array("feedback" => 0  ));
            }
            elseif(strlen($newpub)==0||strlen($newpub)>600)
            {
              return array("code" => 0 ,"msg" => "房间公告不能为空或超过200字" ,"data" => array("feedback" => 0 ));

            }
            else{
              DB::table('numbcube_room')
              ->where('user_id', $user_id)
              ->update(['room_title' => $newtitle,'room_pub' => $newpub]);

              return array("code" => 0 ,"msg" => "修改成功" ,"data" => array("feedback" => 1  ));

            }


          }
          else {
            return array("code" => 0 ,"msg" => "设置出错" ,"data" => array("feedback" => 0  ));
          }

        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ""));

      }
    }
    public function liveinfo()//获取直播间信息
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        $status = "未申请";
        if($getuserdata->access_token == $user_token)
        {
          $getinfo = DB::table('numbcube_room')->where('user_id', $user_id)->first();
          if($getinfo!=null){
            if($getinfo->room_status == 2){
              $status = "已封禁";
              return array("code" => 0 ,"msg" => "" ,"data" => array("status" => $status  ));

            }
            elseif($getinfo->room_status == 1)
            {
              $status = "已通过";
              return array("code" => 0 ,"msg" => "" ,"data" => array("status" => $status ,"roomid"=>$getinfo->room_id,"roomlevel"=>$getinfo->room_level,"roomtitle"=>$getinfo->room_title,"roompub"=>$getinfo->room_pub,"roomurl"=>$getinfo->stream_url,"roomstream"=>$getinfo->room_stream,"roomaward"=>$getinfo->room_award,"livestatus"=>$getinfo->room_livestatus));

            }
            else{
              $status = "未审核";
              return array("code" => 0 ,"msg" => "" ,"data" => array("status" => $status  ));

            }


          }
          else {
            return array("code" => 0 ,"msg" => "" ,"data" => array("status" => $status  ));
          }

        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ""));

      }
    }
    public function resetstream()//重置流
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        if($getuserdata->access_token == $user_token)
        {
          $getinfo = DB::table('numbcube_room')->where('user_id', $user_id)->first();
          if($getinfo!=null){
            if($getinfo->room_status == 2){
              return array("code" => 0 ,"msg" => "重置失败" ,"data" => array("feedback" => 0  ));
            }
            elseif($getinfo->room_status == 1)
            {
              $stream = substr(md5($getinfo->room_id.(string)intval(time())).md5(rand(1,77)),3,15);

              DB::table('numbcube_room')
              ->where('user_id', $user_id)
              ->update(['room_stream' => $stream]);

              return array("code" => 0 ,"msg" => "已重置推流地址，请注意软件设置" ,"data" => array("feedback" => 1 ,"newstream"=>$stream  ));

            }
            else{

              return array("code" => 0 ,"msg" => "重置失败" ,"data" => array("feedback" => 0  ));

            }


          }
          else {
            return array("code" => 0 ,"msg" => "重置失败" ,"data" => array("feedback" => 0   ));
          }

        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ""));

      }
    }

    public function setlivestatus()//设置播放状态
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        if($getuserdata->access_token == $user_token)
        {
          $getinfo = DB::table('numbcube_room')->where('user_id', $user_id)->first();
          if($getinfo!=null){
            if($getinfo->room_livestatus == 0)
            {
              DB::table('numbcube_room')
              ->where('user_id', $user_id)
              ->update(['room_livestatus' => 1]);
              return array("code" => 0 ,"msg" => "已设置状态为:正在直播" ,"data" => array("feedback" => 1   ));

            }
            else {
              DB::table('numbcube_room')
              ->where('user_id', $user_id)
              ->update(['room_livestatus' => 0]);
              return array("code" => 0 ,"msg" => "已设置状态为:关闭直播" ,"data" => array("feedback" => 1   ));

            }


          }
          else {
            return array("code" => 0 ,"msg" => "设置失败" ,"data" => array("feedback" => 0   ));
          }

        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ""));

      }
    }

    public function vodmoviedata()//获取点映电影信息
    {
      try {
        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        $getuser = DB::table('users')->where('id', $user_id)->first();
        if($getuserdata->access_token == $user_token)
        {

          if($getuser->role_id == 1)
          {
            $moviedata = DB::table('movie')
            ->get();
            $roomdata = DB::table('liveroom')
            ->get();
          }
          else {
            $moviedata = DB::table('movie')
            ->where('vod_enable', '=', 1)
            ->get();
            $roomdata = DB::table('liveroom')
            ->where('room_vod', '=', 1)
            ->get();
          }

          return array("code" => 0 ,"msg" => "获取信息成功" ,"data" => array("moviedata" => $moviedata,"roomdata" => $roomdata));



        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ''));

      }
    }
    public function vod()//点映电影
    {
      try {
        date_default_timezone_set('Asia/Shanghai');

        $getuserdata = "";
        $user_token = Input::get('access_token');
        $user_id = Session::get('userid');
        $getuserdata = DB::table('user_data')->where('id', $user_id)->first();
        $getuser = DB::table('users')->where('id', $user_id)->first();
        $movieid = Input::get('movieid');
        $roomid = Input::get('roomid');
        $date = Input::get('date');
        $hide = Input::get('hide');


        $ticketprice = Input::get('ticketprice');
        $maxcount = Input::get('maxcount');

        if($ticketprice<0)
        {
          return array("code" => 0 ,"msg" => "票价超出最低预期" ,"data" => array("feedback"=>0));
        }
        if($maxcount<0)
        {
          return array("code" => 0 ,"msg" => "人数超出最低预期" ,"data" => array("feedback"=>0));
        }

        if($getuserdata->access_token == $user_token)
        {
          $movie = DB::table('movie')->where('movie_id', $movieid)->first();
          if($movie->movie_price > $getuserdata->balance)
          {
            return array("code" => 0 ,"msg" => "余额不足，请先充值" ,"data" => array("feedback"=>0));
          }

          $now = date('Y-m-d H:i:s',time());
          $nowtime = strtotime($now);

          $mystarttime = strtotime($date);
          $myendtime = strtotime($date) + $movie->movie_time + 600;

          if($mystarttime<=$nowtime)
          {
            return array("code" => 0 ,"msg" => "你无法回到过去！" ,"data" => array("feedback"=>0));

          }


          $moviedata = DB::table('scene')
          ->join('movie', 'scene.movie_id', '=', 'movie.movie_id')
          ->join('liveroom', 'scene.room_id', '=', 'liveroom.room_id')
          ->select('scene.*', 'movie.*', 'liveroom.*')
          ->where([['scene.status','=','waiting'],['scene.room_id','=',$roomid]])
          ->orwhere([['scene.status','=','playing'],['scene.room_id','=',$roomid]])
          ->orderBy('scene.date', 'asc')
          ->get();
          if(!$moviedata->isEmpty()){
            foreach ($moviedata as $key => $data) {
              $starttime = strtotime($data->date);
              $endtime = strtotime($data->date)+$data->movie_time*60+600;

              if($mystarttime>=$starttime && $mystarttime<=$endtime){
                return array("code" => 0 ,"msg" => "放映厅在该时间段处于忙碌状态，请重新选择放映厅或时间" ,"data" => array("feedback"=>0));
              }
              if($myendtime>=$starttime && $myendtime<=$endtime){
                return array("code" => 0 ,"msg" => "放映厅在该时间段处于忙碌状态，请重新选择放映厅或时间" ,"data" => array("feedback"=>0));
              }
              if($starttime>=$mystarttime && $starttime<=$myendtime){
                return array("code" => 0 ,"msg" => "放映厅在该时间段处于忙碌状态，请重新选择放映厅或时间" ,"data" => array("feedback"=>0));
              }
              if($endtime>=$mystarttime && $endtime<=$myendtime){
                return array("code" => 0 ,"msg" => "放映厅在该时间段处于忙碌状态，请重新选择放映厅或时间" ,"data" => array("feedback"=>0));
              }
            }
          }


          $m_moviedata = DB::table('scene')
          ->join('movie', 'scene.movie_id', '=', 'movie.movie_id')
          ->join('liveroom', 'scene.room_id', '=', 'liveroom.room_id')
          ->select('scene.*', 'movie.*', 'liveroom.*')
          ->where([['scene.status','=','waiting'],['scene.movie_id','=',$movieid]])
          ->orwhere([['scene.status','=','playing'],['scene.movie_id','=',$movieid]])
          ->orderBy('scene.date', 'asc')
          ->get();
          if(!$m_moviedata->isEmpty()){
            foreach ($m_moviedata as $key => $data) {
              $starttime = strtotime($data->date);
              $endtime = strtotime($data->date)+$data->movie_time*60+600;

              if($mystarttime>=$starttime && $mystarttime<=$endtime){
                return array("code" => 0 ,"msg" => '《'.$movie->movie_name."》于该时间段正在其他放映厅播放，请重新选择" ,"data" => array("feedback"=>0));
              }
              if($myendtime>=$starttime && $myendtime<=$endtime){
                return array("code" => 0 ,"msg" => '《'.$movie->movie_name."》于该时间段正在其他放映厅播放，请重新选择" ,"data" => array("feedback"=>0));
              }
              if($starttime>=$mystarttime && $starttime<=$myendtime){
                return array("code" => 0 ,"msg" => '《'.$movie->movie_name."》于该时间段正在其他放映厅播放，请重新选择" ,"data" => array("feedback"=>0));
              }
              if($endtime>=$mystarttime && $endtime<=$myendtime){
                return array("code" => 0 ,"msg" => '《'.$movie->movie_name."》于该时间段正在其他放映厅播放，请重新选择" ,"data" => array("feedback"=>0));
              }
            }
          }

          if($hide == 'on')//匿名
          {
            $hidestatus = 1;
          }
          else {
            $hidestatus = 0;
          }

          if($getuser->role_id == 1)//管理员
          {
              DB::table('scene')->insert(
                ['isvod'=>0,'movie_id' => $movieid, 'date' => $date,"room_id"=>$roomid,"status"=>"waiting","hide_status"=>$hidestatus,"vod_username"=>$getuserdata->name,"vod_userid"=>$user_id,"ticket_price"=>$ticketprice,"max_count"=>$maxcount]
              );
          }
          else {
            DB::table('scene')->insert(
              ['isvod'=>1,'movie_id' => $movieid, 'date' => $date,"room_id"=>$roomid,"status"=>"waiting","hide_status"=>$hidestatus,"vod_username"=>$getuserdata->name,"vod_userid"=>$user_id,"ticket_price"=>$ticketprice,"max_count"=>$maxcount]
            );

            DB::table('user_data')//扣钱
            ->where('id', $user_id)
            ->update(['balance' => $getuserdata->balance-$movie->movie_price]);

            $addpoint = $movie->movie_price;//积分
            $point = $getuserdata->mp + $addpoint;
            $level = 0;
            if($point > 0)
            {$level=1;}
            if($point >= 100)
            {$level=2;}
            if($point >= 300)
            {$level=3;}
            if($point >= 600)
            {$level=4;}
            if($point >= 1000)
            {$level=5;}
            if($point >= 1500)
            {$level=6;}
            if($point >= 2100)
            {$level=7;}

            DB::table('user_data')
            ->where('id', $user_id)
            ->update(['mp' => $point,'vip_level'=>$level]);

            //添加bill
            $time = date('Y-m-d H:i:s',time());
            DB::table('bill')->insert(
              ['name'=>$getuserdata->name,'direction' => 0, 'amount' => $movie->movie_price,"method"=>"online","time"=>$time,"usefor"=>"点映电影:《".$movie->movie_name."》(".$date.")"]
            );


            //添加通知
            $content="Hi!".$getuserdata->name.":<p>您已成功点映电影：《".$movie->movie_name."》。</p><p>放映时间：".$date.' 请准时观看 （成功点映的场次无法取消）。 其他观众产生票价(不包含线路费用)的60%将自动转入您的账户余额，请留意系统通知。</p><p>本次消费获得积分：'.$addpoint.' </p><p><a target="_blank" href="/scene">点击查看场次列表</a></p>';
            DB::table('notice')->insert(
              ['type'=>'notice','time'=>$time,'userid'=>$user_id,'username'=>$getuserdata->name,'isread'=>0,'title'=>'点映成功通知','content'=>$content,'isdeleted'=>0]
            );
          }

          return array("code" => 0 ,"msg" => "《".$movie->movie_name."》点映成功($date)" ,"data" => array("feedback"=>1));



        }
        return array("code" => 1001 ,"msg" => "获取信息失败,请重新登录!" ,"data" => array("access_token" => ""));
      } catch (\Exception $e) {
        return array("code" => 1001 ,"msg" => "no,请重新登录!" ,"data" => array("access_token" => ''));

      }
    }


}
