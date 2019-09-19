<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="t_in">
	<center><h2>菜单新增</h2></center>
	<s:form action="menu_add" namespace="/" method="post">
		<table width="80%" align="center">
			<tr>
				<td align="right">菜单名称:</td>
				<td><input class="ipt" type="text" name="obj.name"/></td>
				<td align="right">菜单URL:</td>
				<td><input class="ipt" type="text" name="obj.url"/></td>
			</tr>
			<tr>
				<td align="right">父菜单:</td>					
				<td>
					<s:select list="#application.pmMap" name="obj.pid" cssClass="ipt" />
				</td>
				<td align="right">菜单级别:</td>
				<td>
					<s:select list="#application.MENU_LEVEL" name="obj.mlevel" cssClass="ipt" />
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<input class="btn" type="submit" value="新增"/>
					<input class="btn" type="reset" value="重置"/>
					<input class="btn" type="button" value="返回" onclick="window.open('${_cxt}/menu_list.do','_self');" />
				</td>
			</tr>
		</table>
	</s:form>
</div>
<div class="t_btn">
	
</div>
</body>
</html>