package org.union.service;

import java.util.List;

import org.union.domain.GraphVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;

public interface SNSService {

	
	public void regist(SNSVO vo);
	
	public SNSVO view(Integer SNS_idx);
	
	public void modify(SNSVO vo);
	
	public void remove(Integer SNS_idx);
	
	public List<SNSVO> facebookList (SearchCriteria cri);
	
	public Integer facebookTotalCount(SearchCriteria  cri);
	
	public List<SNSVO> instaList(SearchCriteria  cri);
	
	public Integer instaTotalCount(SearchCriteria  cri);
	
	public List<SNSVO> twitterList(SearchCriteria  cri);
	
	public Integer twitterTotalCount(SearchCriteria  cri);
	
	public List<SNSVO> getDateCount(GraphVO vo);
	
	public void modifyTextType(SNSVO vo);
	
	public void modifyThumbnail(SNSVO vo);
	
}
