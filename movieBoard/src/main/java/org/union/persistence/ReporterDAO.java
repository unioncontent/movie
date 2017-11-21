package org.union.persistence;

import java.util.List;

import org.union.domain.ReporterVO;

public interface ReporterDAO {

	
	public void create(ReporterVO vo);
	
	public ReporterVO read(Integer reporter_idx);
	
	public void update(ReporterVO vo);
	
	public void delete(Integer reporter_idx);
	
	public List<ReporterVO> listAll();
	
	public List<ReporterVO> listChecked();
	
}
