package org.union.service;

import java.util.List;

import org.union.domain.MediaVO;
import org.union.domain.SearchVO;

public interface MediaService {

	
	public void regist(MediaVO vo);
	
	public MediaVO read(Integer media_idx);
	
	public void modify(MediaVO vo);
	
	public void remove(Integer media_idx);
	
	public List<MediaVO> listSearch(SearchVO vo);
	
	public void modifyType(MediaVO vo);
	
	public void modifyThumbnail(MediaVO vo);
	
}
