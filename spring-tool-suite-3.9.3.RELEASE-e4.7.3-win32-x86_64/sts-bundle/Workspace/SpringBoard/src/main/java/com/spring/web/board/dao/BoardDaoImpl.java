package com.spring.web.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.domain.BoardVo;
import com.spring.web.domain.Search;

@Service("boardDao")
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String Name_Space ="com.spring.web.mapper.boardMapper.";
	
	@Override
	//검색어 있는 경우
	public List<Map> boardList(Search search) throws Exception {
		
		return sqlSession.selectList(Name_Space+"boardList",search);
	}
	@Override
	public List<Map> boardList2(BoardVo vo) throws Exception {
	
		return sqlSession.selectList(Name_Space+"boardList",vo);
	}

	@Override
	public void boardRegist(BoardVo vo) throws Exception {
		
		sqlSession.insert(Name_Space+"boardRegist", vo);
	}

	@Override
	public BoardVo boardView(BoardVo vo) throws Exception {
		
		return sqlSession.selectOne(Name_Space+"boardView", vo);
	}

	@Override
	public void boardDelete(int bno) throws Exception {
		sqlSession.delete(Name_Space+"boardDelete", bno);
		
	}


}
