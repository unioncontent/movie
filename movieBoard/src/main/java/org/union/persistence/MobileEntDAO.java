package org.union.persistence;

import java.util.Date;
import java.util.List;

import org.union.domain.MobileEntVO;
import org.union.domain.SearchCriteria;

public interface MobileEntDAO {
	
    	public Integer getTypeOfMovieCount(SearchCriteria cri);
    	
	public Integer getTypeOfActorCount(SearchCriteria cri);
	
	public MobileEntVO read(Integer NM_idx);
	
	public List<MobileEntVO> searchList(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
	
}
