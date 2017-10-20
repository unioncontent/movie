package org.union.persistence;

import org.union.domain.CommunityVO;
import org.union.domain.SearchVO;

public interface CommunityDAO {

	
	public void create(CommunityVO vo);

	public void read(Integer community_idx);

	public void update(CommunityVO vo);

	public void delete(Integer community_idx);
	
	public void listSearch(SearchVO vo);
	
	public void updateTextType (CommunityVO vo);
	
	public void updateThumbnail (CommunityVO vo);
}
