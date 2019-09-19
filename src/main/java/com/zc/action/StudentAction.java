package com.zc.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zc.entity.Student;
import com.zc.implem.IStudentDao;

@Controller
public class StudentAction extends BaseAction<Student> {
	private static final long serialVersionUID = 1L;
	@Autowired
	private	IStudentDao studentdao;

	public String list() throws Exception{
		Map<String,Object> param = new HashMap<>();
		if (isCommit()) {
			param.put("name", obj.getName());
			param.put("className", obj.getClassName());
			param.put("sex", obj.getSex());
		}
		//查询总记录数
		getPage().setTotalRows(studentdao.list(param).size());
		//把page传到Dao
		param.put("page", getPage());
		setList(studentdao.list(param));
		return "list";
	}
	
	public String tlist() throws Exception{
		Map<String,Object> param = new HashMap<>();
		if (isCommit()) {
			param.put("name", obj.getName());
			param.put("className", obj.getClassName());
			param.put("sex", obj.getSex());
		}
		//查询总记录数
		getPage().setTotalRows(studentdao.list(param).size());
		//把page传到Dao
		param.put("page", getPage());
		setList(studentdao.list(param));
		return "tlist";
	}
	
	public String add() throws Exception{
		int i = studentdao.add(obj);
		setMsg(i>0?"添加操作成功":"添加操作失败");
		return "list";
	}
	
	public String update() throws Exception{
		if(!isCommit()){//请求转发
			setObj(studentdao.getObjById(obj.getId()));
			return "update";
		}else{//更新操作
			int i = studentdao.update(obj);
			setMsg(i>0?"更新操作成功":"更新操作失败");
			return "list";
		}
	}
	
	public String delete() throws Exception{
		int i = studentdao.delete(obj.getId());
		setMsg(i>0?"删除操作成功":"删除操作失败");
		return "list";
	}
}