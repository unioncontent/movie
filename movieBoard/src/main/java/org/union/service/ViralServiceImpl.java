package org.union.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.GraphVO;
import org.union.domain.SearchCriteria;
import org.union.domain.ViralVO;
import org.union.persistence.ViralDAO;

@Service
public class ViralServiceImpl implements ViralService {

	
	@Autowired
	private ViralDAO viralDAO;
	
	
	@Override
	public List<ViralVO> searchInList(SearchCriteria cri) {

		return viralDAO.searchInList(cri);
	}

	@Override
	public List<ViralVO> searchOutList(SearchCriteria cri) {

		return viralDAO.searchOutList(cri);
	}

	@Override
	public List<ViralVO> searchAllList(SearchCriteria cri) {

		return viralDAO.searchAllList(cri);
	}
	
	@Override
	public Integer getSearchInCount(SearchCriteria cri) {

		return viralDAO.getSearchInCount(cri);
	}

	@Override
	public Integer getSearchOutCount(SearchCriteria cri) {

		return viralDAO.getSearchOutCount(cri);
	}

	@Override
	public Integer getHistoryCount(SearchCriteria cri) {

		return viralDAO.getHistoryCount(cri);
	}

	@Override
	public List<GraphVO> getHistoryRank(String url) {

		return viralDAO.getHistoryRank(url);
	}

	@Override
	public List<ViralVO> historyPage(SearchCriteria cri) {

		return viralDAO.historyPage(cri);
	}

}
