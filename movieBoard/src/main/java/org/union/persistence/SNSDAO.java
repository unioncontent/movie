package org.union.persistence;

import java.util.List;

import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;

public interface SNSDAO {

	
	public void create(SNSVO vo);
	
	public SNSVO read(Integer SNS_idx);
	
	public void update(SNSVO vo);
	
	public void delete(Integer SNS_idx);
	
	public List<SNSVO> listSearch(SearchCriteria cri);
	
	public Integer getTotalCount(SearchCriteria  cri);
	
	public void updateTextType(SNSVO vo);
	
	public void updateThumbnail(SNSVO vo);
	
}
