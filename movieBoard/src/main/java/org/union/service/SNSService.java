package org.union.service;

import java.util.Date;
import java.util.List;

import org.union.domain.ExtractVO;
import org.union.domain.GraphVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;

public interface SNSService {

	
	public void regist(SNSVO vo);
	
	public SNSVO view(Integer SNS_idx);
	
	public void modify(SNSVO vo);
	
	public void remove(Integer SNS_idx);
	
	public Integer countAll(Date date);
	
	public GraphVO yesterdayCount(String name);
	
	public GraphVO facebookSum(SearchCriteria cri); 
	public GraphVO twitterSum(SearchCriteria cri); 
	public GraphVO instagramSum(SearchCriteria cri); 
	
	public List<SNSVO> listSearch(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
	
	public List<SNSVO> listExcel(SearchCriteria cri);
	
	public Integer listExcelCount(SearchCriteria cri);
	
	public List<ExtractVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<SNSVO> listAll(SearchCriteria cri);
	
	public List<SNSVO> facebookList (SearchCriteria cri);
	
	public Integer facebookTotalCount(SearchCriteria  cri);
	
	public List<SNSVO> instaList(SearchCriteria  cri);
	
	public Integer instaTotalCount(SearchCriteria  cri);
	
	public List<SNSVO> twitterList(SearchCriteria  cri);
	
	public Integer twitterTotalCount(SearchCriteria  cri);
	
	public List<SNSVO> getDateCount(GraphVO vo);
	
	public void modifyTextType(SNSVO vo);
	
	public void modifyThumbnail(SNSVO vo);
	
}
