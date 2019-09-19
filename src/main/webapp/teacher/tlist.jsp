<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function confirm(){
		var objs = $("input[name=select]:checked");
		if(objs.length == 0){
			alert("请选择教师");
		}
		parent.closeDialog(objs[0].value);
	}
</script>
</head>
<body>
<s:form id="f1" action="teacher_tlist" method="post">
	<div class="u_search">
		<fieldset>
			<legend>查询条件</legend>
				<input type="hidden" name="commit" value="true"/>
				<table width="100%" align="center" >
					<tbody valign="middle">
						<tr>
							<td align="right" width="16%">姓名:</td>
							<td><input class="ipt" name="obj.name" type="text"/></td>
							<td align="right">性别:</td>
							<td>
								<s:select list="#application.SYS_SEX" name="obj.sex" cssClass="ipt"/>
							</td>
						</tr>
						<tr>
							<td align="right">专业:</td>
							<td><input class="ipt" name="obj.specialty" type="text"/></td>
							<td align="right">职称等级:</td>
							<td>
								<s:select headerKey="0" headerValue="--请选择--" list="#application.TCH_LEVEL" name="obj.tlevel" cssClass="ipt"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<input class="btn" type="submit" value="查询"/>
								<input class="btn" type="reset" value="重置"/>
								<input class="btn" type="button" value="确认" onclick="confirm();"/>
								<input class="btn" type="button" value="关闭" onclick="parent.dialog.close();"/>
							</td>
						</tr>
					</tbody>	
				</table>
		</fieldset>
	</div>
	<div class="u_list">
		<fieldset>
			<table class="t_tab">
				<tr class="t_tit">
					<td colspan="8" align="center">
						<span>教师信息列表</span>
						<div style="float:right;color:orangered;font-size:1em;">${msg}</div>
					</td>
				</tr>
				<tr class="t_tit" align="center">
					<td>选择</td>
					<td>姓名</td>
					<td>性别</td>
					<td>出生日期</td>
					<td>入职时间</td>
					<td>专业方向</td>
					<td>职称等级</td>
				</tr>
				<s:iterator value="list" var="v" status="vs">
				<tr align="center">
					<td><input type="radio" name="select" value="${v.id },${v.name }"/></td>
					<td>${v.name }</td>
					<td><ft:tran value="${v.sex }" data="${SYS_SEX }"/></td>
					<td><s:date name="#v.birthday" format="yyyy-MM-dd"/></td>
					<td><s:date name="#v.workDate" format="yyyy-MM-dd"/></td>
					<td>${v.specialty }</td>
					<td><ft:tran value="${v.tlevel }" data="${TCH_LEVEL }"/></td>
				</tr>
				</s:iterator>
			</table> 
			<%@ include file="/common/pager.jsp" %>
		</fieldset>
	</div>
</s:form>	
</body>
</html>