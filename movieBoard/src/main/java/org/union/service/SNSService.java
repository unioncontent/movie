package org.union.service;

import java.util.List;

import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;

public interface SNSService {

	
	public void regist(SNSVO vo);
	
	public SNSVO view(Integer SNS_idx);
	
	public void modify(SNSVO vo);
	
	public void remove(Integer SNS_idx);
	
	public List<SNSVO> listSearch (SearchCriteria cri);
	
	public Integer getTotalCount(SearchCriteria  cri);
	
	public void modifyTextType(SNSVO vo);
	
	public void modifyThumbnail(SNSVO vo);
	
}
