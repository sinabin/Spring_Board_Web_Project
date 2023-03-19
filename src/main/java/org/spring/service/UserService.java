package org.spring.service;

import org.spring.domain.BoardVO;
import org.spring.domain.Criteria;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;

import java.util.Date;
import java.util.List;

public interface UserService {
	
	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String user_id, String sessionId, Date next) throws Exception;
	
	public UserVO checkLoginBefore(String value);
	
	public UserVO showMyInfo(UserVO vo);
	
	List<BoardVO> showMyPost(Criteria cri);
	
	public List<UserVO> showAllUser(UserVO vo);
	
	public int updateNickName(UserVO vo);
	
	public int updatePassword(UserVO vo);
	
	public int deleteUser(UserVO vo);
	
	
}
