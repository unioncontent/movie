package org.union.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.MobileEntVO;
import org.union.domain.SearchCriteria;
import org.union.persistence.MobileEntDAO;

@Service
public class MobileEntServiceImpl implements MobileEntService{

	
	@Autowired
	private MobileEntDAO mobileEntDAO;
		
	@Override
	public Integer getTypeOfMovieCount(SearchCriteria cri) {

		return mobileEntDAO.getTypeOfMovieCount(cri);
	}

	@Override
	public Integer getTypeOfActorCount(SearchCriteria cri) {

		return mobileEntDAO.getTypeOfActorCount(cri);
	}
	
	@Override
	public List<MobileEntVO> searchList(SearchCriteria cri) {

		List<MobileEntVO> list = mobileEntDAO.searchList(cri);
		
		return list;
	}

	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return mobileEntDAO.getSearchCount(cri);
	}

}
