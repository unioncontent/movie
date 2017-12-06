package org.union.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.MonitorVO;

@Repository
public class MonitorDAOImpl implements MonitorDAO{

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mapper.MonitorMapper.";
	
	@Override
	public void create(MonitorVO vo) {

		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<MonitorVO> pageAll() {

		return session.selectList(namespace + "pageAll");
	}

	@Override
	public MonitorVO checkLast(String domain) {

		return session.selectOne(namespace + "checkLast", domain);
	}

}
