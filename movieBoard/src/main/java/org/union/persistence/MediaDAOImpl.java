package org.union.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.MediaVO;
import org.union.domain.SearchCriteria;

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
	public MediaVO read(Integer media_idx) {

		return session.selectOne(namespace + "read", media_idx);
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
	
	@Override
	public List<MediaVO> listExtract(SearchCriteria cri) {

		return session.selectList(namespace + "listExtract", cri);
	}

	@Override
	public Integer getExtractCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getExtractCount", cri);
	}



	@Override
	public List<MediaVO> listSearch(SearchCriteria vo) {

		return session.selectList(namespace + "listSearch", vo);
	}

	
	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCount", cri);
	}
	
	
	@Override
	public List<MediaVO> searchAll(SearchCriteria criteria) {

		return session.selectList(namespace + "searchAll", criteria);
	}

	
	@Override
	public Integer getTotalCount() {

		return session.selectOne(namespace + "getTotalCount");
	}
	
	
	
	@Override
	public Integer mediaGetTotalCount(SearchCriteria criteria) {

		return session.selectOne(namespace + "mediaGetTotalCount", criteria);
	}


	@Override
	public Integer reporterGetTotalCount(SearchCriteria criteria) {

		return session.selectOne(namespace + "reporterGetTotalCount", criteria);
	}
	

	@Override
	public void updateTextType(MediaVO vo) {
		try {
			session.update(namespace + "updateTextType", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void updateThumbnail(MediaVO vo) {
		try {
			session.update(namespace + "updateThumbnail", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
