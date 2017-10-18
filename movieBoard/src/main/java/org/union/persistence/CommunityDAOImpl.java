package org.union.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.CommunityVO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mapper.CommunityMapper.";
	
	
	@Override
	public void create(CommunityVO vo) {
		
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	

	@Override
	public void read(Integer community_idx) {
		
		try {
			session.selectOne(namespace + "read", community_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

	@Override
	public void update(CommunityVO vo) {
		
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	

	@Override
	public void delete(Integer community_idx) {
		
		try {
			session.delete(namespace + "delete", community_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
