package com.zc.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zc.common.FileUpload;
import com.zc.entity.User;
import com.zc.implem.IUserDao;

@Controller
public class UserAction extends BaseAction<User> {
	private static final long serialVersionUID = 1L;
	@Autowired
	private IUserDao userdao;
	private FileUpload fupload;

	public String list() throws Exception{
		Map<String,Object> param = new HashMap<>();
		if (req.getParameter("commit")!=null) {
			param.put("name", obj.getName());
			param.put("username", obj.getUsername());
			param.put("sex", obj.getSex());
			param.put("loginFlag", obj.getLoginFlag());
		}
		//查询总记录数
		getPage().setTotalRows(userdao.list(param).size());
		//把page传到Dao
		param.put("page", getPage());
		setList(userdao.list(param));
		return "list";
	}
	
	public String add() throws Exception{
		//Part part = req.getPart("image");//获取上传文件的表单域名
		if(fupload!=null){
			String fileName = fupload.upload("D:\\apache-tomcat-8.0.49\\webapps\\images");
			obj.setFilePath(fileName);
		}else{
			obj.setFilePath("");
		}
		int i = userdao.add(obj);
		setMsg(i>0?"添加操作成功":"添加操作失败");
		return "list";
	}
	
	public String update() throws Exception{
		if(!isCommit()){//请求转发
			setObj(userdao.getObjById(obj.getId()));
			return "update";
		}else{//更新操作
			if(fupload!=null){
				String fileName = fupload.upload("D:\\apache-tomcat-8.0.49\\webapps\\images");
				obj.setFilePath(fileName);
			}
			int i = userdao.update(obj);
			setMsg(i>0?"更新操作成功":"更新操作失败");
			return "list";
		}
	}
	
	public String delete() throws Exception{
		int i = userdao.delete(obj.getId());
		setMsg(i>0?"删除操作成功":"删除操作失败");
		return "list";
	}

	public FileUpload getFupload() {
		return fupload;
	}

	public void setFupload(FileUpload fupload) {
		this.fupload = fupload;
	}
}