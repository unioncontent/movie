package org.union.persistence;

import java.util.List;

import org.union.domain.GraphVO;
import org.union.domain.SearchCriteria;
import org.union.domain.ViralVO;

public interface ViralDAO {

	
	public void create(ViralVO vo);
	
	public ViralVO read(Integer biral_idx);
	
	public void update(ViralVO vo);
	
	public void delete(Integer biral_idx);
	
	public List<ViralVO> searchInList(SearchCriteria cri);
	
	public List<ViralVO> searchOutList(SearchCriteria cri);
	
	public List<ViralVO> searchAllList(SearchCriteria cri);
	
	public Integer getSearchInCount(SearchCriteria cri);
	
	public Integer getSearchOutCount(SearchCriteria cri);
	
	public List<ViralVO> historyPage(SearchCriteria cri);
	
	public Integer getHistoryCount(SearchCriteria cri);
	
	public List<GraphVO> getHistoryRank (String url);
}
