package com.spring.web.join.serviceImpl;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.domain.JoinVo;
import com.spring.web.domain.Search;
import com.spring.web.join.dao.JoinDao;
import com.spring.web.join.service.JoinService;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	private JoinDao joinDao;
	
	@Override
	public List<Map> joinList(Search search) throws Exception {
		
		return joinDao.JoinList();
	}

	@Override
	public void JoinRegist(JoinVo vo) throws Exception {
		joinDao.JoinRegist(vo);

	}

	@Override
	public JoinVo joinView(JoinVo vo) throws Exception {
		
		return joinDao.joinView(vo);
	}

	@Override
	public void joinDelete(String userId) throws Exception {
		joinDao.joinDelete(userId);

	}
	//로그인
	@Override
	public JoinVo login(JoinVo dto) {
		
		return joinDao.login(dto);
	}

	@Override
	public void keepLogin(String userId, String sessionId, Date next) {
		joinDao.keepLogin(userId, sessionId, next);
		
	}

	@Override
	public JoinVo checkUserWithSessionKey(String sessionId) {
		return joinDao.checkUserWithSessionKey(sessionId);
	}

}
