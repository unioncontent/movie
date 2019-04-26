package org.union.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.GloVO;
import org.union.domain.KeywordVO;
import org.union.domain.SearchCriteria;
import org.union.persistence.GloDAO;

@Service
public class GloServiceImpl implements GloService {
	
	@Autowired
	private GloDAO gloDAO;

	@Override
	public Integer totalCnt() throws SQLException {
		return gloDAO.totalCnt();
	}

	@Override
	public Integer gloCnt() throws SQLException {
		return gloDAO.gloCnt();
	}

	@Override
	public List<GloVO> gloTypeCount() throws SQLException {
		return gloDAO.gloTypeCount();
	}

	@Override
	public Integer graphGloCount(SearchCriteria cri) throws SQLException {
		return gloDAO.graphGloCount(cri);
	}

	@Override
	public Integer graphKoCount(SearchCriteria cri) throws SQLException {
		return gloDAO.graphKoCount(cri);
	}

	@Override
	public List<GloVO> graphGloList(SearchCriteria cri) throws SQLException {
		return gloDAO.graphGloList(cri);
	}

	@Override
	public List<GloVO> nationList() throws SQLException {
		return gloDAO.nationList();
	}

	@Override
	public List<GloVO> siteList() throws SQLException {
		return gloDAO.siteList();
	}

	@Override
	public List<GloVO> detailList(SearchCriteria cri) throws SQLException {
		return gloDAO.detailList(cri);
	}

	@Override
	public Integer detailCnt(SearchCriteria cri) throws SQLException {
		return gloDAO.detailCnt(cri);
	}

	@Override
	public void deleteGlo(Integer glo_idx) throws SQLException {
		gloDAO.deleteGlo(glo_idx);
	}

	@Override
	public void modifyGlo(GloVO vo) throws SQLException {
		gloDAO.updateGlo(vo);;
	}

	@Override
	public List<GloVO> detailExcel(SearchCriteria cri) throws SQLException {
		return gloDAO.detailExcel(cri);
	}

	@Override
	public List<KeywordVO> keywordList() throws SQLException {
		return gloDAO.keywordList();
	}
}
