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
	<center><h2>用户新增</h2></center>
	<s:form action="user_add" namespace="/" method="post" enctype="multipart/form-data">
		<table width="80%" align="center">
			<tr>
				<td align="right">姓名:</td>
				<td><input class="ipt" type="text" name="obj.name"/></td>
				<td align="right">用户名:</td>
				<td><input class="ipt" type="text" name="obj.username"/></td>
			</tr>
			<tr>
				<td align="right">性别:</td>
				<td>
					<s:select list="#application.SYS_SEX" name="obj.sex" cssClass="ipt" />
				</td>
				<td align="right">出生日期:</td>
				<td><input class="ipt" id="birthday" readonly="readonly" type="text" name="obj.birthday"/></td>
			</tr>
			<tr>
				<td align="right">角色名称:</td>
				<td>
					<s:select list="#application.roleMap" name="obj.roleId" cssClass="ipt"/>
				</td>
				<td align="right">状态:</td>
				<td>
					<s:select list="#application.SYS_STATE" name="obj.loginFlag" cssClass="ipt" />
				</td>
			</tr>
			<tr>
				<td  align="right">上传头像</td>
				<td><input type="file" name="fupload.upload" class="ipt" /></td>
				<td></td>
				<td>
					<input class="btn" type="submit" value="新增"/>
					<input class="btn" type="reset" value="重置"/>
					<input class="btn" type="button" value="返回" onclick="window.open('${_cxt}/user_list.do','_self');" />
				</td>
			</tr>
		</table>
	</s:form>
</div>
<script>
	/*laydate 1.0*/
	laydate.skin("molv");
	laydate({ elem: '#birthday'});

	//cinit(["name:姓名","username:用户名"]);
</script>
</body>
</html>