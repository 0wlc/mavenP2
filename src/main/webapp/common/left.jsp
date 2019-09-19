<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="${_plugins }/jmenu/Js/prototype.lite.js" type="text/javascript"></script>
    <script src="${_plugins }/jmenu/Js/moo.fx.js" type="text/javascript"></script>
    <script src="${_plugins }/jmenu/Js/moo.fx.pack.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="${_plugins }/jmenu/Style/skin.css" />
    <style>
	    body{
			background: linear-gradient(0, rgba(255,127,80, 0.5) 1px, transparent 0),
		            linear-gradient(90deg, rgba(255,127,80, 0.5) 1px, transparent 0);
			background-size: 20px;
			background-color: #ededed;
		}
    </style>
    <script type="text/javascript">
        window.onload = function () {
            var contents = document.getElementsByClassName('content');
            var toggles = document.getElementsByClassName('type');

            var myAccordion = new fx.Accordion(
            toggles, contents, {opacity: true, duration: 400}
            );
            myAccordion.showThisHideOpen(contents[0]);
            for(var i=0; i<document .getElementsByTagName("a").length; i++){
                var dl_a = document.getElementsByTagName("a")[i];
                    dl_a.onfocus=function(){
                        this.blur();
                    };
            }
        };
    </script>
</head>
<body>
    <table width="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="100%" valign="top">
                <div id="container">
                	<c:forEach items="${sessionScope.uMenu }" var="pm">
                    <h1 class="type"><a href="javascript:void(0)">${pm.key.name }</a></h1>
                    <div class="content">
                        <ul class="RM">
                        	<c:forEach items="${pm.value }" var="sm">
                            <li><a href="${_cxt }/${sm.url }" target="main">${sm.name }</a></li>
                        	</c:forEach>
                        </ul>
                    </div>
                	</c:forEach>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
