<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>{{$roomname.'-'.$moviename}}-NumbCube</title>
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
<script type="text/javascript">
	$.backstretch("/style/images/bg/1.jpg");
</script>

<!-- functionality -->
<script type="text/javascript" src="/scripts/swfobject.js"></script>
    <script language="javascript">

		var queryParameters = new Array();
          var flashVars = "";
		var tag = "";
		var url = "";




        function initialise()
        {


			function getUrlParam( name )
			{
				  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
				  var regexS = "[\\?&]"+name+"=([^&#]*)";
				  var regex = new RegExp( regexS );
				  var results = regex.exec( window.location.href );
				  if( results == null )
						return "";
				  else
						return unescape( results[1] );
			}

			queryParameters['source'] = getUrlParam('source');
			queryParameters['type'] = getUrlParam('type');
			queryParameters['idx'] = getUrlParam('idx');

			if( queryParameters['source'] == "" )
				queryParameters['source'] = "rtmp://stream.numbcube.com/numblive/room0";

			if( queryParameters['type'] == "" )
				queryParameters['type'] = "live";

			if( queryParameters['idx'] == "" )
				queryParameters['idx'] = "2";

			flashVars += "&src=";
            flashVars += queryParameters['source'];

            flashVars += "&autoHideControlBar=";
            flashVars += unescape("true");

            flashVars += "&streamType=";
            flashVars += queryParameters['type'];

            flashVars += "&autoPlay=";
            flashVars += unescape("true");

		  flashVars += "&verbose=";
		  flashVars += "true";

            var soFlashVars = {
                src: queryParameters['source'],
			 streamType: queryParameters['type'],
                autoPlay: "true",
                controlBarAutoHide: "true",
                controlBarPosition: "bottom"
            };

 			tag = "&lt;object width='640' height='377' id='StrobeMediaPlayback' name='StrobeMediaPlayback' type='application/x-shockwave-flash' classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' &gt;&lt;param name='movie' value='swfs/StrobeMediaPlayback.swf' /&gt; &lt;param name='quality' value='high' /&gt; &lt;param name='bgcolor' value='#000000' /&gt; &lt;param name='allowfullscreen' value='true' /&gt; &lt;param name='flashvars' value= '"+
			flashVars+"'/&gt;&lt;embed src='swfs/StrobeMediaPlayback.swf' width='640' height='377' id='StrobeMediaPlayback' quality='high' bgcolor='#000000' name='StrobeMediaPlayback' allowfullscreen='true' pluginspage='http://www.adobe.com/go/getflashplayer'   flashvars='"+ flashVars +"' type='application/x-shockwave-flash'&gt; &lt;/embed&gt;&lt;/object&gt;";

		<!-- For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. -->
		var swfVersionStr = "10.3.0";
		<!-- To use express install, set to playerProductInstall.swf, otherwise the empty string. -->
		var xiSwfUrlStr = "swfs/playerProductInstall.swf";
		var params = {};
		params.quality = "high";
		params.bgcolor = "#000000";
		params.allowscriptaccess = "sameDomain";
		params.allowfullscreen = "true";
		var attributes = {};
		attributes.id = "StrobeMediaPlayback";
		attributes.name = "StrobeMediaPlayback";
		attributes.align = "middle";
		swfobject.embedSWF("swfs/StrobeMediaPlayback.swf", "flashContent", screen.availWidth*0.65, screen.availHeight*0.65, swfVersionStr, xiSwfUrlStr, soFlashVars, params, attributes);
		<!-- JavaScript enabled so display the flashContent div in case it is not replaced with a swf object. -->
		swfobject.createCSS("#flashContent", "display:block;text-align:left;");
        }

		function playStream()
		{
			var url = "source=" + document.getElementById('inputURL').value;
			var type;

			if(document.getElementById('vodCheckbox').checked==true)
				type="vod";
			else
				type="live";

			url += ("&type=" + type);

			document.getElementById('playBtn').href="videoplayer.html?" + url;

		}

		function checkbox(type)
		{
			if(type=="vod")
			{
				if(document.getElementById('liveCheckbox').checked==true)
				{
					document.getElementById('liveCheckbox').checked=false;
				}
			}
			if(type=="live")
			{
				if(document.getElementById('vodCheckbox').checked==true)
				{
					document.getElementById('vodCheckbox').checked=false;
				}
			}
		}

		initialise();

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
<div class="header-wrapper opacity">
	<div class="header">
		<!-- Begin Logo -->
		<div class="logo">
		    <a href="index.html">
				<img src="/style/images/logo.png" alt="" />
			</a>
	    </div>
		<!-- End Logo -->
		<!-- Begin Menu -->
		<div id="menu-wrapper">
			<div id="menu" class="menu">
				<ul id="tiny">
					<li><a href="/">首页</a>
					</li>
					<li><a href="#">放映厅</a>
						<ul>
							<li><a href="http://www.numbcube.com/live/room0">展示厅</a></li>


							<li><a href="http://www.numbcube.com/live/room1">1号厅</a></li>
							<li><a href="http://www.numbcube.com/live/room2">2号厅</a></li>
							<li><a href="http://www.numbcube.com/live/room3">3号厅</a></li>
							<li><a href="http://www.numbcube.com/live/room4">4号厅</a></li>
							<li><a href="http://www.numbcube.com/live/room5">5号厅</a></li>
							<li><a href="http://www.numbcube.com/live/roommax">大屏超清厅</a></li>
							<li><a href="http://www.numbcube.com/live/roompersonal">私人影院</a></li>
							<li><a href="http://www.numbcube.com/live/roomvip">VIP厅</a></li>

						</ul>
					</li>
					<li><a href="http://www.numbcube.com/scene">场次列表</a></li>
					@if($username!=''&&$userid!='')
					<li><a href="http://www.numbcube.com/member">购票</a></li>
					<li><a href="http://www.numbcube.com/member">{{$username}}</a></li>
					@else
					<li><a href="http://www.numbcube.com/member">登录</a></li>
					@endif

					<li><a href="mailto:kiros@onbeta.com">Contact</a></li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<!-- End Header -->

