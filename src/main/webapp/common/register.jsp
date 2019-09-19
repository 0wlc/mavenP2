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
	background: url(${_img }/3.jpg) no-repeat fixed 0 0;
	background-size: 100%;
}
</style>
</head>
<body>
<div class="rg_bg">
	<div class="regst">
		<div class="lg_tit">
			<span>学生管理系统注册
			<span class="tit_en">Page</span>
			</span>
		</div>
		<s:form id="f" action="sys_register" namespace="/" method="post">
			<table align="center" width="100%">
				<tr>
					<td width="38%" align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
					<td><input class="ipt" type="text" name="obj.name"/></td>
				</tr>
				<tr>
					<td align="right">用&nbsp;户&nbsp;名:</td>
					<td><input class="ipt" type="text" name="obj.username"/></td>
				</tr>
				<tr>
					<td align="right">性&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
					<td>
						<select class="ipt" name="obj.sex">
							<option value="1">男</option>
							<option value="2">女</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
					<td><input class="ipt" type="password" name="obj.password"/></td>
				</tr>
				<tr>
					<td align="right">确认密码:</td>
					<td><input class="ipt" type="password" name="repassword"/></td>
				</tr>
				<tr>
					<td align="right">出生日期:</td>
					<td><input class="ipt" type="text" name="obj.birthday"/></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input class="btn" type="submit" value="注册"/>
						<input class="btn" type="reset" value="重置"/>
						<input class="btn" type="button" value="返回" onclick="location.href='${_cxt}/common/login.jsp'"/>
					</td>
				</tr>
			</table>
		</s:form>
	</div>
</div>
<script>
	cinit(["obj.name:姓名","obj.username:用户名","obj.password:密码","repassword:密码","obj.birthday:出生日期:reg:/^\\d{4}-\\d{2}-\\d{2}$/"]);

	
</script>
</body>
</html>