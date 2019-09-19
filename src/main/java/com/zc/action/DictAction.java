package com.zc.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zc.common.DictUtil;
import com.zc.entity.Dict;
import com.zc.implem.IDictDao;

@Controller
public class DictAction extends BaseAction<Dict> {
	private static final long serialVersionUID = 1L;
	@Autowired
	private IDictDao dictdao;
	
	public String list() throws Exception {
		Map<String,Object> param = new HashMap<>();
		if (this.isCommit()) {
			param.put("name", obj.getName());
			param.put("dkey", obj.getDkey());
			param.put("useFlag", obj.getUseFlag());
		}
		//查询总记录数
		getPage().setTotalRows(dictdao.list(param).size());
		//分页对象传到Dao
		param.put("page", getPage());
		setList(dictdao.list(param));
		return "list";
	}
	
	public String add() throws Exception {
		int i = dictdao.add(obj);
		setMsg(i>0?"添加操作成功":"添加操作失败");
		return "list";
	}
	
	public String update() throws Exception {
		if(!this.isCommit()){//请求转发
			setObj(dictdao.getObjById(obj.getId()));
			return "update";
		}else{//更新操作
			int i = dictdao.update(obj);
			setMsg(i>0?"更新操作成功":"更新操作失败");
			return "list";
		}
	}
	
	public String delete() throws Exception {
		int i = dictdao.delete(obj.getId());
		setMsg(i>0?"删除操作成功":"删除操作失败");
		return "list";
	}
	
	public String refresh() throws Exception {
		DictUtil.refreshDict(sc);
		DictUtil.refreshPmenu(sc);
		DictUtil.refreshRole(sc);
		setMsg("刷新缓存成功");
		return "list";
	}
}