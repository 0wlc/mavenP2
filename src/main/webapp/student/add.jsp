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
	     title: '选择一个班级',
	     lock: true,
	     width: '850px',
	     height: '450px',
	     content: 'url:${_cxt}/class_slist.do'
	   });
	}
	//result格式: 班级ID,班级名称
	function closeDialog(result){//关闭窗口
	   //alert(result);
	   var arr = result.split(",");
	   $("input[name='obj.classId']").val(arr[0]);
	   $("input[name='obj.className']").val(arr[1]); 
	   dialog.close();//关闭窗口
	}
</script>
</head>
<body>
<div class="t_in">
	<center><h2>学生新增</h2></center>
	<s:form action="student_add" namespace="/" method="post">
		<table width="80%" align="center">
			<tr>
				<td align="right">姓名:</td>
				<td><input class="ipt" type="text" name="obj.name"/></td>
				<td align="right">班级名称:</td>
				<td>
					<input type="hidden" name="obj.classId"/>
					<input class="ipt" type="text" readonly="readonly"  name="obj.className"/>
					<a href="javascript:openDialog();">选择</a>
				</td>
			</tr>
			<tr>
				<td align="right">性别:</td>
				<td>
					<s:select list="#application.SYS_SEX" name="obj.sex" cssClass="ipt" />
				</td>
				<td align="right">出生日期:</td>
				<td><input id="birthday" class="ipt" type="text" name="obj.birthday" readonly="readonly"/></td>
			</tr>
			<tr>
				<td align="right">籍贯:</td>
				<td><input class="ipt" type="text" name="obj.snative"/></td>
				<td></td>
				<td>
					<input class="btn" type="submit" value="新增"/>
					<input class="btn" type="reset" value="重置"/>
					<input class="btn" type="button" value="返回" onclick="window.open('${_cxt}/student_list.do','_self');" />
				</td>
			</tr>
		</table>
	</s:form>
</div>
<script>
	laydate.skin('molv');
	laydate({ elem: '#birthday' });
</script>
</body>
</html>