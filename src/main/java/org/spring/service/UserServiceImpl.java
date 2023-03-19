package org.spring.service;

import org.spring.domain.BoardVO;
import org.spring.domain.Criteria;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.spring.persistence.UserDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO dao;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void keepLogin(String user_id, String sessionId, Date next) throws Exception {
		dao.keepLogin(user_id, sessionId, next);
	}

	@Override
	public UserVO checkLoginBefore(String value) {
		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public UserVO showMyInfo(UserVO vo) {
		return dao.showMyInfo(vo);
	}



	@Override
	public List<UserVO> showAllUser(UserVO vo) {
		return dao.showAllUser(vo);
	}

	@Override
	public int updateNickName(UserVO vo) {
		return dao.updateNickName(vo);
		
	}

	@Override
	public int updatePassword(UserVO vo) {
		return dao.updatePassword(vo);
		
	}

	@Override
	public int deleteUser(UserVO vo) {
		return dao.deleteUser(vo);
		
	}

	@Override
	public List<BoardVO> showMyPost(Criteria cri){ 
		return dao.showMyPost(cri);
	}



	


}
