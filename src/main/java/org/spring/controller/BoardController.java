package org.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.domain.BoardVO;
import org.spring.domain.Criteria;
import org.spring.domain.UserVO;
import org.spring.service.BoardService;
import org.spring.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	private BoardService service;
	
	@Inject
	private UserService service2;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, BoardVO vo, Model model) throws Exception {
		
		// 1. 조회수를 증가시킨다음
		service.increaseReadNum(vo);
		
		// 2. read service를 실행
		model.addAttribute(service.read(bno));
		
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, Criteria cri, RedirectAttributes rttr) throws Exception {

		service.remove(bno); // delete sql execute

		rttr.addAttribute("page", cri.getPage()); // transport data to jsp about page information
		rttr.addAttribute("perPageNum", cri.getPerPageNum()); // transport data to jsp about page information
		rttr.addAttribute("msg", "SUCCESS"); // transport data to jsp about well done

		return "redirect:/user/myPost";

	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(BoardVO board,HttpSession session, Model model) throws Exception {
		logger.info("register get.....");
		Object obj = session.getAttribute("login");
		System.out.println("register controller : " + obj);
		if (obj != null) { // login status
			UserVO vo = (UserVO) obj;
			model.addAttribute("UserInfo", service2.showMyInfo(vo));
			System.out.println("register controller service result : " + service2.showMyInfo(vo));
		}
	}

	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(BoardVO board,  Model model,RedirectAttributes rttr) throws Exception {
		logger.info("regist post");
		logger.info(board.toString());
		
		service.regist(board); 
		rttr.addFlashAttribute("msg", "success");
	
		return "redirect:/"; 
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyGET(int bno, Model model) throws Exception{
		model.addAttribute("BoardVO" , service.read(bno));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
		logger.info("mod post ........");
		
		service.modify(board);
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/user/myPost";
	}
	
}
