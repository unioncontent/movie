package org.union.service;

import java.util.List;

import org.union.domain.MediaVO;
import org.union.domain.SearchCriteria;

public interface MediaService {

	
	public void regist(MediaVO vo);
	
	public MediaVO view(Integer media_idx);
	
	public void modify(MediaVO vo);
	
	public void remove(Integer media_idx);
	
	public List<MediaVO> listSearch(SearchCriteria vo);
	
	public void modifyType(MediaVO vo);
	
	public void modifyThumbnail(MediaVO vo);
	
}
