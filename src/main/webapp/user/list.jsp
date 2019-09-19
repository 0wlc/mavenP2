<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${_plugins }/lhgdialog/lhgdialog.min.js?self=true&skin=iblack"></script>
<script>
	function showPic(filePath){//显示图片
	   if(filePath==''){
		   alert("用户头像不存在");
		   return;
	   }
	   $.dialog({
	     title: '查询图片',
	     width: '350px',
	     height: '300px',
	     lock:true,
	     content: '<img src="../images/'+ filePath +'" />'
	   });
	}
</script>
</head>
<body>
<s:form id="f1" action="user_list" method="post">
	<div class="u_search">
		<fieldset>
			<legend>查询条件</legend>
				<input type="hidden" name="commit" value="true"/>
				<table width="100%" align="center" >
					<tbody valign="middle">
						<tr>
							<td align="right" width="16%">姓名:</td>
							<td><input class="ipt" type="text" name="obj.name" value="${obj.name}"/></td>
							<td align="right" width="16%">用户名:</td>
							<td><input class="ipt" type="text" name="obj.username" value="${obj.username}"/></td>
						</tr>
						<tr>
							<td align="right">性别:</td>
							<td>
								<s:select headerKey="0" headerValue="--请选择--" list="#application.SYS_SEX" name="obj.sex" cssClass="ipt"/>
							</td>
							<td align="right">状态:</td>
							<td>
								<s:select headerKey="0" headerValue="--请选择--" list="#application.SYS_STATE" name="obj.loginFlag" cssClass="ipt"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<input class="btn" type="submit" value="查询"/>
								<input class="btn" type="button" value="重置" onclick="clearForm(form)"/>
								<input class="btn" type="button" value="新增" onclick="location.href='${_cxt }/user/add.jsp'"/>
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
					<td colspan="10" align="center">
						<span>用户信息列表</span>
						<div style="float:right;color:orangered;font-size:1em;">${msg}</div>
					</td>
				</tr>
				<tr class="t_tit" align="center">
					<td>记录ID</td>
					<td>姓名</td>
					<td>性别</td>
					<td>出生日期</td>
					<td>用户名</td>
					<td>状态</td>
					<td>角色名称</td>
					<td>创建日期</td>
					<td colspan="2">操作</td>
				</tr>
				<s:iterator value="list" var="v" status="vs">
				<tr align="center">
					<td>${v.id }</td>
					<td><a href="javascript:showPic('${v.filePath }');">${v.name }</a></td>
					<td><ft:tran value="${v.sex }" data="${SYS_SEX }"/></td>
					<td><s:date name="#v.birthday" format="yyyy-MM-dd"/></td>
					<td>${v.username }</td>
					<td><ft:tran value="${v.loginFlag }" data="${SYS_STATE }"/></td>
					<td><ft:tran value="${v.roleId }" data="${roleMap }"/></td>
					<td><s:date name="#v.createDate" format="yyyy-MM-dd"/></td>
					<td><a href="${_cxt }/user_update.do?obj.id=${v.id}" target="main">更新</a></td>
					<td><a href="${_cxt }/user_delete.do?obj.id=${v.id}" onclick="return confirm('是否删除?')">删除</a></td>
				</tr>
				</s:iterator>
			</table> 
			<%@ include file="/common/pager.jsp" %>
		</fieldset>
	</div>
</s:form>	
</body>
</html>