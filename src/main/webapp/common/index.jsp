<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>系统首页</title>
</head>
<frameset class="top" rows="20%,*" frameborder="no">
	<frame name="top" noresize="noresize" src="${_cxt }/common/top.jsp">
	<frameset class="main" cols="18%,*">
		<frame name="list" src="${_cxt }/common/left.jsp" noresize="noresize">
		<frame name="main" src="${_cxt }/common/welcome.jsp" noresize="noresize">
	</frameset>
</frameset>
</html>