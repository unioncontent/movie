package org.union.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.CommunityVO;
import org.union.domain.MediaVO;
import org.union.domain.MonitorVO;
import org.union.domain.PortalVO;
import org.union.domain.SNSVO;


@Repository
public class MonitorDAOImpl implements MonitorDAO{

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mapper.MonitorMapper.";
	
	@Override
	public void create(MonitorVO vo) {

		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<MonitorVO> pageAll() {

		return session.selectList(namespace + "pageAll");
	}

	@Override
	public MonitorVO checkLast(String domain) {

		return session.selectOne(namespace + "checkLast", domain);
	}
	
	@Override
	public PortalVO checkLast2(String portal_type) {

		return session.selectOne(namespace + "checkLast2", portal_type);
	}
	
	@Override
	public SNSVO checkLast3(String sns_name) {
		
		return session.selectOne(namespace + "checkLast3", sns_name);
	}
	
	@Override
	public MediaVO checkLast4(String media_name) {
		
		return session.selectOne(namespace + "checkLast4", media_name);
	}
	
	@Override
	public CommunityVO checkLast5(String community_name) {
		
		return session.selectOne(namespace + "checkLast5", community_name);
	}

	@Override
	public List<PortalVO> portalBMonitor() {
		return session.selectList(namespace + "portalBMonitor");			
	}
	
	@Override
	public List<PortalVO> portalCMonitor() {
		return session.selectList(namespace + "portalCMonitor");			
	}
	
	@Override
	public List<PortalVO> portalWMonitor() {
		return session.selectList(namespace + "portalWMonitor");			
	}
	
	@Override
	public List<PortalVO> portalBMonitor2() {
		return session.selectList(namespace + "portalBMonitor2");			
	}
	
	@Override
	public List<PortalVO> portalCMonitor2() {
		return session.selectList(namespace + "portalCMonitor2");			
	}
	
	@Override
	public List<PortalVO> portalWMonitor2() {
		return session.selectList(namespace + "portalWMonitor2");			
	}

	@Override
	public List<SNSVO> snsMonitorf() {
		return session.selectList(namespace + "snsMonitorf");			
	}

	@Override
	public List<SNSVO> snsMonitori() {
		return session.selectList(namespace + "snsMonitori");			
	}

	@Override
	public List<SNSVO> snsMonitort() {
		return session.selectList(namespace + "snsMonitort");			
	}

	@Override
	public List<MediaVO> mediaMonitor(String media) {
		return session.selectList(namespace + "mediaMonitor", media);
	}

	@Override
	public List<CommunityVO> communityMonitor(String community) {
		return session.selectList(namespace + "communityMonitor", community);
	}
}
