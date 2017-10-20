package org.union.service;

import java.util.List;

import org.union.domain.PortalVO;
import org.union.domain.SearchVO;

public interface PortalService {

	
	public void regist(PortalVO vo);
	
	public PortalVO read(Integer portal_idx);
	
	public void modify(PortalVO vo);
	
	public void remove(Integer portal_idx);
	
	public List<PortalVO> listSearch(SearchVO vo);
	
	public void modifyType(PortalVO vo);
	
	public void modifyThumbnail(PortalVO vo);
	
}
