<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="portal.query.GetNewsbyID,portal.query.NewsInfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String classid = request.getParameter("classid");
String pageid = request.getParameter("pageid");
String classcontent ="新闻要闻";
if(classid ==null){
	classid="1";
}

if(classid.equals("1")) classcontent ="热点关注";
if(classid.equals("2")) classcontent ="国内新闻";
if(classid.equals("4")) classcontent ="国际新闻";
if(classid.equals("10")) classcontent ="军事资讯";
if(classid.equals("15")) classcontent ="健康资讯";
if(classid.equals("9")) classcontent ="财经资讯";
if(classid.equals("7")) classcontent ="娱乐资讯";
if(classid.equals("13")) classcontent ="时尚生活";
if(classid.equals("6")) classcontent ="体育新闻";
if(classid.equals("5")) classcontent ="社会万象";
if(classid.equals("11")) classcontent ="文化教育";
if(classid.equals("21")) classcontent ="房产家居";
if(classid.equals("12")) classcontent ="汽车资讯";
if(classid.equals("8")) classcontent ="科技资讯";
if(classid.equals("14")) classcontent ="数码家电";

GetNewsbyID gn  = new GetNewsbyID();
String newsid   = request.getParameter("newsid");
int id          = Integer.parseInt(newsid);
NewsInfo news   = gn.getNews(id);
String nextId   = String.valueOf(gn.getnextid(classid,id));
String beforeId = String.valueOf(gn.getupid(classid,id));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=news.getTitle() %></title>
<link rel="stylesheet" href="css/normalize.css" />
<style type="text/css">
*{margin:0px;padding:0px}
a:focus{outline:none;-moz-outline:none}
body{position:absolute;background:no-repeat;background-image:url(image/new_bg3.jpg);width:1280px;height:706px;top:0px;left:0px;overflow-y:hidden;overflow-x:hidden;font-family:SimHei;font-size:30px;color:#FFF}
.header_banner{position:absolute;left:960px;top:60px;width:190px;font-weight:bolder;font-size:32px}
.main{position:absolute;font-family:SimHei;top:130px;left:100px;text-align:center}
.main .ul{border:0px solid #059CF9;width:1080px;color:#fff;overflow:hidden;margin:1px}
.ul .title{font-size:32px;line-height:48px}
.ul .sub{font-size:20px;line-height:30px}
.ul .txt{width:1060px;height:373px;text-align:left;text-indent:2em;font-size:26px;line-height:39px;padding:10px}
#imageshow{height:312px;max-height:313px}
#imagecontainer{text-align:center;max-height:313px}
#imagecontainer img{height:312px;max-height:313px}
#imagetitle{text-align:center}
.page{position:absolute;top:660px}
#btn1{position:absolute;left:800px;z-index:1}
#btn2{position:absolute;left:940px;z-index:2}
#btn3{position:absolute;left:1080px;z-index:3}
.page span a{border:0px solid #1E1E1E;display:block}
.page span a:hover{border:4px solid #FC0;display:block}
.footer .end{position:relative;top:0px}
.footer .end a{height:10px;width:10px;display:block}
</style>
<script type="text/javascript" src="js/focusEvent.js"></script>
</head>
<body>
<div id="header">
	<div class="header_banner">
		<span class="banner_icon"><img src="image/option.png" /></span>
		<span class="banner_txt"><%=classcontent%></span>
	</div>
</div>
<div class="main">
	<div class="ul" id="frameContent" style="height:480px; overflow: hidden;">
		<p class="title"><%=news.getTitle() %></p>
		<p class="sub"><%=news.getPublishtime() %> 来源：<%=news.getOrigin() %></p>
		<div class="txt">
			<%=news.getImageLink() %>
			<%=news.getImageTitle() %>
			<%=news.getContext() %>
		</div>
	</div>
</div>
<div class="page">
	<span id="btn1"><a id="next" href="content.jsp?newsid=<%=nextId%>&classid=<%=classid%>&pageid=<%=pageid%>"><img src="image/txt_next.jpg" /></a></span>
	<span id="btn2"><a id="before" href="content.jsp?newsid=<%=beforeId%>&classid=<%=classid%>&pageid=<%=pageid%>"><img src="image/txt_before.jpg" /></a></span>
	<span id="btn3"><a id="back" href="content_list.jsp?classid=<%=classid%>&pageid=<%=pageid%>"><img src="image/btn_return.jpg" /></a></span>
</div>
<div class="footer">
	<div class="end"></div>
	<div class="arrow"></div>  
</div>  
<script type="text/javascript">
var nextPageIdJs   = <%="'"+nextId+"'"%>;
var beforePageIdJs = <%="'"+beforeId+"'"%>;
var classIdJs      = <%="'"+classid+"'"%>;
var pageIdJs       = <%="'"+pageid+"'"%>;
var newIdJs = <%="'"+newsid+"'"%>;
var obj = document.getElementById("frameContent");  //获取内容层
var pages = document.getElementById("pages");       //获取翻页层
var imageContent = document.getElementById("imagecontainer");
var pgindex=1; 
var allpages=1;
window.onload = function(){                   //重写窗体加载的事件
	
	allpages = Math.ceil(parseInt(obj.scrollHeight)/parseInt(obj.offsetHeight));//获取页面数量 
	if(allpages==1) {
	  allpages=10; 
	}
	
	addCookie(newIdJs);
	document.onkeydown=function(event){
		switch(event.keyCode){
		case 1:gotopage(-1);//up
			break;
		case 2:gotopage(1);//down
			break;
		case 372://left
			addCookie(beforePageIdJs);
			window.location.href="content.jsp?newsid="+beforePageIdJs+"&classid=" + classIdJs + "&pageid=" + pageIdJs;
			break;
		case 373://right
		    addCookie(nextPageIdJs);
			window.location.href="content.jsp?newsid="+nextPageIdJs+"&classid=" + classIdJs + "&pageid=" + pageIdJs;
			break;
		case 48://back
			window.location.href="content_list.jsp?classid="+classIdJs+"&pageid="+pageIdJs;
		    break;
		}
	};
};

 //控制文字滚动
        function addEventSimple(obj, evt, fn) {
            if (obj.addEventListener) {
                obj.addEventListener(evt, fn, false);
            } else if (obj.attachEvent) {
                obj.attachEvent('on' + evt, fn);
            }
        }
        addEventSimple(window, 'load', initScrolling);
        var scrollingBox;
        var scrollingInterval;
        var reachedBottom = false;
        var bottom;
        function initScrolling() {
            scrollingBox = document.getElementById('frameContent');
            scrollingBox.style.overflow = "hidden";
            scrollingInterval = setInterval("scrolling()", 100);
            scrollingBox.onmouseover = over;
            scrollingBox.onmouseout = out;
        }
        function scrolling() {
            
            var origin = scrollingBox.scrollTop;
            scrollingBox.scrollTop = scrollingBox.scrollTop + 10;
            if (origin == scrollingBox.scrollTop) {
                if (!reachedBottom) {
                    scrollingBox.innerHTML += scrollingBox.innerHTML;
                    reachedBottom = true;
                    bottom = origin;
                } else {
                    scrollingBox.scrollTop = bottom;
                }
            }
        }
        function over() {
            clearInterval(scrollingInterval);
        }
        function out() {
            scrollingInterval = setInterval("scrolling()", 100);
        }

function gotopage(value){
	try{
		value==-1?showPage(pgindex-1):showPage(pgindex+1);
	}catch(e){
	}
}

function showPage(pageINdex){ 
	pgindex=pageINdex;
	if(pageINdex>=allpages){
		pgindex=allpages;
	}
	if(pageINdex<=1){ 
		pgindex=1;
		if(null!=imageContent) imageContent.style.visibility="visible";
	}else{
		if(null!=imageContent) imageContent.style.visibility="hidden";
	}
	
	obj.scrollTop=(pgindex-1)*parseInt(obj.offsetHeight);
}
</script>

</body>
</html>