package org.union.service;

import java.util.List;

import org.union.domain.ExtractVO;
import org.union.domain.MediaVO;
import org.union.domain.PeriodMediaVO;
import org.union.domain.SearchCriteria;

public interface MediaService {

	
	public void regist(MediaVO vo);
	
	public MediaVO view(Integer media_idx);
	
	public void modify(MediaVO vo);
	
	public void remove(Integer media_idx);
	
	public List<ExtractVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<MediaVO> listSearch(SearchCriteria criteria);
	
	public List<PeriodMediaVO> periodMedia(SearchCriteria criteria);
	
	public List<PeriodMediaVO> periodReporter(SearchCriteria criteria);
	
	public Integer getTotalCount();
	
	public Integer mediaGetTotalCount(SearchCriteria criteria);
	
	public Integer reporterGetTotalCount(SearchCriteria criteria);
	
	public void modifyType(MediaVO vo);
	
	public void modifyThumbnail(MediaVO vo);
	
}
