<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:form id="f1" action="class_list" method="post">
	<div class="u_search">
		<fieldset>
			<legend>查询条件</legend>
				<input type="hidden" name="commit" value="true"/>
				<table width="100%" align="center" >
					<tbody valign="middle">
						<tr>
							<td align="right" width="16%">班级名称:</td>
							<td><input class="ipt" type="text" name="obj.name" value="${obj.name}"/></td>
							<td align="right" width="16%">班主任:</td>
							<td><input class="ipt" type="text" name="obj.charger" value="${obj.charger}"/></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<input class="btn" type="submit" value="查询"/>
								<input class="btn" type="button" value="重置" onclick="clearForm(form)"/>
								<input class="btn" type="button" value="新增" onclick="location.href='${_cxt }/class/add.jsp'"/>
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
					<td colspan="6" align="center">
						<span>班级信息列表</span>
						<div style="float:right;color:orangered;font-size:1em;">${msg}</div>
					</td>
				</tr>
				<tr class="t_tit" align="center">
					<td>记录ID</td>
					<td>班级名称</td>
					<td>班主任</td>
					<td>创建日期</td>
					<td colspan="3">操作</td>
				</tr>
				<s:iterator value="list" var="v" status="vs">
				<tr align="center">
					<td>${v.id }</td>
					<td>${v.name }</td>
					<td>${v.charger }</td>
					<td><s:date name="#v.createDate" format="yyyy-MM-dd"/></td>
					<td><a href="${_cxt }/class_update.do?obj.id=${v.id}" target="main">更新</a></td>
					<td><a href="${_cxt }/class_delete.do?obj.id=${v.id}" onclick="return confirm('是否删除?')">删除</a></td>
				</tr>
				</s:iterator>
			</table> 
			<%@ include file="/common/pager.jsp" %>
		</fieldset>
	</div>
</s:form>	
</body>
</html>