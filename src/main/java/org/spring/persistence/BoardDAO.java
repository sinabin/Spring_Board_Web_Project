package org.spring.persistence;

import java.util.List;

import org.spring.domain.BoardVO;
import org.spring.domain.Criteria;

public interface BoardDAO {
	public void create(BoardVO vo) throws Exception;

	public BoardVO read(Integer bno) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(Integer bno) throws Exception;

	public List<BoardVO> listPage(int page) throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	public List<BoardVO> listSearch(Criteria cri) throws Exception;

	public int listSearchCount(Criteria cri) throws Exception;
	
	public void increaseReadNum(BoardVO vo) throws Exception;
	
	public BoardVO showViewCount(BoardVO vo) throws Exception;
	
	
}
