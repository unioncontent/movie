package org.union.persistence;

import java.util.List;

import org.union.domain.MonitorVO;

public interface MonitorDAO {

	
	public void create(MonitorVO vo);
	
	public List<MonitorVO> pageAll();
	
	public MonitorVO checkLast(String domain);
}
