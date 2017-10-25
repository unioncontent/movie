package org.union.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.PortalVO;
import org.union.domain.SearchCriteria;

@Repository
public class PortalDAOImpl implements PortalDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.PortalMapper.";
	
	
	@Override
	public void create(PortalVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public PortalVO read(Integer portal_idx) {
		
		return session.selectOne(namespace + "read", portal_idx);
			
	}

	
	@Override
	public void update(PortalVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void delete(Integer portal_idx) {
		try {
			session.delete(namespace + "delete", portal_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public List<PortalVO> listSearch(SearchCriteria vo) {
		
		return session.selectList(namespace + "listSearch", vo);
	}


	@Override
	public void updateTextType(PortalVO vo) {
		try {
			session.update(namespace + "updateTextType", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void updateThumbnail(PortalVO vo) {
		try {
			session.update(namespace + "updateThumbnail", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
