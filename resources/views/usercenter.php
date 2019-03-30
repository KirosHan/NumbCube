

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>NumbCube观影中心</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="layui/css/layui.css" media="all">
  <script>
  /^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
  </script>
</head>
<body>
  <div id="LAY_app"></div>
  <script src="/layui/layui.js"></script>
  <script>
  layui.config({
    base: '../dist/' //指定 layuiAdmin 项目路径，本地开发用 src，线上用 dist
    ,version: '1.2.1Beta'//new Date().getTime()
  }).use('index');
  </script>


  <!-- Matomo -->
  <script type="text/javascript">
    var _paq = _paq || [];
    /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
    _paq.push(['trackPageView']);
    _paq.push(['enableLinkTracking']);
    (function() {
      var u="//webdata.onsigma.com/";
      _paq.push(['setTrackerUrl', u+'piwik.php']);
      _paq.push(['setSiteId', '6']);
      var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
      g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
    })();
  </script>
  <!-- End Matomo Code -->
    <!-- Baidu Code -->
  <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?f9807f4b65d79122e44c83adea5577db";
  var s = document.getElementsByTagName("script")[0];
  s.parentNode.insertBefore(hm, s);
})();
</script>
  <!-- End Baidu Code -->


</body>
</html>
