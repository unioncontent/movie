package org.union.persistence;

import java.util.List;

import org.union.domain.MediaVO;
import org.union.domain.PortalVO;
import org.union.domain.SearchCriteria;

public interface PortalDAO {

	
	public void create(PortalVO vo);
	
	public PortalVO read(Integer portal_idx);
	
	public void update(PortalVO vo);
	
	public void delete(Integer portal_idx);
	
	public List<PortalVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<PortalVO> listSearch(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
	
	public List<PortalVO> listAll(SearchCriteria cri);
	
	public void updateTextType(PortalVO vo);
	
	public void updateThumbnail(PortalVO vo);
	
}
