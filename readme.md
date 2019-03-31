# 关于Numbcube 
Numbcube是一个集放映、互动、直播一体的综合系统，原本是小群体互动娱乐使用，后来不断附加需求，使得本系统不断完善，功能不断增加，越来越趋近于商业化模式，不再适用于朋友间的娱乐，所以已停止使用并把它开源出来，希望给有类似需求的朋友提供些思路。整个项目比较繁杂，使用的语言也较多，希望各位朋友包含。

### 主要功能
1. 官方后台自动推流放映影片
2. 用户自行推流直播
3. 弹幕聊天交流(类似时下热门直播平台)
4. 完整的财务系统(点播、购票等，充值模块已剥除，如需使用请自行嵌入支付平台)

### 发展过程
Numbcube这个项目经历了几次重生，最初开始于2015年，当时的名字叫ixibi,发展至今大概可以分为这五个阶段，中间还有细节升级便不再描述：
* Stage 1 (基础流媒体直播)- 采用FMS(Adobe Flash Media Server)作为流媒体服务器、官方Flash作为rtmp播放器，实现最简单的直播功能。
* Stage 2 (加入弹幕功能)- 依旧采用FMS作为流媒体服务器，但在之前基础上开发了FMS的通信功能，且修改编译了JWplayer播放器，实现了聊天以及弹幕功能。
* Stage 3 (重新开发)- 摒弃之前全部代码，重新开发，使用Nginx作为流服务器，videojs作为播放器。
* Stage 4 (web升级)- 采用Html5重写前端页面，二次开发videojs融入弹幕功能，采用socketio通信，nodejs作为后端弹幕服务器。
* Stage 5 (功能分化及自动化)- 直播系统分化为用户直播间和官方放映厅，用户直播间由用户自己推流，官方放映厅由用户点播硬盘，后台程序(也是使用nodejs)实时监控并推流，全程实现无人值守。

### 系统组成
* web前端：用户界面(基于Blade、Layui) 
* web后端：接口(基于laravel)
* 流服务器：核心服务器，所有流都推到该服务器(Nginx) 
* 后端监控及推流：监控放映厅场次，到时间自动推流(nodejs、FFmpeg) 
* 后端弹幕服务器：socketio通信服务器(nodejs) 
* 用户推流工具(非必须)：简化用户操作，一键调用FFmpeg推流(C#)

### 不足
1. 部分管理员界面未完成(如用户管理，审核直播间等)
2. 部分鉴权未完善(如拉流，用户推流，推流到cdn等)
3. 系统结构及部分代码编写时未考虑商业化特征，不够严谨，请未优化前不要商用
4. 系统可负载压力未达到商用规模(未严格测试)

# 快速使用
1. 部署Nginx：[Nginx-rtmp](https://github.com/KirosHan/nginx-rtmp-win32)(Windows rtmp版)你可以直接下载这个配置好了rtmp的nginx，也可以自己去[Nginx官网](http://nginx.org/)下载并配置好rtmp流，部署好之后用自带的串流拉流工具是否可正常运行
2. 部署Web：安装php7.0，mysql5.7，并导入sql数据，另外本系统web部分基于laravel，所以你要安装[composer](https://getcomposer.org/)请参看文档安装，配置好指向本系统web目录，尝试是否可以正常访问
3. 部署监控模块：详见[NumbCube-autoplay](https://github.com/KirosHan/NumbCube-autoplay)
4. 部署弹幕服务器模块：详见[NumbCube-barrageserver](https://github.com/KirosHan/NumbCube-barrageserver)
5. 短信模块配置：如果你使用阿里云短信服务，那么只需要修改`\config\alisms.php`和`\vendor\hyperbolaa⁩\alisms⁩\src⁩\config⁩config.php⁩`(不太记得这个需不需要改了)里面对应的信息就行了
6. 邮件模块配置：如果你用mailgun的话只需要修改(如没有请添加).env中的MAILGUN_SECRET`MAILGUN_DOMAIN=mail.onsigma.com
MAILGUN_SECRET=key-8d37afc543b18f5a1111111111111111`
7. (附加工具)一键推流工具Numbcube-pusher：本repository带了一个编译好的完整程序，如果你想重新编译请前往[NumbCube-pusher](https://github.com/KirosHan/NumbCube-pusher)

P.S.本系统默认管理员账号Kiros，密码123456
P.S.本系统所以模块可独立运行，不一定要安装在同一服务器上，只要保证互相之间http和rtmp通信成功即可，原系统运行于2台主机上。

# 流程描述
* 点映影片：用户登录后台在有余额的情况下可直接点播影片在指定时间播放(推流过程由后台自动完成)
* 观看影片：用户直接进入对应放映厅，登录并自动提示购票，购票后可直接观看
* 直播：用户在后台页面申请直播间，管理员审核通过后，用户即可在直播间设置界面设置直播间信息及获取推流地址，用户可自行选择推rtmp流工具，这里提供了一个C#编写调用ffmpeg推流的工具
* 观看直播：用户进入直播间即可直接观看


# 注意事项
由于之前numbcube域名配置了ssl证书，所有页面内所有链接都应为https，包括弹幕socketio和stream拉流地址，否则可能造成无法正常播放和发送接收弹幕


# 开发建议
* 如果服务面向全国，尽量使用cdn或云直播服务 
* 推流拉流链接尽量加入鉴权

# 数据库
数据库表：
* bill - 用户充值消费订单表
* ip_lock - 多次输错密码锁定表
* liveroom - 放映厅表
* movie - 影片表
* notice - 通知私信表
* numbcube_room - 直播间表
* numbcube_temp - 网站配置信息
* numbcube_ticket - 购票信息表
* scene - 场次表
* sms_temp - 手机验证码缓存表
* user_data 用户信息附加表

# 开源组件
* FFmpeg[https://github.com/FFmpeg/FFmpeg](https://github.com/FFmpeg/FFmpeg)
* videojs[https://github.com/videojs/videojs-contrib-hls](https://github.com/videojs/videojs-contrib-hls)
* html弹幕[https://github.com/bestvist/barrage-div](https://github.com/bestvist/barrage-div)
* 验证码[https://github.com/vicens/captcha](https://github.com/vicens/captcha)
* 阿里云短信[https://github.com/hyperbolaa/Alisms](https://github.com/hyperbolaa/Alisms)

# 开源协议
[Apache License 2.0](https://github.com/KirosHan/NumbCube/blob/master/LICENSE)
