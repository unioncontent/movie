package org.union.persistence;

import org.union.domain.SearchCriteria;

public interface EtDAO {

	
	public Integer getSearchCount1(SearchCriteria cri);
	
	public Integer getSearchCount2(SearchCriteria cri);
	
	public Integer getSearchCount3(SearchCriteria cri);
	
	public Integer getSearchCountAll(SearchCriteria cri);
	
	
	
}
