package org.union.service;

import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.ExtractVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeVO;

public interface CommunityService {

	
	public void regist(CommunityVO vo);
	
	public CommunityVO read(Integer community_idx);
	
	public void modify(CommunityVO vo);

	public void remove(Integer community_idx);
	
	public TextTypeVO textTypeCount(SearchCriteria cri);
	
	public List<ExtractVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<CommunityVO> listSearch(SearchCriteria vo);
	
	public Integer getSearchCount(SearchCriteria cri);
	
	public List<CommunityVO> listComplete(SearchCriteria cri);
	
	public Integer getCompleteCount(SearchCriteria cri);
	
	public List<CommunityVO> listAll(SearchCriteria cri);
	
	public void modifyType (CommunityVO vo);
	
	public void modifyThumbnail (CommunityVO vo);
	
}
