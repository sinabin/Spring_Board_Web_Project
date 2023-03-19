package org.spring.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.spring.domain.BoardVO;
import org.spring.domain.Criteria;
import org.spring.domain.UserVO;
import org.spring.dto.LoginDTO;
import org.spring.dto.SignUpDTO;
import org.springframework.stereotype.Repository;

@Repository // To managed by Spring 
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session; // Because DB is accessed through xml file, it needs to be declared.
	
	private static String namespace = "org.spring.mapper.UserMapper";
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace + ".login", dto);
	}

	@Override
	public void keepLogin(String user_id, String sessionId, Date next) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		session.update(namespace+".keepLogin", paramMap);
		
	}

	@Override
	public UserVO checkUserWithSessionKey(String value) {
		return session.selectOne(namespace+".checkUserWithSessionKey", value);
	}


	@Override
	public UserVO Check_duplication_Id(SignUpDTO dto) {
		System.out.println(namespace + ".checkDuplicationId");
		System.out.println("String Test : " + session.selectOne(namespace + ".checkDuplicationId", "testid"));
		System.out.println("DAO return : " + session.selectOne(namespace + ".checkDuplicationId", dto));
		return session.selectOne(namespace + ".checkDuplicationId", dto);
		
	}

	@Override
	public boolean signUp(SignUpDTO dto) {
		int result = session.insert(namespace+".signUp", dto);
		System.out.println(result);
		
		if(result == 0) {
			return false; //회원가입 실패
		}
		
		return true; //회원가입 성공
	}


	@Override
	public UserVO showMyInfo(UserVO vo) {
		return session.selectOne(namespace+".showMyInfo", vo);
	}

	@Override
	public List<BoardVO> showMyPost(Criteria cri) {
		return session.selectList(namespace+".showMyPost", cri);
	}

	@Override
	public List<UserVO> showAllUser(UserVO vo) {
		return session.selectList(namespace+".showAllUser", vo);
	}

	@Override
	public int updateNickName(UserVO vo) {
		return session.update(namespace+".updateNickName", vo);
	}

	@Override
	public int updatePassword(UserVO vo) {
		return session.update(namespace+".updatePassword", vo);
		
	}

	@Override
	public int deleteUser(UserVO vo) {
		return session.delete(namespace+".deleteUser", vo);
	}

}
