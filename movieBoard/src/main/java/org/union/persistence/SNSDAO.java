package org.union.persistence;

import java.util.List;

import org.union.domain.GraphVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;

public interface SNSDAO {

	
	public void create(SNSVO vo);
	
	public SNSVO read(Integer SNS_idx);
	
	public void update(SNSVO vo);
	
	public void delete(Integer SNS_idx);
	
	public List<SNSVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<SNSVO> listSearch(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
	
	public List<SNSVO> facebookList(SearchCriteria cri);
	
	public Integer facebookTotalCount(SearchCriteria  cri);
	
	public List<SNSVO> instaList(SearchCriteria cri);
	
	public Integer instaTotalCount(SearchCriteria cri);
	
	public List<SNSVO> twitterList(SearchCriteria cri);
	
	public Integer twitterTotalCount(SearchCriteria cri);
	
	public List<SNSVO> getDateCount(GraphVO vo);
	
	public void updateTextType(SNSVO vo);
	
	public void updateThumbnail(SNSVO vo);
	
}
