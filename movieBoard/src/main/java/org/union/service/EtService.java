package org.union.service;

import org.union.domain.SearchCriteria;

public interface EtService {
	
	public Integer getSearchCount1(SearchCriteria cri);
	
	public Integer getSearchCount2(SearchCriteria cri);
	
	public Integer getSearchCount3(SearchCriteria cri);
	
	public Integer getSearchCountAll(SearchCriteria cri);

}
