<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"	type="text/css"	href="${_css }/sys_v1.0.css"/>
<link rel="stylesheet" type="text/css" href="${_css }/sys_ifm.css"/>
<script>
var timer = self.setInterval("get_tim()", 1000);

function get_tim(){
	var time = document.getElementById("g_tim");
	var arrt = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
	var t = new Date();
	var y = t.getFullYear();
	var m = t.getMonth()+1;
	var d = t.getDate();
	var h = t.getHours();
	var min = t.getMinutes();
	var s = t.getSeconds();
	var dy = arrt[t.getDay()];
	time.innerHTML = y + "年" + m + "月" + d + "日 " + h + "时" + min + "分" + s + "秒  " + dy;
}
</script>
</head>
<body onload="get_tim()">
	<div class="tit">
		<span class="tit_en">${_title }</span>
	</div>
	<div class="atime">
		<span id="g_tim"></span>
		当前用户:
		<span style="color:orangered;">${sessionScope.user.name}</span>
		<a class="quit" href="${_cxt }/sys_logout.do" target="_top" onclick="return confirm('是否退出?')">退出系统</a>
	</div>
</body>
</html>