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
			alert("请选择课程");
		}
		parent.closeCDialog(objs[0].value);
	}
</script>
</head>
<body>
<s:form id="f1" action="course_clist" method="post">
	<div class="u_search">
		<fieldset>
			<legend>查询条件</legend>
				<input type="hidden" name="commit" value="true"/>
				<table width="100%" align="center" >
					<tbody valign="middle">
						<tr>
							<td align="right" width="16%">课程名称:</td>
							<td><input class="ipt" type="text" name="obj.name"/></td>
							<td align="right" width="16%">授课老师:</td>
							<td><input class="ipt" type="text" name="obj.teacherName"/></td>
						</tr>
						<tr>
							<td align="right" width="16%">年度:</td>
							<td><input id="year" class="ipt" type="text" name="obj.cyear"readonly="readonly"/></td>
							<td align="right">学期:</td>
							<td>
								<s:select headerKey="0" headerValue="--请选择--" list="#application.SCH_TERM" name="obj.schTerm" cssClass="ipt"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<input class="btn" type="submit" value="查询"/>
								<input class="btn" type="button" value="重置" onclick="clearForm(form)"/>
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
					<td colspan="9" align="center">
						<span>课程信息列表</span>
						<div style="float:right;color:orangered;font-size:1em;">${msg}</div>
					</td>
				</tr>
				<tr class="t_tit" align="center">
					<td>选择</td>
					<td>课程名称</td>
					<td>授课老师</td>
					<td>学年</td>
					<td>学期</td>
					<td>学分</td>
					<td>状态</td>
				</tr>
				<s:iterator value="list" var="v" status="vs">
				<tr align="center">
					<td><input type="radio" name="select" value="${v.id },${v.name},${v.teacherName}" /></td>
					<td>${v.name }</td>
					<td>${v.teacherName }</td>
					<td>${v.cyear }</td>
					<td><ft:tran value="${v.schTerm }" data="${SCH_TERM }"/></td>
					<td>${v.credit }</td>
					<td><ft:tran value="${v.state }" data="${SYS_STATE }"/></td>
				</tr>
				</s:iterator>
			</table> 
			<%@ include file="/common/pager.jsp" %>
		</fieldset>
	</div>
</s:form>
<script>
	/*laydate 1.0*/
	laydate.skin("molv");
	laydate({ elem: '#year',format: 'YYYY'});
</script>
</body>
</html>