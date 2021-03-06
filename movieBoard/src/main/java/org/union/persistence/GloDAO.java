package org.union.persistence;

import java.sql.SQLException;
import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.FindVO;
import org.union.domain.GloVO;
import org.union.domain.KeywordVO;
import org.union.domain.SearchCriteria;

public interface GloDAO {
	
	public void insertIp(FindVO vo) throws SQLException;
	public Integer totalCnt() throws SQLException;
	public Integer gloCnt() throws SQLException;
	public List<GloVO> gloTypeCount() throws SQLException;
	public List<GloVO> graphGloList(SearchCriteria cri) throws SQLException;
	public List<GloVO> nationList() throws SQLException;
	public List<GloVO> siteList() throws SQLException;
	public List<KeywordVO> keywordList() throws SQLException;
	public Integer graphGloCount(SearchCriteria cri) throws SQLException;
	public Integer graphKoCount(SearchCriteria cri) throws SQLException;
	
	public List<GloVO> detailList(SearchCriteria cri) throws SQLException;
	public List<GloVO> detailExcel(SearchCriteria cri) throws SQLException;
	public Integer detailCnt(SearchCriteria cri) throws SQLException;
	public void deleteGlo(Integer glo_idx) throws SQLException;
	public void updateGlo(GloVO vo) throws SQLException;
}
