<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>菜单信息管理</title>
<link rel="stylesheet" href="${_plugins}/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
<link rel="stylesheet" href="${_plugins}/zTree/css/demo.css" type="text/css"/>
<script type="text/javascript" src="${_plugins}/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${_plugins}/zTree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${_plugins}/zTree/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript">
	    //树的设置
		var setting = {
			check: {
				enable: true,
				chkboxType:{ "Y" : "ps", "N" : "s" }
			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};
		//JSON数据
		var zNodes = ${jsonText};
		
		//全选和取消全选
	    function checkNode(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			type = e.data.type;//动态绑定时传参数

			if (type == "checkAllTrue") {
				zTree.checkAllNodes(true);
			} else if (type == "checkAllFalse") {
				zTree.checkAllNodes(false);
			} 
		}
		//生成树并绑定事件监听
		$(document).ready(function(){
			//生成树
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			//事件绑定
			$("#checkAllTrue").bind("click", {type:"checkAllTrue"}, checkNode);
			$("#checkAllFalse").bind("click", {type:"checkAllFalse"}, checkNode);
		});
		//提交表单
		function addSubmit(){
		  	var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
		  	//获取所有被勾选择节点
			nodes = zTree.getCheckedNodes();
			//ID字符串(格式: 1,4,6,)
			var menuIds = "";
			var roleId =${obj.id};//角色Id
			//把所有打勾的项拼接成字符串
			$.each(nodes,function(index,obj) {
			  if(index!=0){
			  	menuIds += "," + obj.id;
			  }else{
			    menuIds += obj.id;
			  }              
            });
            //提交表单
		    $.ajax({
			       type : "post",
				   url  : "${_cxt}/role_updateR2M.do",
				   cache: false,
				   data : "menuIds="+menuIds+"&obj.id=" + roleId,
				   success : function(jsonStr) {
				      //alert(jsonTest);
				      //把json字符串转化成js对象
					  var json = eval("(" + jsonStr + ")");
					  //alert(json.result);
					  //关闭当前窗口
					  parent.closeDialog(json.result);
				   }
			  });
		}
		//关闭窗口
		function cancel(){
		   //关闭当前窗口
		   parent.closeDialog("");
		}
	</script>
</head>
<body>
<table width="100%" border="0" align="center">
  <tr>
     <td align="center">
        [<a id="checkAllTrue" style="text-decoration: none;" href="#" onclick="return false;">全选</a>]
		[<a id="checkAllFalse" style="text-decoration: none;" href="#" onclick="return false;">取消全选</a>] 
		[<a href="#" style="text-decoration: none;" onclick="addSubmit();">确定分配</a>]
		[<a href="#" style="text-decoration: none;" onclick="cancel();">取消</a>]
		<ul id="treeDemo" class="ztree"></ul>
     </td>
  </tr>
</table>
</body>
</html>
