package org.spring.controller;

import org.spring.domain.UserVO;
import org.spring.dto.SignUpDTO;
import org.spring.service.SignUpService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

@Controller
@RequestMapping("/signUp")
public class SignUpController {
	
	@Inject
	private SignUpService service;
	
	//회원가입 요청
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public ResponseEntity<String> signUp(@RequestBody SignUpDTO dto){
		
		ResponseEntity<String> entity = null;
		
		try {
			Boolean result = service.signUp(dto);
			
			if(result ==false) {
				entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
				System.out.println(entity);
				
			}else {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				System.out.println(entity);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	// 중복 ID 체크 요청
	@RequestMapping(value="/check_duplication_id", method = RequestMethod.POST)
	public ResponseEntity<String> check_duplication_id(@RequestBody SignUpDTO dto){
		
		ResponseEntity<String> entity = null;
		
		try {
			UserVO result = service.Check_duplication_Id(dto);
			System.out.println("controller result : " + result);
			
			if(result != null) {
				entity = new ResponseEntity<String>("DUPLICATED", HttpStatus.OK);
				System.out.println(entity);
			}else {
				entity = new ResponseEntity<String>("VALIED", HttpStatus.OK);
				System.out.println(entity);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
}
