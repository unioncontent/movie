package org.union.persistence;

import java.util.Date;
import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeDateVO;
import org.union.domain.TextTypeVO;

public interface CommunityDAO {

	public void create(CommunityVO vo);

	public CommunityVO read(Integer community_idx);

	public void update(CommunityVO vo);

	public void delete(Integer community_idx);
	
	public List<CommunityVO> totalallPageallList(SearchCriteria cri);
	public Integer totalallPageallCount(SearchCriteria cri);
	public List<CommunityVO> allPageallList(SearchCriteria cri);
	public Integer allPageallCount(SearchCriteria cri);
	
	public List<CommunityVO> allPageList(SearchCriteria cri);
	public List<CommunityVO> TotalAllPageList(SearchCriteria cri);
	public Integer allPageCount(SearchCriteria cri);
	public Integer TotalAllPageCount(SearchCriteria cri);
	public List<CommunityVO> allPage(SearchCriteria cri);
	public List<CommunityVO> totalAllPageex(SearchCriteria cri);
	
	public Integer countAll(Date date);
	public Integer showboxCountAll(Date date);
	
	public TextTypeVO textTypeCount(SearchCriteria cri);
	
	public List<CommunityVO> listExtract(SearchCriteria cri);
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<CommunityVO> alllistExtract(SearchCriteria cri);
	public Integer allgetExtractCount(SearchCriteria cri);
	
	public List<CommunityVO> alllistSearch(SearchCriteria cri);
	public Integer allgetSearchCount(SearchCriteria cri);
	
	public List<CommunityVO> listSearch(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
	public Integer getSearchCount2(SearchCriteria cri);

	public List<CommunityVO> wlistSearch(SearchCriteria cri);
	public List<CommunityVO> wPageSearch(SearchCriteria cri);
	
	public Integer wgetSearchCount(SearchCriteria cri);
	public Integer periodWgetSearchCount(SearchCriteria cri);
	
	
	public List<CommunityVO> listComplete(SearchCriteria cri);
	
	public Integer getCompleteCount(SearchCriteria cri);
	
	public List<CommunityVO> listAll(SearchCriteria cri);
	public List<CommunityVO> dashListAll(SearchCriteria cri);
	
	public void updateTextType (CommunityVO vo);
	
	public void updateThumbnail (CommunityVO vo);
	
	public List<TextTypeDateVO> textTypeCount2(SearchCriteria cri);
	
	public Integer communityTextcnt(SearchCriteria cri);
	public Integer communityTextcnt2(SearchCriteria cri);
	
	public Integer graphSearchCount(SearchCriteria cri);
}
