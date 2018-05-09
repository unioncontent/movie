package org.union.service;

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

		return mobileEntDAO.searchList(cri);
	}
	
	
	@Override
	public List<MobileEntVO> searchAllList(SearchCriteria cri) {

		return mobileEntDAO.searchAllList(cri);
	}

	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return mobileEntDAO.getSearchCount(cri);
	}

	@Override
	public Integer MgetTypeOfMovieCount(SearchCriteria cri) {

		return mobileEntDAO.MgetTypeOfMovieCount(cri);
	}

	@Override
	public Integer MgetTypeOfActorCount(SearchCriteria cri) {

		return mobileEntDAO.MgetTypeOfActorCount(cri);
	}

	@Override
	public List<MobileEntVO> MsearchList(SearchCriteria cri) {

		return mobileEntDAO.MsearchList(cri);
	}

	@Override
	public List<MobileEntVO> MsearchAllList(SearchCriteria cri) {

		return mobileEntDAO.MsearchAllList(cri);
	}

	@Override
	public Integer MgetSearchCount(SearchCriteria cri) {

		return mobileEntDAO.MgetSearchCount(cri);
	}

}
