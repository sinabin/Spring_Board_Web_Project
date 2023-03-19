package org.spring.service;

import org.spring.domain.UserVO;
import org.spring.dto.SignUpDTO;
import org.spring.persistence.UserDAO;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

// 굳이 책에서 처럼 interface를 작성하고 또 구현 클래스 작성하는 것은 비효율적이라 생각함
// (어차피 서비스 하나이고 이 서비스 객체를 다른 객체에 주입할 일은 없다고 판단함)


@Repository
public class SignUpService {
	
	@Inject
	private UserDAO dao;
	
	public boolean signUp(SignUpDTO dto) throws Exception {
		
		boolean result = dao.signUp(dto);
		
		if(result == false) { //실패시
			return false;
		}
		return true;
	}
	
	public UserVO Check_duplication_Id(SignUpDTO dto) {
		System.out.println("service return : " + dao.Check_duplication_Id(dto));
		return dao.Check_duplication_Id(dto);
	}
	
}
