package com.spring.web.board.service;

import java.util.List;
import java.util.Map;

import com.spring.web.domain.BoardVo;
import com.spring.web.domain.Search;

public interface BoardService {
	
	public List<Map> boardList(Search search) throws Exception;

	public List<Map> boardList2(BoardVo vo) throws Exception;
	
	public void boardRegist(BoardVo vo) throws Exception;
	
	public BoardVo boardView(BoardVo vo) throws Exception;
	
	public void boardDelete(int bno) throws Exception;
	
}
