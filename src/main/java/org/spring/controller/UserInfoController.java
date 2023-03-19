package org.spring.controller;

import org.spring.domain.UserVO;
import org.spring.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController {
	
	@Inject
	UserService service;
	
	// 닉네임 수정
	@RequestMapping(value="/updateNick", method = RequestMethod.POST)
	public ResponseEntity<String> updateNickName(@RequestBody UserVO vo){
		
		ResponseEntity<String> entity = null;
		
		try {
			int result = service.updateNickName(vo);
			System.out.println("udapteNick controller result : " + result);
			
			if(result != 0) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				System.out.println(entity);
			}else {
				entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
				System.out.println(entity);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 패스워드 변경
	@RequestMapping(value="/updatePassword", method = RequestMethod.POST)
	public ResponseEntity<String> updatePassword(@RequestBody UserVO vo){
		
		ResponseEntity<String> entity = null;
		
		try {
			int result = service.updatePassword(vo);
			System.out.println("패스워드 변경 controller result : " + result);
			
			if(result != 0) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				System.out.println(entity);
			}else {
				entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
				System.out.println(entity);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	// 회원탈퇴
	@RequestMapping(value="/deleteUser", method = RequestMethod.POST)
	public ResponseEntity<String> deleteUser(@RequestBody UserVO vo){
		
		ResponseEntity<String> entity = null;
		
		try {
			int result = service.deleteUser(vo);
			System.out.println("deleteUser controller result : " + result);
			
			if(result != 0) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				System.out.println(entity);
			}else {
				entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
				System.out.println(entity);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
}
