package org.union.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.RelationVO;

@Repository
public class RelationDAOImpl implements RelationDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.RelationMapper.";
	
	
	@Override
	public void create(RelationVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public RelationVO read(Integer relation_idx) {

		return session.selectOne(namespace + "read", relation_idx);
	}

	
	@Override
	public void update(RelationVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void delete(Integer relation_idx) {
		try {
			session.delete(namespace + "delete", relation_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public Integer todayCount() {

		return session.selectOne(namespace + "todayCount");
	}

}
