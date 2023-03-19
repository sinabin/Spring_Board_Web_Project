package org.spring.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.spring.domain.BoardVO;
import org.springframework.stereotype.Repository;
import org.spring.domain.Criteria;


@Repository // To managed by Spring 
public class BoardDAOImpl implements BoardDAO {
    @Inject
    private SqlSession session; // Because DB is accessed through xml file, it needs to be declared.

    private static String namespace = "org.spring.mapper.BoardMapper";

    @Override
    public void create(BoardVO vo) throws Exception {
        session.insert(namespace+".create", vo);
    }

    @Override
    public BoardVO read(Integer bno) throws Exception {
        return session.selectOne(namespace+".read", bno);
    }

    @Override
    public void update(BoardVO vo) throws Exception {
        session.update(namespace+".update", vo);
    }

    @Override
    public void delete(Integer bno) throws Exception {
        session.update(namespace+".delete", bno);
    }

	@Override
	public List<BoardVO> listPage(int page) throws Exception {
		if(page <= 0) {
			page=1;
		}
		
		page = (page-1) * 10;
		return session.selectList(namespace+".listpage", page);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}
	
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}
	
	@Override
	public List<BoardVO> listSearch(Criteria cri) throws Exception {
		return session.selectList(namespace+".listSearch", cri);
	}
	
	@Override
	public int listSearchCount(Criteria cri) throws Exception {
		return session.selectOne(namespace+".listSearchCount", cri);
		
	}

	@Override
	public void increaseReadNum(BoardVO vo) throws Exception {
		session.insert(namespace+".increseReadNum", vo);
	}

	@Override
	public BoardVO showViewCount(BoardVO vo) throws Exception {
		return null;
	}


}