<!-- Begin Wrapper -->
<div class="wrapper"><!-- Begin Intro -->
	<div class="box">
		<h3>{{$roomname}} - 【{{$moviename}}】</h3>
		{{$roompub}}
		<hr />
	</div>
<div class="intro">
 <!--<div id="content" class="content"></div>-->
		<video
    id="player"
    class="video-js vjs-fluid"
    controls
    preload="auto"
    poster="//vjs.zencdn.net/v/oceans.png"
    data-setup='{}'>
  <source src="{{$roomurl.$roomstream}}.m3u8" type="application/x-mpegURL"></source>

</video>

</div>
<div style="clear:both;"></div>

<div class="box">
	<h4>简介</h4>
	<hr />
	<strong>内容简介:</strong>{{$movieintro}}
	<hr />
	<strong>类型:</strong>{{$movietype}}
	<hr />
	<strong>年代:</strong>{{$movieyears}}
	<hr />
	<strong>产地:</strong></strong>{{$movieorigin}}
	<hr />
	<strong>导演:</strong>{{$moviedirector}}
	<hr />
	<strong>演员:</strong>{{$movieactor}}
	<hr />

</div>
	<!--
<div id="flashContent" style="width:96%;height:54%;">
</style>>
	<p>To view this page ensure that Adobe Flash Player version 10.3.0 or greater is installed.</p>
<script type="text/javascript">
var pageHost = ((document.location.protocol == "https:") ? "https://" :	"http://");
document.write("<a href='http://www.adobe.com/go/getflashplayer'><img src='"
				+ pageHost + "www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a>" );
</script>
</div>
<noscript>
<a href="http://www.adobe.com/go/getflashplayer/" style="color:black"><img src="images/ERROR_getFlashPlayer.gif" width="640" height="377" /></a>

</noscript>
-->
<!-- Begin Blog Grid -->
<div class="blog-wrap">
	<!-- Begin Blog -->
	<div class="blog-grid">



		<!-- Begin Quote Format -->
		<div class="post format-quote box">
			<h2 class="title"><a href="#">Html5播放器试用通知</a></h2>
			<blockquote>为提供更好的观看体验，Numbcube整站播放器已由Flash播放器替换为Html5播放器，如有任何bug欢迎及时反馈。<cite>Kiros</cite></blockquote>
			<div class="details">
				<span class="icon-standard"><a href="#">Dec 13, 2018</a></span>

			</div>

		</div>
		<!-- End Quote Format -->

		<!-- Begin Quote Format -->
		<div class="post format-quote box">
			<h2 class="title"><a href="#">Numbcube直播重启</a></h2>
			<blockquote>Numbcube后端服务已更换内核重新上线，目前测试中。<cite>Kiros</cite></blockquote>
			<div class="details">
				<span class="icon-standard"><a href="#">Dec 10, 2018</a></span>

			</div>

		</div>
		<!-- End Quote Format -->




 		<!-- Begin Standard Format -->
 		<div class="post format-standard box">

			<h2 class="title"><a href="#">Numbcube测试中</a></h2>
			<p>欢迎反馈任何bug</p>
	<p></p>

			<div class="details">
				<span class="icon-standard"><a href="#">Dec 12, 2018</a></span>

			</div>

		</div>
		<!-- End Standard Format -->





		<!-- Begin Chat Format -->
		<div class="post format-chat box">
			<h2 class="title">Kiros</h2>
			<ul>
				<li><strong>Email:</strong> kiros@onbeta.com</li>
				<li><strong>QQ:</strong> 3920277</li>

			</ul>

			<div class="details">
				<span class="icon-standard"><a href="#">Dec 9, 2018</a></span>

			</div>

		</div>
		<!-- End Chat Format -->

 	</div>
	<!-- End Blog -->
