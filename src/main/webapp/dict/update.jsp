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
		<center><h2>字典更新</h2></center>
		<s:form action="dict_update" method="post">
			<s:hidden name="obj.id"/>
			<input type="hidden" name="commit" value="true"/>
			<table width="80%" align="center">
				<tr>
					<td align="right">字典名称:</td>
					<td><s:textfield cssClass="ipt" name="obj.name"/></td>
					<td align="right">使用状态:</td>
					<td>
						<s:select list="#application.SYS_STATE" name="obj.useFlag" cssClass="ipt" />
					</td>
				</tr>
				<tr>
					<td align="right">字典KEY:</td>
					<td><s:textfield cssClass="ipt" name="obj.dkey"/></td>
					<td align="right">字典VALUE:</td>
					<td><s:textfield cssClass="ipt" name="obj.dval"/></td>
				</tr>
				<tr>
					<td align="right">顺序号:</td>
					<td><s:textfield cssClass="ipt" name="obj.orderNo"/></td>
					<td></td>
					<td>
						<input class="btn" type="submit" value="更新"/>
						<input class="btn" type="button" value="重置" onclick="clearForm(form)"/>
						<input class="btn" type="button" value="返回" onclick="window.open('${_cxt}/dict_list.do','_self');" />
					</td>
				</tr>
			</table>
		</s:form>
	</div>
</body>
</html>