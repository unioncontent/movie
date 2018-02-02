package org.union.service;

import java.util.List;

import org.union.domain.MobileEntVO;
import org.union.domain.SearchCriteria;

public interface MobileEntService {
    
    	public Integer getTypeOfMovieCount(SearchCriteria cri);
    	
	public Integer getTypeOfActorCount(SearchCriteria cri);
	
	public List<MobileEntVO> searchList(SearchCriteria cri);
	
	public List<MobileEntVO> searchAllList(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
}
