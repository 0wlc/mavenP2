<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>  
<!-- 引入标签库 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="ft" uri="mt-uri" %>
<style>
  center a{
    text-decoration: none;
  }
</style>
<script type="text/javascript"> 
//跳到第i页 
function gotoPage(i)  
{  
    var currentForm = document.getElementById("f1");  
    var currentPage = document.getElementById("currentPage");
    currentPage.value=i;
    currentForm.submit(); //通过JS提交表单 
}  
</script>
<center>
   <input id="currentPage" type="hidden" name="page.currentPage" value="1">  
   <a href="#" onclick="gotoPage(1)">首页</a>
   <c:choose>
   <c:when test="${page.hasPrevious}">
        <a href="#" onclick="gotoPage(${page.prePage})">上一页</a>  
   </c:when>
   <c:otherwise>上一页</c:otherwise>
   </c:choose>
   <c:choose>
   <c:when test="${page.hasNext}">
        <a href="#" onclick="gotoPage(${page.nextPage})">下一页</a>  
   </c:when>
   <c:otherwise>下一页</c:otherwise>
   </c:choose>
   <a href="#" onclick="gotoPage(${page.totalPages})">未页</a> 
        当前第<b>${page.currentPage}</b>页
        总记录数:<b>${page.totalRows}</b>条
        总页数:<b>${page.totalPages}</b>页
</center>
    
