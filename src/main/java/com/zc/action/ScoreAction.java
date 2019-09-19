package com.zc.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zc.entity.Score;
import com.zc.implem.IScoreDao;
/**
 * 成绩管理Servlet
 * @author Administrator
 *
 */
@Controller
public class ScoreAction extends BaseAction<Score> {

	private static final long serialVersionUID = 1L;
	@Autowired
	private IScoreDao scoreedao;

	public String list() throws Exception{
		Map<String,Object> param = new HashMap<>();
		if(isCommit()){
			param.put("studentName", obj.getStudentName());
			param.put("courseName", obj.getCourseName());
			param.put("teacherName", obj.getTeacherName());
		}
		//查询总记录数
		getPage().setTotalRows(scoreedao.list(param).size());
		//把page传到Dao
		param.put("page", getPage());
		setList(scoreedao.list(param));
		return "list";
	}
	
	public String update() throws Exception {
		if(!isCommit()){
			setObj(scoreedao.getObjById(obj.getId()));
			return "update";
		}else{
			int i = scoreedao.update(obj);
			setMsg(i>0?"更新操作成功":"更新操作失败");
			return "list";
		}
	}
}