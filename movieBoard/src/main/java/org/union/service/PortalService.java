package org.union.service;

import java.util.List;

import org.union.domain.ExtractVO;
import org.union.domain.PortalVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeVO;

public interface PortalService {

	
	public void regist(PortalVO vo);
	
	public PortalVO view(Integer portal_idx);
	
	public void modify(PortalVO vo);
	
	public void remove(Integer portal_idx);
	
	public List<PortalVO> listNaver(SearchCriteria cri);
	public Integer getNaverCount(SearchCriteria cri);
	public List<TextTypeVO> naverTextTypeCount(String type);
	
	public List<PortalVO> listDaum(SearchCriteria cri);
	public Integer getDaumCount(SearchCriteria cri);
	public List<TextTypeVO> daumTextTypeCount(String type);
	
	public List<ExtractVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<PortalVO> listSearch(SearchCriteria vo);
	
	public Integer getSearchCount(SearchCriteria cri);
	
	public List<PortalVO> listAll(SearchCriteria cri);
	
	public void modifyType(PortalVO vo);
	
	public void modifyThumbnail(PortalVO vo);
	
}