</div>
<!-- End Blog Grid -->

<!-- Begin Page-navi -->

    <!-- End Page-navi -->

</div>
<!-- End Wrapper -->

<!-- Begin Footer -->
<div class="footer-wrapper">
<div id="footer" class="four">
		<div id="first" class="widget-area">

			<div class="widget widget_archive">
				<h3 class="widget-title">Links</h3>
				<ul>
					<li><a href="http://www.numbcube.com">numbcube</a></li>
					<li><a href="http://www.onbeta.com">Onbeta代码实验室</a></li>
					<li><a href="http://www.deercube.com">Deercube</a></li>
					<li><a href="http://www.onsigma.com">ONSIGMA</a></li>
				</ul>
			</div>
		</div><!-- #first .widget-area -->

		<div id="second" class="widget-area">

		</div><!-- #second .widget-area -->

		<div id="third" class="widget-area">
		<div id="example-widget-3" class="widget example">
			<h3 class="widget-title">Posts</h3>
			<ul class="post-list">
			  	<li>
			  		<div class="frame">
			  			<a href="#"><img src="/style/images/post.jpg" /></a>
			  		</div>
					<div class="meta">
					    <h6><a href="http://www.foxplus.io">Foxplus</a></h6>
					    <em>www.foxplus.io</em>
				    </div>
				</li>

			</ul>

		</div>
		</div><!-- #third .widget-area -->

		<div id="fourth" class="widget-area">
		<div class="widget">
			<h3 class="widget-title">Social</h3>
			<ul class="post-feed">
				<li><a href="https://github.com/KirosHan">Github</a></li>

			</ul>
		</div>
		</div><!-- #fourth .widget-area -->
	</div>
</div>
<div class="site-generator-wrapper">
	<div class="site-generator">&copy; Copyright &copy; 2018.Onbeta代码实验室 All rights reserved.<a href="http://www.onbeta.com" target="_blank">ONBETA</a></div>
</div>
<!-- End Footer -->
<script type="text/javascript" src="/style/js/scripts.js"></script>
<script type="text/javascript">
				var isl =@if($username!=''&&$userid!='')true;
				@else false;
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
						//shoot("testtest测试测试","white");

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
					roll(50 * +Math.random().toFixed(2));
			}



	//setdiv('content');

	function appendList(text) {
			let p = document.createElement('p');
			p.innerText = text;
		//	document.querySelector('#content-text').appendChild(p);
	}


function Send (){
	let text = document.querySelector('#danmuinput').value;
	if(true){
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
					id: '{{$roomid}}'  //房间号

				}
			}
			}));
			shoot("<?php if($username!=''&&$userid!=''){echo $username;} else{echo '未登录用户';}?>"+': '+text,"white");
		}
	}else{
		if(text.trim()!=''){
			shoot("请先登录，即可发送弹幕与其他观众交流","red");
		}
	}
	closeSendDialog();


}

var socket ;
socket = io.connect('http://server.onsigma.com:7000');


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
socket.on('connect', function(){
	//发送上线信息

	socket.send(JSON.stringify({
	type: 'reg' //随便定义，用于在服务端区分消息类型
	,content: {
		uid: "<?php if($username!=''&&$userid!=''){echo $userid;} else{echo $backid;}?>", //id
		uname: "<?php if($username!=''&&$userid!=''){echo $username;} else{echo '未登录用户';}?>", //昵称
		room: "{{$roomid}}",
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
				shoot(eval(obj).username+': '+eval(obj).content,"white");
			}else{
				if(eval(obj).toid=="{{$roomid}}"){
									shoot(eval(obj).username+': '+eval(obj).content,"white");
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






		</script>
</body>
</html>
