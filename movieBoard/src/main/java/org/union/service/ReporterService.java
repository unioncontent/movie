package org.union.service;


import java.util.List;

import org.union.domain.ReporterVO;
import org.union.domain.SearchCriteria;

public interface ReporterService {

	
	public void insert(ReporterVO vo);
	
	public List<ReporterVO> listSearch(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
}
