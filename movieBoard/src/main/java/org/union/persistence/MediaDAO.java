package org.union.persistence;

import java.util.List;

import org.union.domain.GraphVO;
import org.union.domain.MediaVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeVO;

public interface MediaDAO {

	
	public void create(MediaVO vo);
	
	public MediaVO read(Integer media_idx);
	
	public void update(MediaVO vo);
	
	public void delete(Integer media_idx);
	
	public TextTypeVO periodTextTypeCount(SearchCriteria cri);
	
	public List<MediaVO> allPageList(SearchCriteria cri);
	public Integer allPageCount(SearchCriteria cri);
	
	public List<MediaVO> allPage(SearchCriteria cri);
	
	public GraphVO yesterdayCount();
	
	public TextTypeVO naverMediaCount(SearchCriteria cri);
	public TextTypeVO daumMediaCount(SearchCriteria cri);
	
	public List<MediaVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<MediaVO> listSearch(SearchCriteria cri);
	public Integer getSearchCount(SearchCriteria cri);

	public List<MediaVO> wlistSearch(SearchCriteria cri);
	public List<MediaVO> wlistSearch2(SearchCriteria cri);
	public List<MediaVO> wPageSearch(SearchCriteria cri);
	public Integer wgetSearchCount(SearchCriteria cri);
	
	
	public List<MediaVO> listAll(SearchCriteria cri);
	
	public List<MediaVO> searchAll(SearchCriteria cri);
	
	public Integer getTotalCount(SearchCriteria cri);
	public Integer getMatchCount(SearchCriteria cri);
	
	public Integer mediaGetTotalCount(SearchCriteria cri);
	
	public Integer reporterGetTotalCount(SearchCriteria cri);
	
	public Integer mediaGetSearchCount(SearchCriteria cri);
	
	public Integer reporterGetSearchCount(SearchCriteria cri);
	
	public void updateTextType (MediaVO vo);
	
	public void updateThumbnail (MediaVO vo);
	
	public TextTypeVO getMediaPortalCount(SearchCriteria cri);
	public TextTypeVO getMediaTextTypeTotalCount(SearchCriteria cri);
	public TextTypeVO getMediaTextTypeSearchCount(SearchCriteria cri);
	
	public TextTypeVO getPressPortalCount(SearchCriteria cri);
	public TextTypeVO getPressTextTypeTotalCount(SearchCriteria cri);
	public TextTypeVO getPressTextTypeSearchCount(SearchCriteria cri);
	
}
