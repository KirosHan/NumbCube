<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
@if($status == 0)
	<title>未发现房间-NumbCube</title>
@else
	<title>{{$data->room_title}}-NumbCube</title>
@endif
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
	$.backstretch("/style/images/bg/9.jpg");
</script>


<!-- 播放器 -->
<!--		<link href="https://unpkg.com/video.js/dist/video-js.min.css" rel="stylesheet">-->
<!--		<script src="https://unpkg.com/video.js/dist/video.min.js"></script>-->
		<script src="/scripts/video.min.js"></script>
		<link href="/css/video-js.css" rel="stylesheet">
		<script src="/scripts/videojs-contrib-hls.min.js"></script>


		<script src="/scripts/socket.io.js"></script>

		<style>
        * {
            box-sizing: border-box;
            outline: none;
        }

        p {
            margin: .5em;
            word-break: break-all;
        }

        .content {
            width: 100%;
            height: 100%;
            border: 1px solid #ccc;
            background-image: url('http://ox2ualtw3.bkt.clouddn.com/dongman1.jpeg');
            background-size: 100% 100%;
        }
				.vjs-my-fancy-modal {
					width: 100%;
					height: 80%!important;
					background-color: none!important;
					pointer-events: none;
					overflow: none!important;
				}


				.vjs-my-fancy-modal .vjs-button{
					display: none!important;
				}
				.vjs-my-fancy-modal .vjs-modal-dialog-content{
					display: none!important;
				}
				.vjs-my-fancy-modal .vjs-control-text{
					display: none!important;
				}

				.vjs-hidden{
					display: none!important;
					pointer-events: none!important;
				}
        .content-opt {
						position: absolute;

            width: 60%;
						pointer-events: auto;
						margin:0 auto;
						left: 50% ;
						transform: translate(-50%, -50%);
						bottom:1px;
        }


        .content-text {
						margin-top: 15px;
            margin-bottom: 15px;
            overflow: none;
        }

        .content-input {
            position: absolute;

            width: 100%;
            height: 100%;

        }

				#danmuinput {
					font-size: 22px!important;

				}

        .content-input input {
            width: 100%;
            padding: 1px;
            border-radius: 5px;
        }

        .content-input button {
            padding: 1px;
            border: none;

						width: 10%;
            background: #303030;
						color: #fff;
        }
				.floatclean {
					clear:both;
				}

    </style>
</head>
<body>
<div class="scanlines"></div>

<!-- Begin Header -->
@include('header')
<!-- End Header -->

<!-- Begin Wrapper -->
<div class="wrapper"><!-- Begin Intro -->
	<div class="box">

		@if($status == 0)
		<h3>未发现该房间</h3>
			<hr />
		@else
		<h3>
			@if($data->room_award!='')
			<font color="#ff6600">{{$data->room_award}}</font>

			@endif

			{{$data->room_title}}</h3>


			<hr />
    <div class="one-fourth">

      <p>房间主人: {{$data->name}}【<font color="#FF0000">VIP{{$data->vip_level}}</font>】 </p>
			<p>房间等级: {{$data->room_level}} </p>
			<p>房间状态: @if($data->room_livestatus==1)直播中
				@else 空闲
				@endif

			 </p>

    </div>
    <div class="three-fourth last">
      <p>{{$data->room_pub}}</p>
    </div>
    <div class="clear"></div>



		@endif
		<hr />

	</div>
<div class="intro">
 <!--<div id="content" class="content"></div>-->
 @if($status == 0)
	<div class="box">
		<h4>您访问的房间不存在</h4>

	</div>

 @else
		@if($data->room_status == 0)
		<div class="box">
			<h4>您访问的房间<font color="#FF0000">尚未通过审核</font></h4>

		</div>
		@elseif($data->room_status == 2)
		<div class="box">
			<h4>您访问的房间<font color="#FF0000">已被封禁</font></h4>

		</div>

		@else
		<video
		 id="player"
		 class="video-js vjs-fluid"
		 controls
		 preload="auto"
		 poster="//vjs.zencdn.net/v/oceans.png"
		 data-setup='{}'>
	 <source src="{{$data->room_url.$data->room_stream}}.m3u8" type="application/x-mpegURL"></source>
		@endif
 @endif



</video>

</div>
<div style="clear:both;"></div>


