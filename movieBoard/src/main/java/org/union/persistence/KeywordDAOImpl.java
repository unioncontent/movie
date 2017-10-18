package org.union.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.KeywordVO;

@Repository
public class KeywordDAOImpl implements KeywordDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mapper.KeywordMapper.";
	
	
	@Override
	public void create(KeywordVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void read(Integer keyword_idx) {
		try {
			session.selectOne(namespace + "read", keyword_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void update(KeywordVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Integer keyword_idx) {
		try {
			session.delete(namespace + "delete", keyword_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
