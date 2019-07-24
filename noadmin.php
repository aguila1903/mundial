<?php
session_start();
header("Cache-Control: no-cache, must-revalidate");
$host = (htmlspecialchars($_SERVER["HTTP_HOST"]));
$uri = rtrim(dirname(htmlspecialchars($_SERVER["PHP_SELF"])), "/\\");

?>

<html>
  <head>
    <title>FUTBOL MUNDIAL</title>    
  </head>
  <body onload="preload()" vlink="#0000FF" class="noadmin_nm" id="noadmin">
    <script type="text/javascript" src="login.js"></script>
    <div id="Panel1" style="background:url('bilder/Panel1_nm.gif') no-repeat transparent; width:1368px; height:794px; position:absolute; overflow:hidden; top:0px; left:0px; right:0px; margin-left:auto; margin-right:auto; ">
     
      <div id="titel" style="background:url('bilder/titel_nm.png') no-repeat transparent; filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=bilder/titel_nm.png,sizingmethod=crop); background:expression('none'); width:1368px; height:129px; position:absolute; overflow:hidden; top:0px; left:0px; "></div>
      <div id="Label1" style="background:url('bilder/Label1_nm.png') no-repeat transparent; filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src=bilder/Label1_nm.png,sizingmethod=crop); background:expression('none'); width:1368px; height:59px; position:absolute; overflow:hidden; top:200px; left:0px; "></div>
    </div>
  </body>
</html>
