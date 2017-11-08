package org.union.service;

import java.util.List;

import org.union.domain.ExtractVO;
import org.union.domain.PortalVO;
import org.union.domain.SearchCriteria;

public interface PortalService {

	
	public void regist(PortalVO vo);
	
	public PortalVO view(Integer portal_idx);
	
	public void modify(PortalVO vo);
	
	public void remove(Integer portal_idx);
	
	public List<ExtractVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<PortalVO> listSearch(SearchCriteria vo);
	
	public Integer getSearchCount(SearchCriteria cri);
	
	public void modifyType(PortalVO vo);
	
	public void modifyThumbnail(PortalVO vo);
	
}
