<?php
return [
	'yun'=>[//阿里云短信
		'access_key_id'        => 'L11111111111111',//
		'access_key_secret'    => '111111111111111111',//
		'common_sign_name'     => 'ONSIGMA',//普通模板签名
		'spread_sign_name'     => 'ONSIGMA',//推广模板签名
		'template_code'        => [
			'register' => 'SMS_135000002',//模板code让一个变量来替换
		]
	],
	'api'=>[//云市场短信
		'api_app_key'           => '',//
		'api_app_secret'        => '',//
		'api_sign_name'         => '',//普通模板签名
		'api_template_code'     => [
			'register' => 'SMS_35650882',//模板code让一个变量来替换
		]
	],
	'note'=>[//短信发送API
		'access_key_id'        => '111111111111111111',//
		'access_key_secret'    => '111111111111111111',//
		'common_sign_name'     => 'ONSIGMA',//普通模板签名
		'template_code'        => [
			'register' => 'SMS_135000002',//模板code让一个变量来替换
		],
		'enable_http_proxy'     => false,//是否开始代理
		'http_proxy_ip'         => '127.0.0.1',
		'http_proxy_port'       => '8888'
	]
];
