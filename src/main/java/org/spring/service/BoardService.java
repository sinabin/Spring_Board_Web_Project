package org.spring.service;

import org.spring.domain.BoardVO;
import org.spring.domain.Criteria;

import java.util.List;

public interface BoardService {
	public void regist(BoardVO boardVO) throws Exception;

	public BoardVO read(Integer bno) throws Exception;

	public void modify(BoardVO boardVO) throws Exception;

	public void remove(Integer bno) throws Exception;

	List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception;
	
	public List<BoardVO> listSearchCriteria(Criteria cri) throws Exception;
	
	public int listSearchCount(Criteria cri) throws Exception;
	
	public void increaseReadNum(BoardVO vo) throws Exception;
	

}
