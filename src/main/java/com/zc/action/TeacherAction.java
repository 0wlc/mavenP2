package com.zc.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zc.entity.Teacher;
import com.zc.implem.ITeacherDao;

@Controller
public class TeacherAction extends BaseAction<Teacher> {
	private static final long serialVersionUID = 1L;
	@Autowired
	private ITeacherDao teacherdao;

	public String list() throws Exception{
		Map<String,Object> param = new HashMap<>();
		if (isCommit()) {
			param.put("name", obj.getName());
			param.put("specialty", obj.getSpecialty());
			param.put("sex", obj.getSex());
			param.put("tlevel",obj.getTlevel());
		}
		//查询总记录数
		getPage().setTotalRows(teacherdao.list(param).size());
		//把page传到Dao
		param.put("page", getPage());
		setList(teacherdao.list(param));
		return "list";
	}
	
	public String tlist() throws Exception{
		Map<String,Object> param = new HashMap<>();
		if (isCommit()) {
			param.put("name", obj.getName());
			param.put("specialty", obj.getSpecialty());
			param.put("sex", obj.getSex());
			param.put("tlevel",obj.getTlevel());
		}
		//查询总记录数
		getPage().setTotalRows(teacherdao.list(param).size());
		//把page传到Dao
		param.put("page", getPage());
		setList(teacherdao.list(param));
		return "tlist";
	}
	
	public String add() throws Exception{
		int i = teacherdao.add(obj);
		setMsg(i>0?"添加操作成功":"添加操作失败");
		return "list";
	}
	
	public String update() throws Exception{
		if(!isCommit()){//请求转发
			setObj(teacherdao.getObjById(obj.getId()));
			return "update";
		}else{//更新操作
			int i = teacherdao.update(obj);
			setMsg(i>0?"更新操作成功":"更新操作失败");
			return "list";
		}
	}
	
	public String delete() throws Exception{
		int i = teacherdao.delete(obj.getId());
		setMsg(i>0?"删除操作成功":"删除操作失败");
		return "list";
	}
}