<!-- Begin note -->
@include('note')
<!-- End note -->


</div>
<!-- End Wrapper -->

<!-- Begin Footer -->
@include('footer')
<!-- End Footer -->
<script type="text/javascript" src="/style/js/scripts.js"></script>
<script type="text/javascript">
				var isl =@if($username!=''&&$userid!='')true;
				@else false;
				@endif
				@if($status == 1)
				var owner = '{{$data->name}}';
				@else
				var owner = 'null';
				@endif
				var isBarrageall = true;
				var isBarrageOpen = true;
				var isSendDialogOpen = false;
        var myPlayer = videojs('player',{
						autoplay : true,
            bigPlayButton : false,
            textTrackDisplay : false,
            posterImage: true,
            errorDisplay : false,
            controlBar : true
        },function(){
					var ModalDialog = videojs.getComponent('ModalDialog');
					var modal = new ModalDialog(myPlayer, {

					// We don't want this modal to go away when it closes.
					temporary: false
					});
					modal.addClass('vjs-my-fancy-modal');
					myPlayer.addChild(modal);


			//		var dButton = myPlayer.controlBar.addChild('button',{}, 3);
			//		dButton.controlText="test";
			//		dButton.addClass('vjs-icon-rotate');
			//		dButton.on('click',function(){console.log(dButton.controlText);});
			var person = videojs.getComponent('Button');
			var personButton = videojs.extend(person, {
				constructor: function() {
					person.apply(this, arguments);
					this.controlText("在线人数");
					$(this.contentEl())
					.find('.vjs-control-text')
					.removeClass('vjs-control-text');
				},
				buildCSSClass: function() {
					return "vjs-control vjs-button vjs-olusers";
				},
				handleClick: function() {

				}
			});
			videojs.registerComponent('personButton', personButton);
			myPlayer.controlBar.addChild('personButton', {} ,8);


	var Dan = videojs.getComponent('Button');
	var DanButton = videojs.extend(Dan, {
		constructor: function() {
			Dan.apply(this, arguments);
			this.controlText("弹幕:开");
			$(this.contentEl())
			.find('.vjs-control-text')
			.removeClass('vjs-control-text');
		},
		buildCSSClass: function() {
			return "vjs-control vjs-button";
		},
		handleClick: function() {
			if(isBarrageOpen){
				this.controlText("弹幕:关");
				isBarrageOpen = false;
			}else{
				this.controlText("弹幕:开");
				isBarrageOpen = true;
			}
		}
	});
	videojs.registerComponent('DanButton', DanButton);
	myPlayer.controlBar.addChild('DanButton', {} ,8);

	var allDan = videojs.getComponent('Button');
	var allDanButton = videojs.extend(allDan, {
		constructor: function() {
			allDan.apply(this, arguments);
			this.controlText("全站弹幕");
			$(this.contentEl())
			.find('.vjs-control-text')
			.removeClass('vjs-control-text');
		},
		buildCSSClass: function() {
			return "vjs-control vjs-button";
		},
		handleClick: function() {
			if(isBarrageall){
				this.controlText("房间弹幕");
				isBarrageall = false;
			}else{
				this.controlText("全站弹幕");
				isBarrageall = true;
			}
		}
	});
	videojs.registerComponent('allDanButton', allDanButton);
	myPlayer.controlBar.addChild('allDanButton', {} ,8);

	var Send = videojs.getComponent('Button');
	var SendButton = videojs.extend(Send, {
		constructor: function() {
			Send.apply(this, arguments);
			this.controlText("发弹幕");
			$(this.contentEl())
			.find('.vjs-control-text')
			.removeClass('vjs-control-text');
		},
		buildCSSClass: function() {
			return "vjs-control vjs-button";
		},
		handleClick: function() {
			if(isSendDialogOpen){
				closeSendDialog();
			}else{
				openSendDialog();
			}

		}
	});
	videojs.registerComponent('SendButton', SendButton);
	myPlayer.controlBar.addChild('SendButton', {} ,8);





            console.log(this)
            this.on('loadedmetadata',function(){
                console.log('loadedmetadata');
                //加载到元数据后开始播放视频
                startVideo();
            })
						this.on('ready',function(){
							modal.open();
							myPlayer.controls(true);
                console.log('ready')


            })
            this.on('ended',function(){
                console.log('ended')
            })
            this.on('firstplay',function(){
                console.log('firstplay')
            })
            this.on('loadstart',function(){
            //开始加载
                console.log('loadstart')
            })
            this.on('loadeddata',function(){
                console.log('loadeddata')
            })
            this.on('seeking',function(){
            //正在去拿视频流的路上
                console.log('seeking')
            })
            this.on('seeked',function(){
            //已经拿到视频流,可以播放
                console.log('seeked')
            })
            this.on('waiting',function(){
                console.log('waiting')
            })
            this.on('pause',function(){
                console.log('pause')
            })
            this.on('play',function(){
                console.log('play')
            })
						this.on('fullscreenchange',function(){
                console.log('change')
							//	document.querySelector('.' + 'vjs-my-fancy-modal').removeChild($(.(barrage)));

								//resetdiv();
            })
        });

        function startVideo() {

            myPlayer.play();

            //微信内全屏支持
            document.getElementById('roomVideo').style.width = window.screen.width + "px";
            document.getElementById('roomVideo').style.height = window.screen.height + "px";

        }

				function openSendDialog() {


			//	let tpl = '<div class="content-opt"><div class="content-input"><input id="text" type="text"><button id="send" onclick="Send()">发送</button></div></div><div class="floatclean"></div>';
		//	let tpl = '<div class="webflow-style-input"><input placeholder="输入你想发的弹幕"></input><button type="submit" onclick="Send()><i class="icon ion-android-arrow-forward"></i></button></div>';
	let tpl = '<div class="content-opt"><div class="content-input"><input id="danmuinput" type="text" name="s" placeholder="输入你想发的弹幕"/></div><div class="floatclean"></div></div>';


					$('.' + 'vjs-my-fancy-modal').append(tpl);
$('#danmuinput').focus()
isSendDialogOpen = true;



				}
				function closeSendDialog() {
					$('.' + 'content-opt').remove();
					isSendDialogOpen = false;
				}


				$(document).keyup(function(event){
  if(event.keyCode ==13){
		if(isSendDialogOpen){
			Send();
		}else{
			openSendDialog();
		}
		  }
	});


