<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="portal.query.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String classid = request.getParameter("classid");
String pageid = request.getParameter("pageid");
if(pageid==null){
	pageid="1";
}
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

GetNewsList myCatalog=new GetNewsList();
ArrayList<NewsList> newslist = myCatalog.getNewsList(classid, pageid);
int vk_1 = newslist.get(0).getNewsid();
int vk_2 = newslist.get(1).getNewsid();
int vk_3 = newslist.get(2).getNewsid();
int vk_4 = newslist.get(3).getNewsid();
int vk_5 = newslist.get(4).getNewsid();
int vk_6 = newslist.get(5).getNewsid();
int vk_7 = newslist.get(6).getNewsid();
int vk_8 = newslist.get(7).getNewsid();
int vk_9 = newslist.get(8).getNewsid();
String nextPageId=String.valueOf(myCatalog.pagenextnumber(classid,pageid));
String beforPageId=String.valueOf(myCatalog.pageupnumber(classid,pageid));
//ArrayList<GetNewsList.NewsList> getList=myCatalog.getNewsList(classid,pageid,"0");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>川网网络资讯</title>
<link rel="stylesheet" href="css/normalize.css" />
<style type="text/css">
*{margin:0px;padding:0px}
a:focus{outline:none;-moz-outline:none}
body{position:absolute;background:no-repeat;background-image:url(image/new_bg3.jpg);width:1280px;height:706px;overflow-y:hidden;overflow-x:hidden;font-family:SimHei}
#header{width:1280px;height:96px}
.header_banner{position:absolute;left:960px;top:60px;width:190px;font-weight:bolder;font-size:32px;color:#FFF}
#header div{float:left;}
.main{float:left;height:476px;padding:40px 100px;}
.main ul{border:0px solid #059CF9;width:1080px;height:456px}
.main ul li{line-height:51px;color:#FFFFFF;list-style:none;text-align:left;font-size:33px;padding-left:20px;}
.main ul li a{color:#FFF;display:block;}
.main ul li .time{font-size:18px;text-decoration:none;margin-right:35px;float:right;font-style:normal;font-family:SimHei}
.main ul li a:hover{font-weight:400;font-size:33px;background-color:#FF0;display:block;}

.footer .page{position:absolute;top:660px}
#btn1{position:absolute;left:750px;z-index:1}
#btn2{position:absolute;left:890px;z-index:2}
#btn3{position:absolute;left:1030px;z-index:3}
.page span a{border:0px solid #1E1E1E;display:block}
.page span a:hover{border:4px solid #FC0;display:block}
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
	<ul id="total"><% 
		for(int i=0;i<newslist.size();i++){
			int newsid=newslist.get(i).getNewsid();
	%><li><a href="content.jsp?newsid=<%=newsid%>&classid=<%=classid%>&pageid=<%=pageid%>" onclick="javascript:addCookie(<%=newsid%>);">
			<span style="width:25px;float:left;"><%=i+1%>.</span></a><span style="width:775px;display:inline-block;"><%=newslist.get(i).getTitle()%></span>
			<span class="time"><%=newslist.get(i).getNewsdate()%></span>
			<span id=<%=i%> style="margin-right:5px;float:right;color:#FC0;font-size:12px;visibility:hidden;">已读</span>
	   </li>
	<%}
	%>
	</ul>

<div class="footer">
	<div class="page">
		<span id="btn1"><a id="next" href="content_list.jsp?classid=<%=classid%>&pageid=<%=myCatalog.pagenextnumber(classid,pageid)%>"><img src="image/btn_next.jpg" /></a></span>
		<span id="btn2"><a id="before" href="content_list.jsp?classid=<%=classid%>&pageid=<%=myCatalog.pageupnumber(classid,pageid)%>"><img src="image/btn_back.jpg" /></a></span>
		<span id="btn3"><a id="back" href="index.jsp"><img src="image/btn_return.jpg" /></a></span>
	</div>
</div>
<script type="text/javascript">
window.onload = function(){     
            
	var nextPageIdJs   = <%="'"+nextPageId+"'"%>;
	var beforePageIdJs = <%="'"+beforPageId+"'"%>;
	var classIdJs      = <%="'"+classid+"'"%>;
	var pageIdJs       = <%="'"+pageid+"'"%>;
	var vk_1Js         = <%="'"+vk_1+"'"%>;
	var vk_2Js         = <%="'"+vk_2+"'"%>;
	var vk_3Js         = <%="'"+vk_3+"'"%>;
	var vk_4Js         = <%="'"+vk_4+"'"%>;
	var vk_5Js         = <%="'"+vk_5+"'"%>;
	var vk_6Js         = <%="'"+vk_6+"'"%>;
	var vk_7Js         = <%="'"+vk_7+"'"%>;
	var vk_8Js         = <%="'"+vk_8+"'"%>;
	var vk_9Js         = <%="'"+vk_9+"'"%>;
	
	if(getCookie(vk_1Js)){
		setAlreadyRead(0);
	}
	if(getCookie(vk_2Js)){
	    setAlreadyRead(1);
	}
	if(getCookie(vk_3Js)){
		setAlreadyRead(2);
	}
	if(getCookie(vk_4Js)){
	   setAlreadyRead(3);
	}
    if(getCookie(vk_5Js)){
	    setAlreadyRead(4);
	}
	if(getCookie(vk_6Js)){
	    setAlreadyRead(5);
	}
	if(getCookie(vk_7Js)){
	    setAlreadyRead(6);
	}
	if(getCookie(vk_8Js)){
	    setAlreadyRead(7);
	}
	if(getCookie(vk_9Js)){
	    setAlreadyRead(8);
	}
	
	
	
	document.onkeydown=function(event){
	 switch(event.keyCode){
	    case 48://back
	    	window.location.href="index.jsp"; 
			break;
		case 372://left
			window.location.href="content_list.jsp?classid="+classIdJs+"&pageid="+beforePageIdJs; 
			break;
		case 373://right
			window.location.href="content_list.jsp?classid="+classIdJs+"&pageid="+nextPageIdJs; 
			break;
		case 49:
		    addCookie(vk_1Js);
			window.location.href="content.jsp?newsid="+vk_1Js+"&classid=" + classIdJs + "&pageid=" + pageIdJs;
			break;
		case 50:
		    addCookie(vk_2Js);
			window.location.href="content.jsp?newsid="+vk_2Js+"&classid=" + classIdJs + "&pageid=" + pageIdJs;
			break;
		case 51:
		    addCookie(vk_3Js);
			window.location.href="content.jsp?newsid="+vk_3Js+"&classid=" + classIdJs + "&pageid=" + pageIdJs;
			break;
		case 52:
		    addCookie(vk_4Js);
			window.location.href="content.jsp?newsid="+vk_4Js+"&classid=" + classIdJs + "&pageid=" + pageIdJs;
			break;
		case 53:
		    addCookie(vk_5Js);
			window.location.href="content.jsp?newsid="+vk_5Js+"&classid=" + classIdJs + "&pageid=" + pageIdJs;
			break;
		case 54:
		    addCookie(vk_6Js);
			window.location.href="content.jsp?newsid="+vk_6Js+"&classid=" + classIdJs + "&pageid=" + pageIdJs;
			break;
		case 55:
		    addCookie(vk_7Js);
			window.location.href="content.jsp?newsid="+vk_7Js+"&classid=" + classIdJs + "&pageid=" + pageIdJs;
			break;
		case 56:
		    addCookie(vk_8Js);
			window.location.href="content.jsp?newsid="+vk_8Js+"&classid=" + classIdJs + "&pageid=" + pageIdJs;
			break;
		case 57:
		    addCookie(vk_9Js);
			window.location.href="content.jsp?newsid="+vk_9Js+"&classid=" + classIdJs + "&pageid=" + pageIdJs;
			break; 
		case 37:
	    case 39:
             var key = document.activeElement.id;
             if(key.length<3)
             document.getElementById("next").focus();
			break;

	  }
    };
};
</script>
</body>
</html>