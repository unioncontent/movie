package org.union.service;

import java.util.List;

import org.union.domain.GraphVO;
import org.union.domain.SearchCriteria;
import org.union.domain.ViralVO;

public interface ViralService {
	

	public List<ViralVO> searchInList(SearchCriteria cri);

	public List<ViralVO> searchOutList(SearchCriteria cri);
	
	public List<ViralVO> searchAllList(SearchCriteria cri);

	public Integer getSearchInCount(SearchCriteria cri);

	public Integer getSearchOutCount(SearchCriteria cri);
	
	public Integer getHistoryCount(SearchCriteria cri);
	
	public List<GraphVO> getHistoryRank(String url);
}
