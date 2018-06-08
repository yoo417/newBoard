package com.spring.web.join.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.domain.JoinVo;

@Service("joinDao")
public class JoinDaoImpl implements JoinDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String Name_Space ="com.spring.web.mapper.joinMapper.";
	
	@Override
	public List<Map> JoinList() throws Exception {
		return sqlSession.selectList(Name_Space+"joinList");
	}

	@Override
	public void JoinRegist(JoinVo vo) throws Exception {
		sqlSession.insert(Name_Space+"joinRegist",vo);

	}

	@Override
	public JoinVo joinView(JoinVo vo) throws Exception {
		
		return sqlSession.selectOne(Name_Space+"joinView", vo);
	}

	@Override
	public void joinDelete(String userID) throws Exception {
		sqlSession.delete(Name_Space+"joinDelete", userID);
		
	}
	
	@Inject
	SqlSession sql;
	//login에 성공하면, 유저 정보를 담고 있는 userVo 객체를 반환한다.
	@Override
	public JoinVo login(JoinVo dto) {
		// Mapper의 namespace명 id 
		return sql.selectOne(Name_Space+"login", dto);
	}

	//자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
	@Override
	public void keepLogin(String userId, String sessionId, Date next) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("sessionId", sessionId);
		map.put("next", next);
		// Mapper.xml로 데이터를 전달할 때 한 객체밖에 전달 못함으로 map으로 묶어서 보내줌 단... 주의할 점은
        // Mapper.xml 안에서 #{} 이 안에 지정한 이름이랑 같아야함.. 자동으로 매핑될 수 있도록
        // 아래가 수행되면서, 사용자 테이블에 세션id와 유효시간이 저장됨
 
		sql.update(Name_Space+"keepLogin", map);
	}
	
	//이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크
	@Override
	public JoinVo checkUserWithSessionKey(String sessionId) {
		// 유효시간이 남아있고(>now()) 전달받은 세션id와 일치하는 사용자 정보를 꺼낸다.
		return sql.selectOne(Name_Space+"checkUserWithSessionKey", sessionId);
	}

}
