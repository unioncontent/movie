package org.union.service;

import java.util.List;

import org.union.domain.MonitorVO;
import org.union.domain.PortalVO;

public interface MonitorService {
	
	
	public void insert(MonitorVO vo);
	
	public List<MonitorVO> pageAll();
	
	public List<PortalVO> portalBMonitor();
	public List<PortalVO> portalCMonitor();
	public List<PortalVO> portalWMonitor();

}
