<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${_plugins }/lhgdialog/lhgdialog.min.js?self=true&skin=iblack"></script>
<script type="text/javascript">
	var dialog;
	function openDialog(){//打开弹出窗口
	   dialog = $.dialog({
	     title: '选择一个教师',
	     lock: true,
	     width: '1050px',
	     height: '550px',
	     content: 'url:${_cxt}/teacher_tlist.do'
	   });
	}
	//result格式: 班级ID,班级名称
	function closeDialog(result){//关闭窗口
	   //alert(result);
	   var arr = result.split(",");
	   $("input[name='obj.teacherId']").val(arr[0]);
	   $("input[name='obj.teacherName']").val(arr[1]); 
	   dialog.close();//关闭窗口
	}
</script>
</head>
<body>
	<div class="t_in">
		<center><h2>课程更新</h2></center>
		<s:form action="course_update" method="post">
			<s:hidden name="obj.id"/>
			<input type="hidden" name="commit" value="true"/>
			<table width="80%" align="center">
				<tr>
					<td align="right">授课老师:</td>
				<td>
					<input class="ipt" type="hidden" name="obj.teacherId"/>
					<s:textfield cssClass="ipt" readonly="true" name="obj.teacherName"/>
					<a href="javascript:openDialog();">选择</a>
				</td>
					<td align="right">课程名称:</td>
					<td><s:textfield cssClass="ipt" name="obj.name"/></td>
				</tr>
				<tr>
					<td align="right">学年:</td>
					<td><s:textfield id="year" cssClass="ipt"  name="obj.cyear" readonly="true"/></td>
					<td align="right">学期:</td>
					<td>
						<s:select list="#application.SCH_TERM" name="obj.schTerm" cssClass="ipt"/>
					</td>
				</tr>
				<tr>
					<td align="right">学分:</td>
					<td><s:textfield cssClass="ipt" name="obj.credit"/></td>
					<td align="right">状态:</td>
					<td>
						<s:select list="#application.SYS_STATE" name="obj.state" cssClass="ipt"/>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<input class="btn" type="submit" value="新增"/>
						<input class="btn" type="reset" value="重置"/>
						<input class="btn" type="button" value="返回" onclick="window.open('${_cxt}/course_list.do','_self');" />
					</td>
				</tr>
			</table>
		</s:form>
	</div>
</body>
<script>
	/*laydate 1.0*/
	laydate.skin("molv");
	laydate({ elem: '#year',format: 'YYYY'});
</script>
</html>