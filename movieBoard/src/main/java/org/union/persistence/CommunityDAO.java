package org.union.persistence;

import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.SearchVO;

public interface CommunityDAO {

	
	public void create(CommunityVO vo);

	public CommunityVO read(Integer community_idx);

	public void update(CommunityVO vo);

	public void delete(Integer community_idx);
	
	public List<CommunityVO> listSearch(SearchVO vo);
	
	public void updateTextType (CommunityVO vo);
	
	public void updateThumbnail (CommunityVO vo);
}
