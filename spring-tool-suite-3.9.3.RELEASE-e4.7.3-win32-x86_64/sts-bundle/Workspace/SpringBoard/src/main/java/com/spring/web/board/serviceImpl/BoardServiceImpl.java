package com.spring.web.board.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.board.dao.BoardDao;
import com.spring.web.board.service.BoardService;
import com.spring.web.domain.BoardVo;
import com.spring.web.domain.Search;


@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Map> boardList(Search search) throws Exception {
		
		return boardDao.boardList(search);
	}

	@Override
	public List<Map> boardList2(BoardVo vo) throws Exception {
		return boardDao.boardList2(vo);
	}

	@Override
	public void boardRegist(BoardVo vo) throws Exception {
		boardDao.boardRegist(vo);
	}

	@Override
	public BoardVo boardView(BoardVo vo) throws Exception {
		return boardDao.boardView(vo);
	}

	@Override
	public void boardDelete(int aNo) throws Exception {
		boardDao.boardDelete(aNo);

	}

}
