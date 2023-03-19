package org.spring.persistence;

import java.util.Date;
import java.util.List;

import org.spring.domain.BoardVO;
import org.spring.domain.Criteria;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.spring.dto.SignUpDTO;

public interface UserDAO {

	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String user_id, String sessionId, Date next);
	
	public UserVO checkUserWithSessionKey(String value);
	
	public boolean signUp(SignUpDTO dto);
	
	public UserVO Check_duplication_Id(SignUpDTO dto);
	
	public UserVO showMyInfo(UserVO vo);
	
	public List<UserVO> showAllUser(UserVO vo);
	
	public int updateNickName(UserVO vo);
	
	public int updatePassword(UserVO vo);
	
	public int deleteUser(UserVO vo);

	List<BoardVO> showMyPost(Criteria cri);
}
