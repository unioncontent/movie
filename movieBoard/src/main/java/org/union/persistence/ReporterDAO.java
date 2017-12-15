package org.union.persistence;

import java.util.List;

import org.union.domain.ReporterVO;
import org.union.domain.SearchCriteria;

public interface ReporterDAO {

	
	public void create(ReporterVO vo);
	
	public ReporterVO read(Integer reporter_idx);
	
	public ReporterVO readByName(String reporter_name);
	
	public void update(ReporterVO vo);
	
	public void delete(Integer reporter_idx);
	
	public List<ReporterVO> listSearch(SearchCriteria cri);
	public Integer getSearchCount(SearchCriteria cri);
	
	public List<ReporterVO> listAll();
	
	public List<ReporterVO> listChecked();
	
}
