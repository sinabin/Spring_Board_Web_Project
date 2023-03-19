package org.spring.controller;

import org.spring.domain.Criteria;
import org.spring.domain.PageMaker;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.spring.service.BoardService;
import org.spring.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private UserService service;
	
	@Inject
	private BoardService service2;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, HttpSession session, Model model) throws Exception {

		UserVO vo = service.login(dto);

		if (vo == null) {
			System.out.println("RequestMapping : vo is null");
			return;
		}

		model.addAttribute("userVO", vo);

		System.out.println("RequestMapping : loginPost is called");
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		Object obj = session.getAttribute("login"); // why should be used Object? => cuz getAttribute Method returned
													// Object dataType.

		if (obj != null) {
			UserVO vo = (UserVO) obj;

			session.removeAttribute("login");
			session.invalidate(); // Disable and suspend the session object
			response.sendRedirect("/");
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUser_id(), session.getId(), new Date());
			}
		}

	}

	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public String showMyInfo(HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");
		System.out.println("myInfo controller : " + obj);
		if (obj != null) { // login status

			UserVO vo = (UserVO) obj;
			model.addAttribute("UserInfo", service.showMyInfo(vo));
			System.out.println("service result : " + service.showMyInfo(vo));
		}
		return "user/myinfo";

	}

	@RequestMapping(value = "/myPost", method = RequestMethod.GET)
	public String showMyPost(@ModelAttribute("cri") Criteria cri,
			HttpSession session, Model model)
			throws Exception {
		
		Object obj = session.getAttribute("login");
		System.out.println("Obj :" + obj);
		
		UserVO vo = (UserVO) obj;
		System.out.println("vo.getUser_id : " + vo.getUser_id());
		
		cri.setUser_id(vo.getUser_id());
		
		System.out.println(cri.getUser_id()+cri.getPage()+cri.getPageStart());
		if (obj != null) { // login status

			model.addAttribute("UserMyPost", service.showMyPost(cri));
			System.out.println("MyPost controller result : " + service.showMyPost(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			pageMaker.setTotalCount(service2.listCountCriteria(cri));

			model.addAttribute("pageMaker", pageMaker);
		}
		return "user/mypost";
	}
	
	@RequestMapping(value = "/adminPage", method = RequestMethod.GET)
	public String showAdminPage(HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");
		System.out.println("myInfo controller : " + obj);
		if (obj != null) { // login status

			UserVO vo = (UserVO) obj;
			model.addAttribute("AdminInfo", service.showAllUser(vo));
			System.out.println("service result : " + service.showAllUser(vo));
		}
		return "user/adminPage";

	}
	
	@RequestMapping(value = "/updatePassword", method = RequestMethod.GET)
	public String gotoUpdatePasswordPost(HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");
		System.out.println("myInfo controller : " + obj);
		if (obj != null) { // login status

			UserVO vo = (UserVO) obj;
			model.addAttribute("AdminInfo", service.showAllUser(vo));
			System.out.println("service result : " + service.showAllUser(vo));
		}
		return "user/updatePasswordPost";

	}
	

	

}
