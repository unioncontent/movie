package org.union.service;

import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.MediaVO;
import org.union.domain.MonitorVO;
import org.union.domain.PortalVO;
import org.union.domain.SNSVO;

public interface MonitorService {
	
	
	public void insert(MonitorVO vo);
	
	public List<MonitorVO> pageAll();
	
	public List<PortalVO> portalBMonitor();
	public List<PortalVO> portalCMonitor();
	public List<PortalVO> portalWMonitor();
	public List<PortalVO> portalBMonitor2();
	public List<PortalVO> portalCMonitor2();
	public List<PortalVO> portalWMonitor2();
	
	public List<SNSVO> snsMonitorf();
	public List<SNSVO> snsMonitori();
	public List<SNSVO> snsMonitort();
	
	public List<MediaVO> mediaMonitor(String media);
	
	public List<CommunityVO> communityMonitor(String community);

}
