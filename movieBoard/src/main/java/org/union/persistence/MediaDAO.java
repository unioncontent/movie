package org.union.persistence;

import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.MediaVO;
import org.union.domain.SearchVO;

public interface MediaDAO {

	
	public void create(MediaVO vo);
	
	public MediaVO read(Integer media_idx);
	
	public void update(MediaVO vo);
	
	public void delete(Integer media_idx);
	
	public List<MediaVO> listSearch(SearchVO vo);
	
	public void updateTextType (CommunityVO vo);
	
	public void updateThumbnail (CommunityVO vo);
}
