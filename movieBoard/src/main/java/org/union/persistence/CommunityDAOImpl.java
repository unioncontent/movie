package org.union.persistence;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.CommunityVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeDateVO;
import org.union.domain.TextTypeVO;

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
	public List<CommunityVO> listExtract(SearchCriteria cri) {

		return session.selectList(namespace + "listExtract", cri);
	}

	
	@Override
	public Integer getExtractCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getExtractCount", cri);
	}



	@Override
	public List<CommunityVO> listSearch(SearchCriteria cri) {

		return session.selectList(namespace + "listSearch", cri); 
	}

	
	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCount", cri);
	}
	
	@Override
	public Integer getSearchCount2(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCount2", cri);
	}
	
	@Override
	public List<CommunityVO> wlistSearch(SearchCriteria cri) {

		return session.selectList(namespace + "wlistSearch", cri); 
	}

	
	@Override
	public Integer wgetSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "wgetSearchCount", cri);
	}
	
	@Override
	public List<CommunityVO> listAll(SearchCriteria cri) {

		return session.selectList(namespace + "listAll", cri);
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


	@Override
	public List<CommunityVO> listComplete(SearchCriteria cri) {

		return session.selectList(namespace + "listComplete", cri);
	}


	@Override
	public Integer getCompleteCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getCompleteCount", cri);
	}


	@Override
	public TextTypeVO textTypeCount(SearchCriteria cri) {

		return session.selectOne(namespace + "textTypeCount" ,cri);
	}


	@Override
	public Integer countAll(Date date) {

		return session.selectOne(namespace  +"countAll", date);
	}

	@Override
	public Integer showboxCountAll(Date date) {

		return session.selectOne(namespace  +"showboxCountAll", date);
	}

	@Override
	public List<CommunityVO> allPageList(SearchCriteria cri) {

		return session.selectList(namespace + "allPageList", cri);
	}
	
	@Override
	public List<CommunityVO> TotalAllPageList(SearchCriteria cri) {

		return session.selectList(namespace + "TotalAllPageList", cri);
	}


	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return session.selectOne(namespace + "allPageCount", cri);
	}
	
	@Override
	public Integer TotalAllPageCount(SearchCriteria cri) {

		return session.selectOne(namespace + "TotalAllPageCount", cri);
	}

	@Override
	public List<CommunityVO> wPageSearch(SearchCriteria cri) {

		return session.selectList(namespace + "wPageSearch", cri);
	}


	@Override
	public List<CommunityVO> allPage(SearchCriteria cri) {

		return session.selectList(namespace + "allPage", cri);
	}


	@Override
	public List<TextTypeDateVO> textTypeCount2(SearchCriteria cri) {

		return session.selectList(namespace + "textTypeCount2", cri);
	}


	@Override
	public Integer communityTextcnt(SearchCriteria cri) {

		return session.selectOne(namespace + "communityTextcnt", cri);
	}


	@Override
	public Integer communityTextcnt2(SearchCriteria cri) {

		return session.selectOne(namespace + "communityTextcnt2", cri);
	}


	@Override
	public Integer graphSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "graphSearchCount", cri);
	}


	@Override
	public List<CommunityVO> totalAllPageex(SearchCriteria cri) {

		return session.selectList(namespace + "totalAllPageex", cri);
	}


	@Override
	public List<CommunityVO> dashListAll(SearchCriteria cri) {

		return session.selectList(namespace + "dashListAll", cri);
	}


	@Override
	public Integer periodWgetSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "periodWgetSearchCount", cri);
	}


	@Override
	public List<CommunityVO> alllistExtract(SearchCriteria cri) {

		return session.selectList(namespace + "alllistExtract", cri);
	}


	@Override
	public Integer allgetExtractCount(SearchCriteria cri) {

		return session.selectOne(namespace + "allgetExtractCount", cri);
	}


	@Override
	public List<CommunityVO> alllistSearch(SearchCriteria cri) {

		return session.selectList(namespace + "alllistSearch", cri);
	}


	@Override
	public Integer allgetSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "allgetSearchCount", cri);
	}


	@Override
	public List<CommunityVO> allPageallList(SearchCriteria cri) {

		return session.selectList(namespace + "allPageallList", cri);
	}


	@Override
	public Integer allPageallCount(SearchCriteria cri) {

		return session.selectOne(namespace + "allPageallCount", cri);
	}


	@Override
	public List<CommunityVO> totalallPageallList(SearchCriteria cri) {

		return session.selectList(namespace + "totalallPageallList", cri);
	}


	@Override
	public Integer totalallPageallCount(SearchCriteria cri) {

		return session.selectOne(namespace + "totalallPageallCount", cri);
	}

}
