package org.union.persistence;

import java.util.List;

import org.union.domain.MonitorVO;
import org.union.domain.PortalVO;

public interface MonitorDAO {

	
	public void create(MonitorVO vo);
	
	public List<MonitorVO> pageAll();
	
	public MonitorVO checkLast(String domain);
	
	public List<PortalVO> portalBMonitor();
	public List<PortalVO> portalCMonitor();
	public List<PortalVO> portalWMonitor();
}
