package org.union.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.ReporterVO;

@Repository
public class ReporterDAOImpl implements ReporterDAO {
	
	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.ReporterMapper.";
	
	
	@Override
	public void create(ReporterVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void read(Integer reporter_idx) {
		try {
			session.selectOne(namespace + "read", reporter_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void update(ReporterVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void delete(Integer reporter_idx) {
		try {
			session.delete(namespace + "delete", reporter_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
