package org.union.persistence;

import org.union.domain.PortalVO;
import org.union.domain.SearchVO;

public interface PortalDAO {

	
	public void create(PortalVO vo);
	
	public void read(Integer portal_idx);
	
	public void update(PortalVO vo);
	
	public void delete(Integer portal_idx);
	
	public void listSearch(SearchVO vo);
	
	public void updateTextType(PortalVO vo);
	
	public void updateThumbnail(PortalVO vo);
	
}
