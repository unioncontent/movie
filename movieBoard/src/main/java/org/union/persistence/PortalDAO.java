package org.union.persistence;

import java.util.Date;
import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.GraphVO;
import org.union.domain.PortalVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeDateVO;
import org.union.domain.TextTypeVO;

public interface PortalDAO {

	public void create(PortalVO vo);
	
	public PortalVO read(Integer portal_idx);
	
	public void update(PortalVO vo);
	
	public void delete(Integer portal_idx);
	
	public Integer getScoreCount(SearchCriteria cri);
	public List<PortalVO> getScoreList(SearchCriteria cri);
	public List<PortalVO> getScoreExcelList(SearchCriteria cri);
	public TextTypeVO getScoreTextType(SearchCriteria cri);
	public List<Integer> getOnlyScore(SearchCriteria cri);
	
	public Integer getTypeOfMovieCount(SearchCriteria cri);
	public Integer getTypeOfActorCount(SearchCriteria cri);
	public List<PortalVO> wPageSearch(SearchCriteria cri);
	
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
	
	public TextTypeVO blogTextTypeCount(SearchCriteria cri);
	public TextTypeVO cafeTextTypeCount(SearchCriteria cri);
	
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
	
	public List<PortalVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<PortalVO> listSearch(SearchCriteria cri);
	public Integer getSearchCount(SearchCriteria cri);

	public List<PortalVO> wlistSearch(SearchCriteria cri);
	public Integer wgetSearchCount(SearchCriteria cri);
	
	public List<PortalVO> listAll(SearchCriteria cri);
	
	public void updateTextType(PortalVO vo);
	
	public void updateThumbnail(PortalVO vo);
	
}
