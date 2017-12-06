package org.union.service;

import java.util.List;

import org.union.domain.MonitorVO;

public interface MonitorService {
	
	
	public void insert(MonitorVO vo);
	
	public List<MonitorVO> pageAll();

}
