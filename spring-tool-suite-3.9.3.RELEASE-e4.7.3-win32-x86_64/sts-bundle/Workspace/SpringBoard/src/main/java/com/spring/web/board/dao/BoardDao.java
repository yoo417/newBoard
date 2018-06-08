package com.spring.web.board.dao;

import java.util.List;
import java.util.Map;
import com.spring.web.domain.BoardVo;
import com.spring.web.domain.Search;

public interface BoardDao {
	
	List<Map> boardList(Search search) throws Exception;
	
	void boardRegist(BoardVo vo) throws Exception;
	
	BoardVo boardView(BoardVo vo) throws Exception;
	
	void boardDelete(int bno) throws Exception;
	
	List<Map> boardList2(BoardVo vo) throws Exception;	
	
}
