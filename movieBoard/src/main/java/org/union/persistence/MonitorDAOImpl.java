package org.union.persistence;

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

}