/*
		$(document).on('keydown','#player',function(event){
			if(event.keyCode ==13){
				if(isSendDialogOpen){
					Send();
				}else{
					openSendDialog();
				}
			}
 		})

*/


				</script>



		<script type="text/javascript">
		//计时器 每秒
		    function checkTime(){
		        var nowtime=Date.parse(new Date());

		    }
		    setInterval("checkTime()","1000");
		</script>



		<script>
		function setdiv(cssclass) {
					this.domList = [];
					this.dom = document.querySelector('.' + cssclass);
					if (this.dom.style.position == '' || this.dom.style.position == 'static') {
							this.dom.style.position = 'relative';
					}
					this.dom.style.overflow = 'hidden';
					let rect = this.dom.getBoundingClientRect();
					this.domWidth = rect.right - rect.left;
					this.domHeight = rect.bottom - rect.top;
			}

			function shoot(text,color) {
					var thedom = document.querySelector('.' + 'vjs-my-fancy-modal');
					let div = document.createElement('div');
					div.className = 'barrage';
					div.style.position = 'absolute';
					div.style.left = thedom.clientWidth + 'px';
					div.style.top = parseInt(Math.random()*22,10)*((thedom.clientHeight/23).toFixed(0))  + 'px';

					div.style.whiteSpace = 'nowrap';
					//div.style.color = '#' + Math.floor(Math.random() * 0xffffff).toString(16);
					div.style.color = color;
					div.style.fontSize = (thedom.clientHeight/23).toFixed(0) +'px';
					console.log(thedom.clientHeight);
					div.style.fontFamily = 'Arial,Verdana,Sans-serif';
					div.innerText = text;
					div.style.zIndex = 9999;
					//div.style.pointerEvents = 'none';
					//this.dom.appendChild(div);
					document.querySelector('.' + 'vjs-my-fancy-modal').appendChild(div);
					//$(."vjs-my-fancy-modal").append(div);
					let roll = (timer) => {
							let now = +new Date();
							roll.last = roll.last || now;
							roll.timer = roll.timer || timer;
							let left = div.offsetLeft;
							let rect = div.getBoundingClientRect();
							if (left < (rect.left - rect.right)) {
									document.querySelector('.' + 'vjs-my-fancy-modal').removeChild(div);
							} else {
									if (now - roll.last >= roll.timer) {
											roll.last = now;
											left -= 3;
											div.style.left = left + 'px';
									}
									requestAnimationFrame(roll);
							}
					}
					roll(50 * +(Math.random()*1.3).toFixed(2));
			}



	//setdiv('content');

	function appendList(text) {
			let p = document.createElement('p');
			p.innerText = text;
		//	document.querySelector('#content-text').appendChild(p);
	}
	<?php
	function ip() {
	    if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), 'unknown')) {
	        $ip = getenv('HTTP_CLIENT_IP');
	    } elseif(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), 'unknown')) {
	        $ip = getenv('HTTP_X_FORWARDED_FOR');
	    } elseif(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown')) {
	        $ip = getenv('REMOTE_ADDR');
	    } elseif(isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown')) {
	        $ip = $_SERVER['REMOTE_ADDR'];
	    }
	    return preg_match ( '/[\d\.]{7,15}/', $ip, $matches ) ? $matches [0] : '';
	}


	?>
