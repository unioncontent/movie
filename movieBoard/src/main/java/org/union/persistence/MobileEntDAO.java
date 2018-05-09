package org.union.persistence;

import java.util.List;

import org.union.domain.MobileEntVO;
import org.union.domain.SearchCriteria;

public interface MobileEntDAO {
	
    public Integer getTypeOfMovieCount(SearchCriteria cri);
    	
	public Integer getTypeOfActorCount(SearchCriteria cri);
	
	public MobileEntVO read(Integer NM_idx);
	
	public List<MobileEntVO> searchList(SearchCriteria cri);
	
	public List<MobileEntVO> searchAllList(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
	
	
	public Integer MgetTypeOfMovieCount(SearchCriteria cri);
	
	public Integer MgetTypeOfActorCount(SearchCriteria cri);
	
	public List<MobileEntVO> MsearchList(SearchCriteria cri);
	
	public List<MobileEntVO> MsearchAllList(SearchCriteria cri);
	
	public Integer MgetSearchCount(SearchCriteria cri);
	
}
