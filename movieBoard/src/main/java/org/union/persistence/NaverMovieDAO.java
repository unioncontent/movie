package org.union.persistence;

import java.util.List;

import org.union.domain.NaverMovieVO;
import org.union.domain.SearchCriteria;

public interface NaverMovieDAO {

	
	public void create(NaverMovieVO vo);
	
	public NaverMovieVO read(Integer NM_idx);

	public List<NaverMovieVO> searchAllList(SearchCriteria cri);
	
	public List<NaverMovieVO> showSearchAllList(SearchCriteria cri);
	
	public List<NaverMovieVO> searchList(SearchCriteria cri);
	
	public List<NaverMovieVO> showSearchList(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
	
}
