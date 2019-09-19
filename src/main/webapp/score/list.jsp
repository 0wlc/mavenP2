<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:form id="f1" action="score_list" method="post">
	<div class="u_search">
		<fieldset>
			<legend>查询条件</legend>
				<input type="hidden" name="commit" value="true"/>
				<table width="100%" align="center" >
					<tbody valign="middle">
						<tr>
							<td align="right" width="16%">学生姓名:</td>
							<td><input class="ipt" type="text" name="obj.studentName" value="${obj.studentName }"></td>
							<td align="right" width="16%">课程名称:</td>
							<td><input class="ipt" type="text" name="obj.courseName" value="${obj.courseName }"></td>
						</tr>
						<tr>
							<td align="right">授课老师:</td>
							<td><input class="ipt" type="text" name="obj.teacherName" value="${obj.teacherName }"></td>
							<td align="right">学年:</td>
							<td><input id="year" class="ipt" type="text" readonly="readonly" name="obj.cyear" value="${obj.cyear }"></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<input class="btn" type="submit" value="查询"/>
								<input class="btn" type="button" value="重置" onclick="clearForm(form)"/>
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
						<span>选课信息列表</span>
						<div style="float:right;color:orangered;font-size:1em;">${msg}</div>
					</td>
				</tr>
				<tr class="t_tit" align="center">
					<td>记录ID</td>
					<td>学生姓名</td>
					<td>课程名称</td>
					<td>授课老师</td>
					<td>学年</td>
					<td>学期</td>
					<td>成绩</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
				<s:iterator value="list" var="v" status="vs">
				<tr align="center">
					<td>${v.id }</td>
					<td>${v.studentName }</td>
					<td>${v.courseName }</td>
					<td>${v.teacherName }</td>
					<td>${v.cyear }</td>
					<td><ft:tran value="${v.schTerm }" data="${SCH_TERM}"/></td>
					<td>${v.score }</td>
					<td><ft:tran value="${v.state }" data="${SYS_STATE }"/></td>
					<td><a href="${_cxt }/score_update.do?obj.id=${v.id}" target="main">成绩录入</a></td>
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