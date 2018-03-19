package org.union.service;

import java.util.Date;
import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.ExtractVO;
import org.union.domain.GraphVO;
import org.union.domain.PortalVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeDateVO;
import org.union.domain.TextTypeVO;

public interface PortalService {

	public void regist(PortalVO vo);
	
	public PortalVO view(Integer portal_idx);
	
	public void modify(PortalVO vo);
	
	public void remove(Integer portal_idx);
	
	public Integer getScoreCount(SearchCriteria cri);
	public List<PortalVO> getScoreList(SearchCriteria cri);
	public TextTypeVO getScoreTextType(SearchCriteria cri);
	public Integer getOnlyScore(SearchCriteria cri);
	public List<PortalVO> wPageSearch(SearchCriteria cri);
	
	public Integer getTypeOfMovieCount(SearchCriteria cri);
	public Integer getTypeOfActorCount(SearchCriteria cri);
	
	public List<PortalVO> allPageList(SearchCriteria cri);
	public List<PortalVO> TotalAllPageList(SearchCriteria cri);
	public Integer allPageCount(SearchCriteria cri);
	public Integer TotalAllPageCount(SearchCriteria cri);
	public List<PortalVO> allPage(SearchCriteria cri);
	
	public Integer countAll(Date date);
	public Integer showboxCountAll(Date date);
	
	public GraphVO toDayCount(String type);
	public GraphVO showboxToDayCount(String type);
	
	public GraphVO yesterdayCount();
	public GraphVO showboxYesterdayCount();
	
	public TextTypeVO textTypeCount(SearchCriteria cri);
	public List<TextTypeDateVO> textTypeCount2(SearchCriteria cri);
	
	public TextTypeVO blogTextType(SearchCriteria cri);
	public TextTypeVO cafeTextType(SearchCriteria cri);
	
	public List<PortalVO> listNaver(SearchCriteria cri);
	public Integer getNaverCount(SearchCriteria cri);
	public List<TextTypeVO> naverTextTypeCountb(SearchCriteria cri);
	public List<TextTypeVO> naverTextTypeCountc(SearchCriteria cri);
	public List<TextTypeVO> naverTextTypeCountk(SearchCriteria cri);
	public List<TextTypeVO> naverTextTypeCountw(SearchCriteria cri);
	
	public List<PortalVO> listDaum(SearchCriteria cri);
	public Integer getDaumCount(SearchCriteria cri);
	public List<TextTypeVO> daumTextTypeCountb(SearchCriteria cri);
	public List<TextTypeVO> daumTextTypeCountc(SearchCriteria cri);
	public List<TextTypeVO> daumTextTypeCountk(SearchCriteria cri);
	public List<TextTypeVO> daumTextTypeCountw(SearchCriteria cri);
	
	public List<ExtractVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<PortalVO> listSearch(SearchCriteria vo);
	
	public Integer getSearchCount(SearchCriteria cri);

	public List<PortalVO> wlistSearch(SearchCriteria vo);
	
	public Integer wgetSearchCount(SearchCriteria cri);
	
	public List<PortalVO> listAll(SearchCriteria cri);
	
	public void modifyType(PortalVO vo);
	
	public void modifyThumbnail(PortalVO vo);
	
}
