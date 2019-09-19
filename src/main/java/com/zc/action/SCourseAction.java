package com.zc.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zc.entity.SCourse;
import com.zc.implem.ISCourseDao;

@Controller
public class SCourseAction extends BaseAction<SCourse> {

	private static final long serialVersionUID = 1L;
	@Autowired
	private ISCourseDao scoursedao;

	public String list() throws Exception{
		Map<String,Object> param = new HashMap<>();
		if(isCommit()){
			param.put("studentName", obj.getStudentName());
			param.put("courseName", obj.getCourseName());
			param.put("teacherName", obj.getTeacherName());
		}
		//查询总记录数
		getPage().setTotalRows(scoursedao.list(param).size());
		//把page传到Dao
		param.put("page", getPage());
		setList(scoursedao.list(param));
		return "list";
	}
	
	public String add() throws Exception{
		int i = scoursedao.add(obj);
		setMsg(i>0?"添加操作成功":"添加操作失败");
		return "list";
	}
	
	public String update() throws Exception {
		if(!isCommit()){
			setObj(scoursedao.getObjById(obj.getId()));
			return "update";
		}else{
			int i = scoursedao.update(obj);
			setMsg(i>0?"更新操作成功":"更新操作失败");
			return "list";
		}
	}
	
	public String delete() throws Exception{
		int i =scoursedao.delete(obj.getId());
		setMsg(i>0?"删除操作成功":"删除操作失败");
		return "list";
	}
	
}
