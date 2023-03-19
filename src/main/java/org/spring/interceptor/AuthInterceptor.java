package org.spring.interceptor;

import org.spring.domain.UserVO;
import org.spring.service.UserService;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	@Inject
	private UserService service;
	
	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI(); // req.getRequestURI : 요청된 URL을 반환시켜줌
		
		String query = req.getQueryString(); // req.getQueryString : URL뒤에 queryParameter를 반환시켜줌
		
		if(query ==null || query.equals("null")) { //query String 처리
			query = "";
		}else {
			query = "?"+query;
		}
		
		if(req.getMethod().equals("GET")) {
			System.out.println("dest : " + (uri+query));
			req.getSession().setAttribute("dest", uri+query);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {
			System.out.println("current user is not logined");
			
			saveDest(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCooki");
			if(loginCookie != null) { //Session에 login객체가 없는데 loginCookie는 있는 상황 : 이전에 로그인을 한 적이 있을 수 있는 상황 
				UserVO userVO = service.checkLoginBefore(loginCookie.getValue());
				
				if(userVO != null) { 
					session.setAttribute("login", userVO);
					return true; //이전에 로그인을 한 적이 있다면 login success 처리
				}
			}
			
			
			// session에 login객체도 없고 loginCookie도 없는 즉 로그인과 관련된 아무런 정보가 없는 상태이므로 : login fail 처리
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out =response.getWriter();
            out.println("<script>alert('로그인이 필요합니다.');"
            		+ "history.go(-1);</script>");
            out.flush(); 
			return false; 
		}
		
		return true; // session에 login객체는 존재하므로 login success 처리
	}


}
