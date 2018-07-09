package org.union.persistence;

import java.util.Date;
import java.util.List;

import org.union.domain.FvVO;
import org.union.domain.GraphVO;
import org.union.domain.NvVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SearchFv;
import org.union.domain.SearchNv;
import org.union.domain.TextTypeDateVO;

public interface SNSDAO {

	public void create(SNSVO vo);
	
	public SNSVO read(Integer SNS_idx);
	
	public void update(SNSVO vo);
	
	public void delete(Integer SNS_idx);
	
	public List<SNSVO> allPageList(SearchCriteria cri);
	public Integer allPageCount(SearchCriteria cri);
	
	public Integer countAll(Date date);
	
	public Integer showboxCountAll(Date date);
	
	public Integer reportSnsCount(SearchCriteria cri);
	
	public GraphVO yesterdayCount(String name);
	
	public GraphVO showboxYesterdayCount(String name);
	
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
	public Integer snsFacebookTotalCount(SearchCriteria  cri);
	
	public List<SNSVO> instaList(SearchCriteria cri);
	
	public Integer instaTotalCount(SearchCriteria cri);
	
	public List<SNSVO> twitterList(SearchCriteria cri);
	
	public Integer twitterTotalCount(SearchCriteria cri);
	
	public List<SNSVO> getDateCount(SearchCriteria cri);
	
	public void updateTextType(SNSVO vo);
	
	public void updateThumbnail(SNSVO vo);
	
	public List<SNSVO> facebookCnt(SearchCriteria cri);
	public List<SNSVO> instaCnt(SearchCriteria cri);
	public List<SNSVO> twiCnt(SearchCriteria cri);
	public List<SNSVO> snsTotalCnt(SearchCriteria cri);
	
	public List<FvVO> facebookCGV(SearchCriteria cri);
	public List<FvVO> facebookCGVList(SearchCriteria cri);
	public List<FvVO> facebookCGVallList(SearchCriteria cri);
	public Integer facebookCGVListTotalCnt(SearchCriteria cri);
	public List<FvVO> fvlistSearch(SearchCriteria cri);
	public List<FvVO> fvlistSearchEx(SearchCriteria cri);
	public Integer fvlistSearchTotalCnt(SearchCriteria cri);
	public List<FvVO> fvlistSearchList(SearchCriteria cri);
	public Integer fvlistSearchListTotalCnt(SearchCriteria cri);
	public Integer fvlistViewCnt(SearchFv fv);
	public Integer fvlistReply_cnt(SearchFv fv);
	public Integer fvlistlike_cnt(SearchFv fv);
	public List<FvVO> fvlistPlus(SearchCriteria cri);
	public List<FvVO> fvlistlimt(SearchCriteria cri);
	public List<FvVO> fvlistMinus2(SearchCriteria cri);
	public List<FvVO> fvlistMinus(SearchCriteria cri);
	public List<FvVO> fvlistSearchTime(SearchCriteria cri);
	public List<FvVO> fvSearchlistSearchTime(SearchCriteria cri);
	public List<FvVO> fvlistOne(SearchCriteria cri);
	public List<FvVO> fvlistTwo(SearchFv fv);
	public List<FvVO> fvlistGraph(SearchFv fv);
	
	public Integer snsTotalcount(SearchCriteria cri);
	
	public Integer graphfacebookCount(SearchCriteria cri);
	public Integer graphinstaCount(SearchCriteria cri);
	public Integer graphtwitterCount(SearchCriteria cri);
	
	public Integer replyGetDateCount(SearchCriteria cri);
	public Integer likeGetDateCount(SearchCriteria cri);
	public Integer shareGetDateCount(SearchCriteria cri);
	
	public void fvUpdate(FvVO vo);
}
