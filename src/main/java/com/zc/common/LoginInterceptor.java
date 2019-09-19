package com.zc.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.zc.action.BaseAction;
/**
 * 登录验证拦截器类
 * @author Administrator
 *
 */
public class LoginInterceptor implements Interceptor {

	private static final long serialVersionUID = 1L;

	@Override
	public void destroy(){}

	@Override
	public void init(){
		System.out.println("---Intercept is init---");
	}

	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		System.out.println("action执行之前");
		String name = ai.getInvocationContext().getName();
		System.out.println("请求方法：" + name);
		//获取Action上下文对象
		ActionContext ac = ai.getInvocationContext();
		//获取request对象
		HttpServletRequest request
		  =(HttpServletRequest)ac.get(ServletActionContext.HTTP_REQUEST);
		//获取会话
		HttpSession session = request.getSession();
		/*@SuppressWarnings("unchecked")
		List<String> aPriv = (List<String>)session.getAttribute("apriv");
		@SuppressWarnings("unchecked")
		List<String> uPriv = (List<String>)session.getAttribute("upriv");*/
		
		/* 未登录情况请求login。do/register。do */
		String uri = request.getRequestURI();
		if(null != session.getAttribute("user")){//判断是否有登录状态
             ai.invoke();
		}else{
			//获取被拦截的action
			BaseAction<?> action = (BaseAction<?>)ai.getAction();
			action.setMsg("尚未登录，没有操作权限");
			System.out.println("被拦截路径:" + uri);
			return "login";
		}
		return null;
	}

}
