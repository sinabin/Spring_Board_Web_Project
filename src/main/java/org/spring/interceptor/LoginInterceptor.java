package org.spring.interceptor;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";
	private static final Logger logger= LoggerFactory.getLogger(LoginInterceptor.class);
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception{
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");
		System.out.println(userVO);
		
		if(userVO != null) {
			System.out.println("new login is success");
			session.setAttribute(LOGIN, userVO);
			response.sendRedirect("/");
		}
		
		if(userVO == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out =response.getWriter();
            out.println("<script>alert('로그인 정보가 올바르지 않습니다. 아이디와 비밀번호를 확인해주세요.');"
            		+ "history.go(-1);</script>");
            out.flush(); 
		}
		
		System.out.println("postHandle is called");
	}
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();

		if(session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
	
	
}
