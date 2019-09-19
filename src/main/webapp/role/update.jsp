<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 定义临时变量 -->
	<div class="t_in">
		<center><h2>更新角色</h2></center>
		<s:form action="role_update" method="post">
			<s:hidden name="obj.id"/>
			<input type="hidden" name="commit" value="true"/>
			<table width="80%" align="center">
				<tr>
					<td align="right">角色名称:</td>
					<td><s:textfield cssClass="ipt" name="obj.name"/></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<input class="btn" type="submit" value="更新"/>
						<input class="btn" type="button" value="重置" onclick="clearForm(form)"/>
						<input class="btn" type="button" value="返回" onclick="window.open('${_cxt}/role_list.do','_self');" />
					</td>
				</tr>
			</table>
		</s:form>
	</div>
</body>
</html>