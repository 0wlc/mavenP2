package com.zc.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zc.entity.Class;
import com.zc.implem.IClassDao;

@Controller
public class ClassAction extends BaseAction<Class> {
	private static final long serialVersionUID = 1L;
	@Autowired
	private IClassDao classdao;

	public String list() throws Exception{
		Map<String,Object> param = new HashMap<>();
		if (isCommit()) {
			param.put("name", obj.getName());
			param.put("charger", obj.getCharger());
		}
		//查询总记录数
		getPage().setTotalRows(classdao.list(param).size());
		//把page传到Dao
		param.put("page", getPage());
		setList(classdao.list(param));
		return "list";
	}
	
	public String slist() throws Exception{
		Map<String,Object> param = new HashMap<>();
		if (isCommit()) {
			param.put("name", obj.getName());
			param.put("charger", obj.getCharger());
		}
		//查询总记录数
		getPage().setTotalRows(classdao.list(param).size());
		//把page传到Dao
		param.put("page", getPage());
		setList(classdao.list(param));
		return "slist";
	}
	
	public String add() throws Exception{
		int i = classdao.add(obj);
		setMsg(i>0?"添加操作成功":"添加操作失败");
		return "list";
	}
	
	public String update() throws Exception{
		if(!isCommit()){//请求转发
			setObj(classdao.getObjById(obj.getId()));
			return "update";
		}else{//更新操作
			int i = classdao.update(obj);
			setMsg(i>0?"更新操作成功":"更新操作失败");
			return "list";
		}
	}
	
	public String delete() throws Exception{
		int i = classdao.delete(obj.getId());
		setMsg(i>0?"删除操作成功":"删除操作失败");
		return "list";
	}
}