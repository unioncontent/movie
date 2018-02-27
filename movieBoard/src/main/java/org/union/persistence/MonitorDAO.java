package org.union.persistence;

import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.MediaVO;
import org.union.domain.MonitorVO;
import org.union.domain.PortalVO;
import org.union.domain.SNSVO;

public interface MonitorDAO {

	
	public void create(MonitorVO vo);
	
	public List<MonitorVO> pageAll();
	
	public MonitorVO checkLast(String domain);
	public PortalVO checkLast2(String portal_type);
	public SNSVO checkLast3(String sns_name);
	public MediaVO checkLast4(String media_name);
	public CommunityVO checkLast5(String community_name);
	
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
