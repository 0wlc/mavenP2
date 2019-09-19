<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<title>登录页面</title>
<link rel="stylesheet"	type="text/css"	href="${_css }/sys_v1.0.css"/>
<script type="text/javascript" src="${_js }/com_checkUp.js"></script>
<style>
body{
	background: url(${_img }/2.jpg) no-repeat fixed 0 0;
	background-size: 100%;
}
</style>
<script>
	if(window.top != window.self){//如果当前页面不是顶层窗口的地址
		window.top.location = window.location; 
	}
</script>
</head>
<body>
<div class="lg_bg">
	<div class="login">
		<div class="lg_tit">
			<span>学生管理系统登录
			<span class="tit_en">Page</span>
			</span>
		</div>
		<div class="lg_err">${msg}</div>
		<s:form id="f" action="sys_login" namespace="/" method="post">
			<table align="center" width="100%">
				<tr>
					<td width="38%" align="right">用户名:</td>
					<td><input class="ipt" type="text" name="obj.username"/></td>
				</tr>
				<tr>
					<td align="right">密&nbsp;&nbsp;码:</td>
					<td><input class="ipt" type="password" name="obj.password"/></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input class="btn" type="submit" value="登录"/>
						<input class="btn" type="reset" value="重置"/>
						<input class="btn" type="button" value="注册" onclick="location.href='${_cxt }/common/register.jsp'"/>
					</td>
				</tr>
			</table>
		</s:form>
	</div>
</div>
<script>
	cinit(["obj.username:用户名","obj.password:密码"]);
</script>
</body>
</html>