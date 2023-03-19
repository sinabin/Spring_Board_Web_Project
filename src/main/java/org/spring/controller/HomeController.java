package org.spring.controller;

import org.spring.domain.Criteria;
import org.spring.domain.PageMaker;
import org.spring.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;


@Controller
public class HomeController {

	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.listSearchCriteria(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		
		return "index";
	}

	@RequestMapping(value = "/pn", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") Criteria cri, @RequestParam int perPageNum, Model model) throws Exception {
		cri.setPerPageNum(perPageNum);
		model.addAttribute("list", service.listSearchCriteria(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		
		return "index";
	}
	
}
