package org.union.persistence;

import org.union.domain.CommunityVO;
import org.union.domain.MediaVO;
import org.union.domain.SearchVO;

public interface MediaDAO {

	
	public void create(MediaVO vo);
	
	public void read(Integer media_idx);
	
	public void update(MediaVO vo);
	
	public void delete(Integer media_idx);
	
	public void listSearch(SearchVO vo);
	
	public void updateTextType (CommunityVO vo);
	
	public void updateThumbnail (CommunityVO vo);
}
