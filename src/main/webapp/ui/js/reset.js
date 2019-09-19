var form = $("form");//全局，获取Dom表单
function clearForm(form) {  
  $(':input', form).each(function() { //遍历所有input标签
    var type = this.type;  
    var tag = this.tagName.toLowerCase(); 
    //input标签不同类型，选择不同的重置方式
    if (type == 'text' || type == 'password' || tag == 'textarea')
        this.value = "";
        else if (type == 'checkbox' || type == 'radio')    
        this.checked = false;  
        else if (tag == 'select')     
        this.selectedIndex = 0;  });
};