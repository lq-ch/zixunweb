<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="changong, chuanwang, sina" />
    <meta name="description" content="Sichuan ChangHong JiShuZhongXin" />
    <meta name="author" content="Li.Qiang" />
    <meta name="copyright" content="Copyright 2012~2013" />
    <title>新疆广电网络资讯</title>
    <link rel="stylesheet" href="css/normalize.css" />
    <style type="text/css">
*{margin:0px;padding:0px}
body{position:absolute;background:no-repeat;background-image:url(image/new_bg2.jpg);width:1280px;height:706px;overflow-y:hidden;overflow-x:hidden}
#header{width:1280px;height:116px}
#header div{float:left}
#main{width:1280px;height:536px;padding:0px;margin:0px}
#main ul{padding-top:30px;padding-left:100px}
#main ul li{float:left;width:230px;list-style:none;text-align:center;height:160px}
#main li a{height:129px; width:129px; display:block}
#main li a:hover{border:solid 15px #FFCC00}
#footer{width:1280px;height:28px}
#footer .page{position:absolute;padding-left:1000px;top:660px}
.footer .page{position:absolute;top:660px}
#btn{position:absolute;left:1080px;}
.page span a{margin-top:10px;border:0px solid #1E1E1E;display:block;background:url("image/exit.png");}
.page span a:hover{border:15px solid #FC0;display:block;background:url("image/exit_focus.png");}
    </style>
</head>
<body>
<div id="header">
</div>
<div id="main">
	<ul>
		<li><a href="content_list.jsp?classid=1&pageid=1"><img src="image/redian.jpg" style="z-index:1;"/></a></li>
		<li><a href="content_list.jsp?classid=2"><img src="image/guonei.jpg"/></a></li>
		<li><a href="content_list.jsp?classid=4"><img src="image/guoji.jpg"/></a></li>
		<li><a href="content_list.jsp?classid=10"><img src="image/junshi.jpg"/></a></li>
		<li><a href="content_list.jsp?classid=15"><img src="image/jiankang.jpg"/></a></li>
	</ul>
	<ul>
		<li><a href="content_list.jsp??classid=9"><img src="image/caijing.jpg"/></a></li>
		<li><a href="content_list.jsp?classid=7"><img src="image/yule.jpg"/></a></li>
		<li><a href="content_list.jsp?classid=13"><img src="image/shishang.jpg"/></a></li>
		<li><a href="content_list.jsp?classid=6"><img src="image/tiyu.jpg"/></a></li>
		<li><a href="content_list.jsp?classid=5"><img src="image/shehui.jpg"/></a></li>
	</ul>
	<ul>
		<li><a href="content_list.jsp?classid=11"><img src="image/wenhua.jpg"/></a></li>
		<li><a href="content_list.jsp?classid=21"><img src="image/fangchan.jpg"/></a></li>
		<li><a href="content_list.jsp?classid=12"><img src="image/qiche.jpg"/></a></li>
		<li><a href="content_list.jsp?classid=8"><img src="image/keji.jpg"/></a></li>
		<li><a href="content_list.jsp?classid=14"><img src="image/shuma.jpg"/></a></li>
	</ul>
</div>
<div id="footer">
    <div class="page">
      <span id="btn"><a id="exit" href="ui://index.htm" style="width:100px;height:40px;"></a></span>
    </div>
</div>
<script type="text/javascript">
window.onload = function(){ 
   document.onkeydown=function(event){
	 switch(event.keyCode){
	    case 48://back
	    	window.location.href="ui://index.htm"; 
			break;
	 }
	}
}

function isfocus(){
	alert("11");
	var exit=getElementById("exitimg");
	exit.style.src="image/exit_focus.png";
}
</script>
</body>
</html>