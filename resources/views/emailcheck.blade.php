<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>邮件验证...</title>

        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Raleway', sans-serif;
                font-weight: 100;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }
            .result {
                font-size: 28px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 12px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <div class="flex-center position-ref full-height">
                <div class="top-right links">
                        <a href="http://member.onsigma.com">Home</a>
                </div>

            <div class="content">
                <div class="title m-b-md">
                    ONSIGMA
                </div>
                <div class="result m-b-md">
                  邮件验证{{$result}}
                  @if ($result === "成功")
                  ，正在跳转中...  <a href="http://member.onsigma.com">手动跳转</a>
                  @else
                  ，请重新验证...
                  @endif
                </div>

                <div class="links">
                    <a href="http://www.onsigma.com">onsigma</a>
                    <a href="http://www.onbeta.com">onbeta</a>
                    <a href="http://www.foxplus.io">foxplus</a>
                    <a href="http://www.fatefox.com">fatefox</a>
                    <a href="http://www.iceagedata.com">iceagedata</a>
                </div>
            </div>
        </div>
@if ($result === "成功")
        <script>
          setTimeout("javascript:location.href='http://member.onsigma.com'", 5000);
        </script>
@endif
    </body>
</html>
