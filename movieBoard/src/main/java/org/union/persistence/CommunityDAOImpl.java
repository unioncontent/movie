package org.union.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.CommunityVO;
import org.union.domain.SearchCriteria;

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
	public CommunityVO read(Integer community_idx) {
		
		return session.selectOne(namespace + "read", community_idx);
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


	@Override
	public List<CommunityVO> listSearch(SearchCriteria vo) {

		return session.selectList(namespace + "listSearch", vo); 
	}


	@Override
	public void updateTextType(CommunityVO vo) {
		try {
			session.update(namespace + "updateTextType", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void updateThumbnail(CommunityVO vo) {
		try {
			session.update(namespace + "updateThumbnail", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
