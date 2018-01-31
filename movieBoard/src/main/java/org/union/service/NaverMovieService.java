package org.union.service;

import java.util.List;

import org.union.domain.NaverMovieVO;
import org.union.domain.SearchCriteria;

public interface NaverMovieService {
	
	public List<NaverMovieVO> searchList(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
}
