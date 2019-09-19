package com.zc.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zc.entity.Course;
import com.zc.implem.ICourseDao;

@Controller
public class CourseAction extends BaseAction<Course> {

	private static final long serialVersionUID = 1L;
	@Autowired
	private ICourseDao coursedao;
	
	public String list() throws Exception{
		Map<String,Object> param = new HashMap<>();
		if(isCommit()){
			param.put("name", obj.getName());
			param.put("teacherName", obj.getTeacherName());
			param.put("schTerm", obj.getSchTerm());
		}
		getPage().setTotalRows(coursedao.list(param).size());
		param.put("page", getPage());
		setList(coursedao.list(param));
		return "list";
	}
	
	public String clist() throws Exception{
		Map<String,Object> param = new HashMap<>();
		if(isCommit()){
			param.put("name", obj.getName());
			param.put("teacherName", obj.getTeacherName());
			param.put("schTerm", obj.getSchTerm());
		}
		getPage().setTotalRows(coursedao.list(param).size());
		param.put("page", getPage());
		setList(coursedao.list(param));
		return "clist";
	}
	
	public String add() throws Exception{
		int i = coursedao.add(obj);
		setMsg(i>0?"添加操作成功":"添加操作失败");
		return "list";
	}
	
	public String update() throws Exception{
		if(!isCommit()){
			setObj(coursedao.getObjById(obj.getId()));
			return "update";
		}
		else{
			int i = coursedao.update(obj);
			setMsg(i>0?"更新操作成功":"更新操作失败");
			return "list";
		}
	}
	public String delete() throws Exception{
		int i = coursedao.delete(obj.getId());
		setMsg(i>0?"删除操作成功":"删除操作失败");
		return "list";
	}

}
