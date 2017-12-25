package org.union.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.ReporterVO;
import org.union.domain.SearchCriteria;
import org.union.persistence.ReporterDAO;

@Service
public class ReporterServiceImpl implements ReporterService {

	
	@Autowired
	private ReporterDAO reporterDAO;
	
	@Override
	public void insert(ReporterVO vo) {

		reporterDAO.create(vo);
	}

	@Override
	public List<ReporterVO> listSearch(SearchCriteria cri) {

		return reporterDAO.listSearch(cri);
	}

	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return reporterDAO.getSearchCount(cri);
	}

	@Override
	public ReporterVO readByName(String reporter_name) {

		return reporterDAO.readByName(reporter_name);
	}

}
