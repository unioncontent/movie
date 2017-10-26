package org.union.service;

import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.SearchCriteria;

public interface CommunityService {

	
	public void regist(CommunityVO vo);
	
	public CommunityVO read(Integer community_idx);
	
	public void modify(CommunityVO vo);

	public void remove(Integer community_idx);
	
	public List<CommunityVO> listSearch(SearchCriteria vo);
	
	public void modifyType (CommunityVO vo);
	
	public void modifyThumbnail (CommunityVO vo);
	
}
