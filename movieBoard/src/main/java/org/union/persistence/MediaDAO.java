package org.union.persistence;

import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.MediaVO;
import org.union.domain.SearchCriteria;

public interface MediaDAO {

	
	public void create(MediaVO vo);
	
	public MediaVO read(Integer media_idx);
	
	public void update(MediaVO vo);
	
	public void delete(Integer media_idx);
	
	public List<MediaVO> listSearch(SearchCriteria criteria);
	
	public List<MediaVO> searchAll(SearchCriteria criteria);
	
	public Integer getTotalCount();
	
	public Integer mediaGetTotalCount(SearchCriteria criteria);
	
	public Integer reporterGetTotalCount(SearchCriteria criteria);
	
	public void updateTextType (MediaVO vo);
	
	public void updateThumbnail (MediaVO vo);
}
