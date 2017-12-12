package org.union.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.NaverMovieVO;
import org.union.domain.SearchCriteria;
import org.union.persistence.NaverMovieDAO;

@Service
public class NaverMovieServiceImpl implements NaverMovieService{

	
	@Autowired
	private NaverMovieDAO naverMovieDAO;
	
	
	@Override
	public List<NaverMovieVO> searchList(SearchCriteria cri) {

		List<NaverMovieVO> list = naverMovieDAO.searchList(cri);
		
		return list;
	}

	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return naverMovieDAO.getSearchCount(cri);
	}

}
