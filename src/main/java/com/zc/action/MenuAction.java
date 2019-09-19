package com.zc.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zc.entity.Menu;
import com.zc.implem.IMenuDao;

@Controller
public class MenuAction extends BaseAction<Menu> {
	private static final long serialVersionUID = 1L;
	@Autowired
	private IMenuDao menudao;
	
	public String list() throws Exception {
		Map<String,Object> param = new HashMap<>();
		if (isCommit()) {
			param.put("name", obj.getName());
			param.put("pid", obj.getPid());
			param.put("mlevel",obj.getMlevel());
		}
		//查询总记录数
		getPage().setTotalRows(menudao.list(param).size());
		//把page传到Dao
		param.put("page", getPage());
		setList(menudao.list(param));
		return "list";
	}
	
	public String add() throws Exception {
		int i = menudao.add(obj);
		setMsg(i>0?"添加操作成功":"添加操作失败");
		return "list";
	}
	
	public String update() throws Exception {
		if(!isCommit()){//请求转发
			setObj(menudao.getObjById(obj.getId()));
			return "update";
		}else{//更新操作
			int i = menudao.update(obj);
			setMsg(i>0?"更新操作成功":"更新操作失败");
			return "list";
		}
	}
	
	public String delete() throws Exception {
		int i = menudao.delete(obj.getId());
		setMsg(i>0?"删除操作成功":"删除操作失败");
		return "list";
	}

}