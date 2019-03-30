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
							<li><a href="/movie/room0">展示厅</a></li>


							<li><a href="/movie/room1">1号厅</a></li>
							<li><a href="/movie/room2">2号厅</a></li>
							<li><a href="/movie/room3">3号厅</a></li>
							<li><a href="/movie/room4">4号厅</a></li>
							<li><a href="/movie/room5">5号厅</a></li>
							<li><a href="/movie/roommax">大屏超清厅</a></li>
							<li><a href="/movie/roompersonal">私人影院</a></li>
							<li><a href="/movie/roomvip">VIP厅</a></li>

						</ul>
					</li>
					<li><a href="#">直播间</a>
						<ul>
							@if(!$livedatas->isEmpty())
								@foreach ($livedatas as $data)
								<li><a href="/live/{{$data->room_id}}">{{$data->name}}-{{$data->room_title}}</a></li>

								@endforeach
							@else
								<li><a href="#">当前无直播</a></li>
							@endif

						</ul>
					</li>
					<li><a href="/scene">场次列表</a></li>
					@if($username!=''&&$userid!='')
					<li><a id='membercenter' href="#">{{$username}}</a></li>
					<li><a href="/member" >会员中心</a></li>
					@else
					<li><a id='toindex' href="#">快捷登录</a></li>
					<li><a href="/member">登录</a></li>
					@endif

					<li><a href="mailto:kiros@onbeta.com">Contact</a></li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
