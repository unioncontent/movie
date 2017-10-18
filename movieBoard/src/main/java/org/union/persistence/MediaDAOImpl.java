package org.union.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.MediaVO;

@Repository
public class MediaDAOImpl implements MediaDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.MediaMapper.";
	
	
	@Override
	public void create(MediaVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	@Override
	public void read(Integer media_idx) {
		try {
			session.selectOne(namespace + "read", media_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	@Override
	public void update(MediaVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void delete(Integer media_idx) {
		try {
			session.delete(namespace + "delete", media_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}

}
