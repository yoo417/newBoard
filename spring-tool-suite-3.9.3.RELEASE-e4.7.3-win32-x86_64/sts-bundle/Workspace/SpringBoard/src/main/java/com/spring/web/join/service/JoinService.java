package com.spring.web.join.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.spring.web.domain.BoardVo;
import com.spring.web.domain.JoinVo;
import com.spring.web.domain.Search;

public interface JoinService {
	
	//로그인
	public JoinVo login(JoinVo dto);
	
	//자동로그인 체크한 경우에 사용자 테이블에 세션과 유효기간을 저장하기 위한 메서드
	public void keepLogin(String userId, String sessionId, Date next);
	
	//이전에 로그인한 적이 있는지 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
	public JoinVo checkUserWithSessionKey(String sessionId);
	
	//회원가입
	public List<Map> joinList(Search search) throws Exception;
	
	public void JoinRegist(JoinVo vo) throws Exception;
	
	public JoinVo joinView(JoinVo vo) throws Exception;
	
	public void joinDelete(String userId) throws Exception;
	
}
