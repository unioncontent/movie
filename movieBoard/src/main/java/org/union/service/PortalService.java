package org.union.service;

import java.util.Date;
import java.util.List;

import org.union.domain.CommunityVO;
import org.union.domain.ExtractVO;
import org.union.domain.FvVO;
import org.union.domain.GraphVO;
import org.union.domain.NvVO;
import org.union.domain.PortalVO;
import org.union.domain.ScoreVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SearchFv;
import org.union.domain.TextTypeDateVO;
import org.union.domain.TextTypeVO;

public interface PortalService {

	public void regist(PortalVO vo);
	
	public PortalVO view(Integer portal_idx);
	
	public void modify(PortalVO vo);
	
	public void remove(Integer portal_idx);
	
	public void scoreCheckList(Integer portal_idx);
	public void scoreCheckDelete(Integer portal_idx);
	public void scoreUpdate(Integer portal_idx);
	public void scoreUpdate2(Integer portal_idx);
	
	public Integer getScoreCount(SearchCriteria cri);
	public List<PortalVO> getScoreList(SearchCriteria cri);
	public List<PortalVO> getScoreExcelList(SearchCriteria cri);
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
	public List<PortalVO> totalAllPageex(SearchCriteria cri);
	
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
	public List<PortalVO> periodWlistSearch(SearchCriteria cri);
	public Integer periodWgetSearchCount(SearchCriteria cri);
	
	public List<PortalVO> listAll(SearchCriteria cri);
	public List<PortalVO> listAllEx(SearchCriteria cri);
	public List<PortalVO> dashListAll(SearchCriteria cri);
	
	public void modifyType(PortalVO vo);
	
	public void modifyThumbnail(PortalVO vo);
	
	public List<NvVO> naverVideosList(SearchCriteria cri);
	public List<NvVO> naverVideosallList(SearchCriteria cri);
	public List<NvVO> naverVideosList2(SearchCriteria cri);
	public List<NvVO> naverVideosallList2(SearchCriteria cri);
	public Integer naverVideosListTotalCnt(SearchCriteria cri);
	public Integer naverVideosListTotalCnt2(SearchCriteria cri);
	public List<NvVO> nvlistSearch(SearchCriteria cri);
	public List<NvVO> nvlistSearchEx(SearchCriteria cri);
	public Integer nvlistSearchTotalCnt(SearchCriteria cri);
	public List<NvVO> nvlistSearchList(SearchCriteria cri);
	public Integer nvlistSearchListTotalCnt(SearchCriteria cri);
	public Integer nvlistViewCnt(SearchFv fv);
	public Integer nvlistReply_cnt(SearchFv fv);
	public Integer nvlistlike_cnt(SearchFv fv);
	public List<NvVO> nvlistPlus(SearchCriteria cri);
	public List<NvVO> nvlistlimt(SearchCriteria cri);
	public List<NvVO> nvlistMinus2(SearchCriteria cri);
	public List<NvVO> nvlistMinus(SearchCriteria cri);
	public List<NvVO> nvlistSearchTime(SearchCriteria cri);
	public List<NvVO> nvSearchlistSearchTime(SearchCriteria cri);
	public List<NvVO> nvlistOne(SearchCriteria cri);
	public List<NvVO> nvlistTwo(SearchFv fv);
	public List<NvVO> nvlistGraph(SearchFv fv);
	
	public Integer scoreTotalcnt(SearchCriteria cri);
	
	public Integer portalTextcnt(SearchCriteria cri);
	public Integer portalTextcnt2(SearchCriteria cri);
	
	public Integer graphNaverCount(SearchCriteria cri);
	public Integer graphDaumCount(SearchCriteria cri);
	
	public List<ScoreVO> scoreListReport(SearchCriteria cri);
	public Integer getNvCount(String url);
	
	public List<NvVO> nvlistSearch2(SearchCriteria cri);
	public List<NvVO> nvlistSearchList2(SearchCriteria cri);
	public List<NvVO> nvlistMinus3(SearchCriteria cri);
	public List<NvVO> nvlistSearchTime2(SearchCriteria cri);
	public Integer nvlistSearchTotalCnt2(SearchCriteria cri);
	
	public Integer nvlistViewCnt2(SearchFv fv);
	public Integer nvlistReply_cnt2(SearchFv fv);
	public Integer nvlistlike_cnt2(SearchFv fv);
	
	public List<NvVO> nvlistSearchEx2(SearchCriteria cri);
	public List<NvVO> nvlistPlus2(SearchCriteria cri);
	public List<NvVO> nvlistMinus4(SearchCriteria cri);
	public List<NvVO> nvlistlimt2(SearchCriteria cri);
	
	public List<NvVO> nvSearchlistSearchTime2(SearchCriteria cri);
	public Integer nvlistSearchListTotalCnt2(SearchCriteria cri);
	
	public List<NvVO> nvlistGraph2(SearchFv fv);
	public List<NvVO> nvlistOne2(SearchCriteria cri);
	public List<NvVO> nvlistTwo2(SearchFv fv);
}
