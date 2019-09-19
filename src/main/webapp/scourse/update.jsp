<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${_plugins }/lhgdialog/lhgdialog.min.js?self=true&skin=iblack"></script>
<script>
	var dialog;
	function openCDialog(){//打开弹出窗口
	   dialog = $.dialog({
	     title: '选择一个课程',
	     lock: true,
	     width: '900px',
	     height: '450px',
	     content: 'url:${_cxt}/course_clist.do'
	   });
	}
	//result格式: ID,名称
	function closeCDialog(result){//关闭窗口
	   //alert(result);
	   var arr = result.split(",");
	   $("input[name='obj.courseId']").val(arr[0]);
	   $("input[name='obj.courseName']").val(arr[1]); 
	   dialog.close();//关闭窗口
	}

	function openTDialog(){//打开弹出窗口
	   dialog = $.dialog({
	     title: '选择一个学生',
	     lock: true,
	     width: '850px',
	     height: '450px',
	     content: 'url:${_cxt}/student_tlist.do'
	   });
	}
	//result格式: ID,名称
	function closeTDialog(result){//关闭窗口
	   //alert(result);
	   var arr = result.split(",");
	   $("input[name='obj.studentId']").val(arr[0]);
	   $("input[name='obj.studentName']").val(arr[1]); 
	   dialog.close();//关闭窗口
	}
</script>
</head>
<body>
	<div class="t_in">
		<center><h2>选课更新</h2></center>
		<s:form action="coursesel_update" method="post">
			<s:hidden name="obj.id"/> 
			<input type="hidden" name="commit" value="true"/>
			<table width="80%" align="center">
				<tr>
					<td align="right">学生姓名:</td>
					<td>
						<input type="hidden" class="ipt" name="obj.studentId"/>
						<s:textfield cssClass="ipt" readonly="true" name="obj.studentName"/>
						<a href="javascript:openTDialog();">选择</a>
					</td>
					<td align="right">课程名称:</td>
					<td>
						<input type="hidden" class="ipt" name="courseId" value="${v.courseId }"/>
						<s:textfield cssClass="ipt" readonly="true" name="obj.courseName"/>
						<a href="javascript:openCDialog();">选择</a>
					</td>
				</tr>
				<tr>
					<td align="right">成绩:</td>
					<td><s:textfield cssClass="ipt" name="obj.score"/></td>
					<td align="right">备注:</td>
					<td><s:textfield cssClass="ipt" name="obj.remark"/></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>
						<input class="btn" type="submit" value="更新"/>
						<input class="btn" type="button" value="重置" onclick="clearForm(form)"/>
						<input class="btn" type="button" value="返回" onclick="window.open('${_cxt}/coursesel_list.do','_self');" />
					</td>
				</tr>
			</table>
		</s:form>
	</div>
</body>
</html>