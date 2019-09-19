//获取焦点时触发
function cfocus(obj){
	obj.className = "focus";
}
//错误信息
function cerr(obj,msg){
	var errNode = document.createElement("span");
	errNode.className = "error";
	errNode.innerHTML = msg;
	if(obj.nextSibling){
		obj.parentNode.removeChild(obj.nextSibling);
	}
	obj.className = "focus";
	obj.parentNode.appendChild(errNode);
	return false;
}
//验证通过
function csucc(obj){
	obj.className = "ipt";
	if(obj.nextSibling){
		obj.parentNode.removeChild(obj.nextSibling);
	}
	return true;
}
//通用非空校验
function creq(obj){
	var v = obj.value.trim();
	if(v.length == 0){
		return cerr(obj,"请输入" + obj.alt);
	}
	return csucc(obj);
}
//正则(格式)校验
function creg(obj){
	var v = obj.value.trim();
	var fa = obj.alt.split(",");//字段名，正则表达式
	var reg = eval(fa[1]);
	if(v.length == 0){
		return cerr(obj,"请输入" + fa[0]);
	}else if(!reg.test(v)){
		return cerr(obj,fa[0]+"格式有误");
	}
	return csucc(obj);
}

//页面校验初始化
// fa["username:用户名","password:密码","birthday:出生日期:reg:/^\d{4}-\d{2}-\d{2}$/"]
var CFA;
function cinit(fa){
	CFA = fa;//checkAll校验使用
	for (var i = 0; i < fa.length; i++) {
		var fs = fa[i].split(":");
		var obj = document.getElementsByName(fs[0])[0];
		obj.onfocus = function(){ cfocus(this); };
		if(fs.length==2){//非空校验
			obj.alt = fs[1];//获取字段名，通过alt传递
			obj.onblur = function(){ creq(this); };
		}else if("reg" == fs[2]){//正则验证
			//字段名与正则表达式传到alt上
			obj.alt = fs[1] +","+ fs[3];
			obj.onblur = function(){ creg(this); };
		}
	}
	//表单submit绑定checkAll();
	document.getElementById("f").onsubmit = function(){ return checkAll(); };
	//表单reset绑定reSet();
	document.getElementById("f").onreset = function(){ return reSet(); };
}

//提交（submit）时核查校验
function checkAll(){
	var is = true;
	for (var i = 0; i < CFA.length; i++) {
		var fg = CFA[i].split(":");
		var obj = document.getElementsByName(fg[0])[0];
		if(fg.length==2){//非空校验
			is = creq(obj) && is;
		}else if("reg" == fg[2]){//正则验证
			is = creg(obj) && is;
		}
	}
	return is;
}
//表单重置，全部清空
function reSet(){
	for(var i = 0;i<CFA.length;i++){
		var fr = CFA[i].split(":");
		var obj = document.getElementsByName(fr[0])[0];
		if(obj.nextSibling){
			obj.parentNode.removeChild(obj.nextSibling);
		}
		obj.className = "ipt";
	}
	
}
