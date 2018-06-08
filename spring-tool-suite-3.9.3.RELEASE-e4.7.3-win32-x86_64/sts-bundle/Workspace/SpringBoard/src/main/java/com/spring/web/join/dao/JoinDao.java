package com.spring.web.join.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;
import com.spring.web.domain.JoinVo;

public interface JoinDao {
	
	//로그인
	public JoinVo login(JoinVo dto);
	
	//자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
	public void keepLogin(String userId, String sessionId, Date next);
	
	//이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
	public JoinVo checkUserWithSessionKey(String sessionId);
	
	
	
	//회원가입
	List<Map> JoinList() throws Exception;
	
	void JoinRegist(JoinVo vo) throws Exception;
	
	JoinVo joinView(JoinVo vo) throws Exception;
	
	void joinDelete(String userID) throws Exception;
	
}
