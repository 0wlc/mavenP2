package com.zc.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
/**
 * 编码过滤器
 * @author Administrator
 *
 */
public class EncodingFilter implements Filter {
	
	String encodingType;
	
	@Override
	public void init(FilterConfig fc) throws ServletException {
		String codeType = fc.getInitParameter("encodingType");
		if(codeType!=null){
			encodingType = codeType;
		}
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse rep,
			FilterChain fc) throws IOException, ServletException {
		req.setCharacterEncoding(encodingType);
		rep.setCharacterEncoding(encodingType);
		rep.setContentType(encodingType);
		fc.doFilter(req, rep);
	}

	@Override
	public void destroy() {
		System.out.println("----编码过滤器被摧毁----");
	}
}
