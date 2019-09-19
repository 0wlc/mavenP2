package com.zc.action;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;
import com.opensymphony.xwork2.ActionSupport;
import com.zc.common.Page;
/**
 * action基类
 * @author zc
 */
public class BaseAction<E> extends ActionSupport 
			 implements ServletContextAware,
			 ServletRequestAware,ServletResponseAware{
	private static final long serialVersionUID = 1L;
	ServletContext sc;
	HttpServletResponse resp;
	HttpServletRequest req;
	//提示信息
	private String msg;
	//判断是否为表单提交
	private boolean commit;
	//接收参数和回显参数的载体
	E obj; 
	//把对象集合传到JSP页面显示
	List<E> list;
	//分页对象
	private Page page;
	//专门用于返回json字符串
	private String jsonText;
	
	@Override
	public void setServletResponse(HttpServletResponse resp) {
		this.resp = resp;
	}
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	@Override
	public void setServletContext(ServletContext sc) {
		this.sc = sc;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public boolean isCommit() {
		return commit;
	}
	public void setCommit(boolean commit) {
		this.commit = commit;
	}
	public Page getPage() {
		if(page == null){//第一个访问查询页面时为NULL
			page = new Page();
		}
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public String getJsonText() {
		return jsonText;
	}
	public void setJsonText(String jsonText) {
		this.jsonText = jsonText;
	}
	public E getObj() {
		return obj;
	}
	public void setObj(E obj) {
		this.obj = obj;
	}
	public List<E> getList() {
		return list;
	}
	public void setList(List<E> list) {
		this.list = list;
	}
	
}
