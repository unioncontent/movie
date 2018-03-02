package org.union.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.GraphVO;
import org.union.domain.MediaVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeVO;

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
	public List<MediaVO> wlistSearch(SearchCriteria vo) {
		
		return session.selectList(namespace + "wlistSearch", vo);
	}
	
	@Override
	public List<MediaVO> wlistSearch2(SearchCriteria vo) {
		
		return session.selectList(namespace + "wlistSearch2", vo);
	}

	
	@Override
	public Integer wgetSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "wgetSearchCount", cri);
	}
	
	@Override
	public List<MediaVO> searchAll(SearchCriteria criteria) {

		return session.selectList(namespace + "searchAll", criteria);
	}

	public List<MediaVO> listAll(SearchCriteria cri) {

		return session.selectList(namespace + "listAll", cri);
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


	@Override
	public Integer mediaGetSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "mediaGetSearchCount", cri);
	}


	@Override
	public Integer reporterGetSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "reporterGetSearchCount", cri);
	}


	@Override
	public TextTypeVO naverMediaCount(SearchCriteria cri) {

		return session.selectOne(namespace + "naverMediaCount", cri);
	}


	@Override
	public TextTypeVO daumMediaCount(SearchCriteria cri) {

		return session.selectOne(namespace + "daumMediaCount", cri);
	}
	
	@Override
	public TextTypeVO totalMediaCount(SearchCriteria cri) {

		return session.selectOne(namespace + "totalMediaCount", cri);
	}


	@Override
	public GraphVO yesterdayCount() {

		return session.selectOne(namespace + "yesterdayCount");
	}


	@Override
	public List<MediaVO> allPageList(SearchCriteria cri) {

		return session.selectList(namespace + "allPageList", cri);
	}


	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return session.selectOne(namespace + "allPageCount", cri);
	}


	@Override
	public List<MediaVO> allPage(SearchCriteria cri) {

		return session.selectList(namespace + "allPage", cri);
	}


	@Override
	public Integer getTotalCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getTotalCount", cri);
		
	}

	@Override
	public Integer getMatchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getMatchCount", cri);
	}


	@Override
	public TextTypeVO periodTextTypeCount(SearchCriteria cri) {

		return session.selectOne(namespace + "periodTextTypeCount", cri);
	}


	@Override
	public TextTypeVO getMediaPortalCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getMediaPortalCount", cri);
	}


	@Override
	public TextTypeVO getMediaTextTypeTotalCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getMediaTextTypeTotalCount", cri);
	}


	@Override
	public TextTypeVO getMediaTextTypeSearchCount(SearchCriteria cri) {
		
		return session.selectOne(namespace + "getMediaTextTypeSearchCount", cri);
	}


	@Override
	public TextTypeVO getPressPortalCount(SearchCriteria cri) {
		
		return session.selectOne(namespace + "getPressPortalCount", cri);
	}


	@Override
	public TextTypeVO getPressTextTypeTotalCount(SearchCriteria cri) {
		
		return session.selectOne(namespace + "getPressTextTypeTotalCount", cri);
	}


	@Override
	public TextTypeVO getPressTextTypeSearchCount(SearchCriteria cri) {
		
		return session.selectOne(namespace + "getPressTextTypeSearchCount", cri);
	}


	@Override
	public List<MediaVO> wPageSearch(SearchCriteria cri) {

		return session.selectList(namespace + "wPageSearch", cri);
	}
	
	@Override
	public List<MediaVO> textTypelistSearch(SearchCriteria cri) {
		
		return session.selectList(namespace + "textTypelistSearch", cri);
	}

	@Override
	public List<MediaVO> textTypelistSearch2(SearchCriteria cri) {
		
		return session.selectList(namespace + "textTypelistSearch2", cri);
	}


	@Override
	public List<MediaVO> textTypelistSearch3(SearchCriteria cri) {
		
		return session.selectList(namespace + "textTypelistSearch3", cri);
	}


	@Override
	public List<MediaVO> textTypelistSearch4(SearchCriteria cri) {
		
		return session.selectList(namespace + "textTypelistSearch4", cri);
	}


	@Override
	public List<MediaVO> reporterGetTextTypeCount(SearchCriteria cri, String reporter, String textType) {
		
		Map data = new HashMap();
		data.put("cri", cri);
		data.put("reporter", reporter);
		data.put("textType", textType);
		
		
		return session.selectList(namespace + "reporterGetTextTypeCount", data);
	}

}
