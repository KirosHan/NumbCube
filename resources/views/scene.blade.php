<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>场次列表-NumbCube</title>
<link rel="stylesheet" href="/layui/css/layui.css">
<link rel="stylesheet" type="text/css" media="all" href="/style.css" />
<link rel="stylesheet" type="text/css" href="/style/css/media-queries.css" />
<link rel="stylesheet" type="text/css" href="/style/js/player/mediaelementplayer.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,400italic,300italic,300,700,700italic|Open+Sans+Condensed:300,700' rel="stylesheet" type='text/css'>
<!--[if IE 8]>
<link rel="stylesheet" type="text/css" href="style/css/ie8.css" media="all" />
<![endif]-->
<!--[if IE 9]>
<link rel="stylesheet" type="text/css" href="style/css/ie9.css" media="all" />
<![endif]-->
<script type="text/javascript" src="/style/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/style/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="/style/js/retina.js"></script>
<script type="text/javascript" src="/style/js/selectnav.js"></script>
<script type="text/javascript" src="/style/js/jquery.masonry.min.js"></script>
<script type="text/javascript" src="/style/js/jquery.fitvids.js"></script>
<script type="text/javascript" src="/style/js/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="/style/js/mediaelement.min.js"></script>
<script type="text/javascript" src="/style/js/mediaelementplayer.min.js"></script>
<script type="text/javascript" src="/style/js/jquery.dcflickr.1.0.js"></script>
<script type="text/javascript" src="/style/js/twitter.min.js"></script>
<script src="/layui/layui.js"></script>
<script type="text/javascript">
	$.backstretch("/style/images/bg/1.jpg");
</script>
</head>
<body>
<div class="scanlines"></div>

<!-- Begin Header -->
@include('header')
<!-- End Header -->

<!-- Begin Wrapper -->
<div class="wrapper"><!-- Begin Intro -->
<div class="intro">请在电影开始后进入放映厅，如电影未开始请尝试刷新</div>
<!-- End Intro -->

<!-- Begin Container -->
<div class="box">

    <div class="one-sixth">
      <p><strong>电影名称</strong></p>
    </div>
    <div class="one-sixth">
      <p><strong>类型</strong></p>
    </div>
    <div class="one-sixth">
      <p><strong>时间/时长</strong></p>
    </div>
		<div class="one-sixth">
			<p><strong>价格</strong></p>
		</div>
    <div class="one-sixth">
      <p><strong>放映厅</strong></p>
    </div>
    <div class="one-sixth last">
      <p><strong>状态</strong></p>
    </div>
    <div class="clear"></div>
    <hr />
		@if(!$moviedata->isEmpty())
				@foreach ($moviedata as $data)
				<div class="one-sixth">
					<p>
						@if($data->isvod==1)
						<font color="#FF0000">【点映】</font>
						@endif

						《{{$data->movie_name}}》/{{$data->movie_subtitle}}</p>
						@if($data->hide_status==0)
							@if($data->isvod==1)
							<p>(由{{$data->vod_username}}点映)</p>
							@endif
						@endif
				</div>
				<div class="one-sixth">
					<p>{{$data->movie_type}}</p>
				</div>
				<div class="one-sixth">
					<p>{{$data->date}}</p><p>({{$data->movie_time}}分钟)</p>
				</div>
				<div class="one-sixth">
					<p>￥{{$data->ticket_price}}</p>
				</div>
				<div class="one-sixth">
					<p><a href="/movie/{{$data->room_id}}">{{$data->room_name}}</a></p>
				</div>
				<div class="one-sixth last">
					<p>
		@if ($data->status == 'waiting')
			等待放映
		@elseif ($data->status == 'playing')
			放映中
		@elseif ($data->status == 'over')
			放映结束
		@elseif ($data->status == 'opening')
			即将放映
		@else
			未知状态
		@endif













</p>
				</div>
				<div class="clear"></div>
				<hr />
				@endforeach
		@else
			<div>
				<center><p>当前没有电影放映</p></center>
			</div>
		@endif

</div>
<!-- End Container -->

</div>
<!-- End Wrapper -->

<!-- Begin Footer -->
@include('footer')
<!-- End Footer -->
<script type="text/javascript" src="/style/js/scripts.js"></script>
<script type="text/javascript">


layui.use(['layer'], function(){
var layer = layui.layer;




$("#membercenter").click(function(){
layer.open({
type: 2,
title: 'NumbCube会员中心',
maxmin: true,
shadeClose: false, //点击遮罩关闭层
area : ['800px' , '520px'],
content: '/member',
cancel: function(){

//return false;//开启该代码可禁止点击该按钮关闭
}
});
});

$("#toindex").click(function(){
layer.open({
type: 2,
title: 'NumbCube登陆',
maxmin: true,
shadeClose: false, //点击遮罩关闭层
area : ['800px' , '520px'],
content: '/member',
cancel: function(){

//return false;//开启该代码可禁止点击该按钮关闭
}
});
});
});
</script>
</body>
</html>
