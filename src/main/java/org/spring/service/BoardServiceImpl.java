package org.spring.service;

import org.spring.domain.BoardVO;
import org.spring.domain.Criteria;
import org.spring.persistence.BoardDAO;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository // To managed by Spring 
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;

	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(Criteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(Criteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public void increaseReadNum(BoardVO vo) throws Exception {
		dao.increaseReadNum(vo);	
	}

}
