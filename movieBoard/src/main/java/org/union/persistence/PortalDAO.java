package org.union.persistence;

import java.util.Date;
import java.util.List;

import org.union.domain.GraphVO;
import org.union.domain.PortalVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeVO;

public interface PortalDAO {

	
	public void create(PortalVO vo);
	
	public PortalVO read(Integer portal_idx);
	
	public void update(PortalVO vo);
	
	public void delete(Integer portal_idx);
	
	public List<PortalVO> allPageList(SearchCriteria cri);
	public Integer allPageCount(SearchCriteria cri);
	
	public Integer countAll(Date date);
	
	public GraphVO toDayCount(String type);
	
	public GraphVO yesterdayCount();
	
	public TextTypeVO textTypeCount(SearchCriteria cri);
	
	public TextTypeVO blogTextTypeCount(SearchCriteria cri);
	public TextTypeVO cafeTextTypeCount(SearchCriteria cri);
	
	public List<PortalVO> listNaver(SearchCriteria cri);
	public Integer getNaverCount(SearchCriteria cri);
	public List<TextTypeVO> naverTextTypeCount(String type);
	
	public List<PortalVO> listDaum(SearchCriteria cri);
	public Integer getDaumCount(SearchCriteria cri);
	public List<TextTypeVO> daumTextTypeCount(String type);
	
	public List<PortalVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<PortalVO> listSearch(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
	
	public List<PortalVO> listAll(SearchCriteria cri);
	
	public void updateTextType(PortalVO vo);
	
	public void updateThumbnail(PortalVO vo);
	
}
