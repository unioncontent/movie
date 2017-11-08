package org.union.persistence;

import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.SearchCriteria;

public interface CommunityDAO {

	
	public void create(CommunityVO vo);

	public CommunityVO read(Integer community_idx);

	public void update(CommunityVO vo);

	public void delete(Integer community_idx);
	
	public List<CommunityVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<CommunityVO> listSearch(SearchCriteria cri);
	
	public void updateTextType (CommunityVO vo);
	
	public void updateThumbnail (CommunityVO vo);
}