@if($status == 1)

function Send (){
	let text = document.querySelector('#danmuinput').value;
	if(isl){
		if(text.trim()!='')
		{
			socket.send(JSON.stringify({
			type: 'chatMessage' //随便定义，用于在服务端区分消息类型
			,content: {
				mine: {
					id: "<?php if($username!=''&&$userid!=''){echo $userid;} else{echo $backid;}?>", //id
					username: "<?php if($username!=''&&$userid!=''){echo $username;} else{echo '未登录用户';}?>", //昵称
					avatar: "",  //头像
					content: text.trim() //内容

				}
				,to: {
					type: 'group',
					id: '{{$data->room_id}}'  //房间号

				}
			}
			}));
			//shoot("<?php if($username!=''&&$userid!=''){echo $username;} else{echo '未登录用户';}?>"+': '+text,"white");
				<?php
				if($username!=''&&$userid!='')
					{
						if($username == $data->name)
						{

							echo 'shoot("【房主】'.$username.'"+": "+text,"white");';

						}
						else
						{
							echo 'shoot("'.$username.'"+": "+text,"white");';
						}
					}
				else
				{
					echo 'shoot("未登录用户"+": "+text,"white");';
				}


				?>


		}
	}else{
		if(text.trim()!=''){
			shoot("请先登录，即可发送弹幕与其他观众交流","red");
		}
	}
	closeSendDialog();
}

var socket ;
socket = io.connect('server.onsigma.com:7000');




socket.on('connect', function(){
	//发送上线信息

	socket.send(JSON.stringify({
	type: 'reg' //随便定义，用于在服务端区分消息类型
	,content: {
		uid: "<?php if($username!=''&&$userid!=''){echo $userid;} else{echo $backid;}?>", //id
		uname: "<?php if($username!=''&&$userid!=''){echo $username;} else{echo '未登录用户';}?>", //昵称
		room: "{{$data->room_id}}",
		ip: '<?php echo ip();?>'
	}
	}));
});


//监听
socket.on('chatMessage', function(data){
	var obj = {
		username: data.username
		,avatar: data.avatar
		,id: data.id
		,type: data.type
		,content: data.content
		,toid : data.toid
	};

		if(isBarrageOpen){
			if(isBarrageall)
			{
				if(eval(obj).username == owner){
					shoot('【房主】'+eval(obj).username+': '+eval(obj).content,"white");
				}else{
					shoot(eval(obj).username+': '+eval(obj).content,"white");
				}
			}else{
				if(eval(obj).toid=="{{$data->room_id}}"){
						if(eval(obj).username == owner){
							shoot('【房主】'+eval(obj).username+': '+eval(obj).content,"red");
						}else{
									shoot(eval(obj).username+': '+eval(obj).content,"white");
						}
				}
			}
		}
});

//监听在线人数
socket.on('sum', function(data){
	var obj = {
		users: data.users
	};
	$(".vjs-olusers").find("span").not(".vjs-icon-placeholder").text("在线:"+eval(obj).users);
});

socket.on('addList', function(data){
	//发送上线信息
	console.log(data);
});


@endif




		</script>
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
