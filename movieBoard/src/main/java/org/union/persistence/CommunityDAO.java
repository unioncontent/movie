package org.union.persistence;

import java.util.Date;
import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeVO;

public interface CommunityDAO {

	
	public void create(CommunityVO vo);

	public CommunityVO read(Integer community_idx);

	public void update(CommunityVO vo);

	public void delete(Integer community_idx);
	
	public List<CommunityVO> allPageList(SearchCriteria cri);
	public Integer allPageCount(SearchCriteria cri);
	
	public Integer countAll(Date date);
	
	public TextTypeVO textTypeCount(SearchCriteria cri);
	
	public List<CommunityVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<CommunityVO> listSearch(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
	
	public List<CommunityVO> listComplete(SearchCriteria cri);
	
	public Integer getCompleteCount(SearchCriteria cri);
	
	public List<CommunityVO> listAll(SearchCriteria cri);
	
	public void updateTextType (CommunityVO vo);
	
	public void updateThumbnail (CommunityVO vo);
}
