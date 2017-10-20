package org.union.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.SNSVO;
import org.union.domain.SearchVO;

@Repository
public class SNSDAOImpl implements SNSDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.SNSMapper.";
	
	
	@Override
	public void create(SNSVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public SNSVO read(Integer SNS_idx) {
		
		return session.selectOne(namespace + "read", SNS_idx);
	}

	
	@Override
	public void update(SNSVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void delete(Integer SNS_idx) {
		try {
			session.delete(namespace + "delete", SNS_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public List<SNSVO> listSearch(SearchVO vo) {
		
		return session.selectList(namespace + "listSearch", vo);
	}


	@Override
	public void updateTextType(SNSVO vo) {
		try {
			session.update(namespace + "updateTextType", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void updateThumbnail(SNSVO vo) {
		try {
			session.update(namespace + "updateThumbnail", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
