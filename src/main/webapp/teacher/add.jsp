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
	<center><h2>新增用户</h2></center>
	<s:form action="teacher_add" namespace="/" method="post">
		<table width="80%" align="center">
			<tr>
				<td align="right">姓名:</td>
				<td><input class="ipt" type="text" name="name" /></td>
				<td align="right">性别:</td>
				<td>
					<s:select list="#application.SYS_SEX" name="obj.sex" cssClass="ipt" />
				</td>
			</tr>
			<tr>
				<td align="right">出生日期:</td>
				<td><input id="birthday" class="ipt" type="text" readonly="readonly"  name="obj.birthday"/></td>
				<td align="right">入职时间:</td>
				<td><input id="date" class="ipt" type="text" readonly="readonly" name="obj.workDate" /></td>
			</tr>
			<tr>
				<td align="right">专业方向:</td>
				<td><input class="ipt" type="text" name="obj.specialty" /></td>
				<td align="right">职称等级:</td>
				<td>
					<s:select list="#application.TCH_LEVEL" name="obj.tlevel" cssClass="ipt" />
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<input class="btn" type="submit" value="新增"/>
					<input class="btn" type="reset" value="重置"/>
					<input class="btn" type="button" value="返回" onclick="window.open('${_cxt}/teacher_list.do','_self');" />
				</td>
			</tr>
		</table>
	</s:form>
</div>
<script>
		laydate.skin('molv');
		laydate({ elem: '#birthday' });
		laydate.skin('molv');
		laydate({ elem: '#date' });
</script>
</body>
</html>