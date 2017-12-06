package org.union.persistence;

import java.util.Date;
import java.util.List;

import org.union.domain.GraphVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;

public interface SNSDAO {

	
	public void create(SNSVO vo);
	
	public SNSVO read(Integer SNS_idx);
	
	public void update(SNSVO vo);
	
	public void delete(Integer SNS_idx);
	
	public List<SNSVO> allPageList(SearchCriteria cri);
	public Integer allPageCount(SearchCriteria cri);
	
	public Integer countAll(Date date);
	
	public GraphVO yesterdayCount(String name);
	
	public GraphVO facebookSum(SearchCriteria cri); 
	public GraphVO twitterSum(SearchCriteria cri); 
	public GraphVO instagramSum(SearchCriteria cri); 
	
	public List<SNSVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<SNSVO> listSearch(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);

	public List<SNSVO> listExcel(SearchCriteria cri);
	
	public Integer listExcelCount(SearchCriteria cri);
	
	public List<SNSVO> listAll(SearchCriteria cri);
	
	public List<SNSVO> facebookList(SearchCriteria cri);
	
	public Integer facebookTotalCount(SearchCriteria  cri);
	
	public List<SNSVO> instaList(SearchCriteria cri);
	
	public Integer instaTotalCount(SearchCriteria cri);
	
	public List<SNSVO> twitterList(SearchCriteria cri);
	
	public Integer twitterTotalCount(SearchCriteria cri);
	
	public List<SNSVO> getDateCount(SearchCriteria cri);
	
	public void updateTextType(SNSVO vo);
	
	public void updateThumbnail(SNSVO vo);
	
}
