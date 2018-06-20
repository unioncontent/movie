package org.union.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.CommunityVO;
import org.union.domain.ExtractVO;
import org.union.domain.GraphVO;
import org.union.domain.NvVO;
import org.union.domain.PortalVO;
import org.union.domain.ScoreVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SearchFv;
import org.union.domain.TextTypeDateVO;
import org.union.domain.TextTypeVO;
import org.union.persistence.KeywordDAO;
import org.union.persistence.PortalDAO;

@Service
public class PortalServiceImpl implements PortalService {

	@Autowired
	private PortalDAO portalDAO;
	
	@Autowired
	private KeywordDAO keywordDAO;
	
	@Override
	public void regist(PortalVO vo) {
		
		portalDAO.create(vo);

	}

	@Override
	public PortalVO view(Integer portal_idx) {

		return null;
	}

	@Override
	public void modify(PortalVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(Integer portal_idx) {

		portalDAO.delete(portal_idx);
	}

	@Override
	public List<ExtractVO> listExtract(SearchCriteria cri) {

		List<PortalVO> portalList = portalDAO.listExtract(cri);
		
		List<ExtractVO> extractList = new ArrayList<ExtractVO>();
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try {
			
			for(int i = 0; i < portalList.size(); i++) {
				ExtractVO vo = new ExtractVO();
				
				PortalVO data = portalList.get(i);
				
				vo.setPortal_idx(data.getPortal_idx());
				vo.setDomain("portal");
				vo.setDomainType(data.getPortal_name());
				vo.setTitle(data.getPortal_title());
				vo.setContent(data.getPortal_content());
				vo.setKeyword(data.getKeyword());
				vo.setUrl(data.getUrl());
				vo.setCreateDate(date.format(data.getCreateDate()));
				vo.setWriteDate(data.getWriteDate());
				
				extractList.add(vo);
			}
			
			return extractList;
			
		} catch (Exception e) {
			e.printStackTrace();
			return extractList;
		}
	
	}
	
	@Override
	public Integer getExtractCount(SearchCriteria cri) {

		return portalDAO.getExtractCount(cri);
	}
	

	@Override
	public List<PortalVO> listSearch(SearchCriteria cri) {

		return portalDAO.listSearch(cri);
		
	}
	
	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return portalDAO.getSearchCount(cri);
	}

	@Override
	public List<PortalVO> wlistSearch(SearchCriteria cri) {

		return portalDAO.wlistSearch(cri);
		
	}
	
	@Override
	public Integer wgetSearchCount(SearchCriteria cri) {

		return portalDAO.wgetSearchCount(cri);
	}

	@Override
	public void modifyType(PortalVO vo) {

		portalDAO.updateTextType(vo);
	}

	@Override
	public void modifyThumbnail(PortalVO vo) {

		portalDAO.updateThumbnail(vo);
	}

	@Override
	public List<PortalVO> listAll(SearchCriteria cri) {

		List<PortalVO> list = portalDAO.listAll(cri);
		
		for (PortalVO portalVO : list) {
			portalVO.setKeyword_main(keywordDAO.read(portalVO.getKeyword()).getKeyword_main());
		}

		return list;
	}

	@Override
	public List<PortalVO> listNaver(SearchCriteria cri) {

		return portalDAO.listNaver(cri);
	}

	@Override
	public Integer getNaverCount(SearchCriteria cri) {

		return portalDAO.getNaverCount(cri);
	}

	@Override
	public List<PortalVO> listDaum(SearchCriteria cri) {

		return portalDAO.listDaum(cri);
	}

	@Override
	public Integer getDaumCount(SearchCriteria cri) {

		return portalDAO.getDaumCount(cri);
	}

	@Override
	public List<TextTypeVO> naverTextTypeCountb(SearchCriteria cri) {

		return portalDAO.naverTextTypeCountb(cri);
	}
	@Override
	public List<TextTypeVO> naverTextTypeCountc(SearchCriteria cri) {
		
		return portalDAO.naverTextTypeCountc(cri);
	}
	@Override
	public List<TextTypeVO> naverTextTypeCountk(SearchCriteria cri) {
		
		return portalDAO.naverTextTypeCountk(cri);
	}
	@Override
	public List<TextTypeVO> naverTextTypeCountw(SearchCriteria cri) {
		
		return portalDAO.naverTextTypeCountw(cri);
	}

	@Override
	public List<TextTypeVO> daumTextTypeCountb(SearchCriteria cri) {

		return portalDAO.daumTextTypeCountb(cri);
	}
	@Override
	public List<TextTypeVO> daumTextTypeCountc(SearchCriteria cri) {
		
		return portalDAO.daumTextTypeCountc(cri);
	}
	@Override
	public List<TextTypeVO> daumTextTypeCountk(SearchCriteria cri) {
		
		return portalDAO.daumTextTypeCountk(cri);
	}
	@Override
	public List<TextTypeVO> daumTextTypeCountw(SearchCriteria cri) {
		
		return portalDAO.daumTextTypeCountw(cri);
	}

	@Override
	public TextTypeVO textTypeCount(SearchCriteria cri) {

		return portalDAO.textTypeCount(cri);
	}
	
	@Override
	public List<TextTypeDateVO> textTypeCount2(SearchCriteria cri) {
		
		return portalDAO.textTypeCount2(cri);
	}

	@Override
	public TextTypeVO blogTextType(SearchCriteria cri) {

		return portalDAO.blogTextTypeCount(cri);
	}

	@Override
	public TextTypeVO cafeTextType(SearchCriteria cri) {

		return portalDAO.cafeTextTypeCount(cri);
	}

	@Override
	public GraphVO toDayCount(String type) {

		return portalDAO.toDayCount(type);
	}
	
	@Override
	public GraphVO showboxToDayCount(String type) {

		return portalDAO.showboxToDayCount(type);
	}

	@Override
	public GraphVO yesterdayCount() {

		return portalDAO.yesterdayCount();
	}
	
	@Override
	public GraphVO showboxYesterdayCount() {

		return portalDAO.showboxYesterdayCount();
	}

	@Override
	public Integer countAll(Date date) {

		return portalDAO.countAll(date);
	}
	
	@Override
	public Integer showboxCountAll(Date date) {

		return portalDAO.showboxCountAll(date);
	}

	@Override
	public List<PortalVO> allPageList(SearchCriteria cri) {

		return portalDAO.allPageList(cri);
	}
	
	@Override
	public List<PortalVO> TotalAllPageList(SearchCriteria cri) {
		
		return portalDAO.TotalAllPageList(cri);
	}
	
	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return portalDAO.allPageCount(cri);
	}
	
	@Override
	public Integer TotalAllPageCount(SearchCriteria cri) {

		return portalDAO.TotalAllPageCount(cri);
	}

	@Override
	public Integer getTypeOfMovieCount(SearchCriteria cri) {

		return portalDAO.getTypeOfMovieCount(cri);
	}

	@Override
	public Integer getTypeOfActorCount(SearchCriteria cri) {

		return portalDAO.getTypeOfActorCount(cri);
	}

	@Override
	public Integer getScoreCount(SearchCriteria cri) {

		return portalDAO.getScoreCount(cri);
	}

	@Override
	public List<PortalVO> getScoreList(SearchCriteria cri) {

		return portalDAO.getScoreList(cri);
	}
	
	@Override
	public List<PortalVO> getScoreExcelList(SearchCriteria cri) {

		return portalDAO.getScoreExcelList(cri);
	}

	@Override
	public TextTypeVO getScoreTextType(SearchCriteria cri) {

		return portalDAO.getScoreTextType(cri);
	}

	@Override
	public Integer getOnlyScore(SearchCriteria cri) {

		List<Integer> list = portalDAO.getOnlyScore(cri);
		
		Integer totalCount = 0;
		
		if(list.size() != 0) {
			for (Integer integer : list) {
				totalCount += integer;
			}
			
			totalCount = totalCount/list.size();
			
		}

		return totalCount;
	}

	@Override
	public List<PortalVO> wPageSearch(SearchCriteria cri) {

		List<PortalVO> list = portalDAO.wPageSearch(cri);
		
		for (PortalVO portalVO : list) {
			portalVO.setKeyword_main(keywordDAO.read(portalVO.getKeyword()).getKeyword_main());
		}

		return list;
	}

	@Override
	public List<PortalVO> allPage(SearchCriteria cri) {

		List<PortalVO> list = portalDAO.allPage(cri);
		
		for (PortalVO portalVO : list) {
			portalVO.setKeyword_main(keywordDAO.read(portalVO.getKeyword()).getKeyword_main());
		}
		
		return list;
	}

	@Override
	public List<NvVO> naverVideosList(SearchCriteria cri) {

		return portalDAO.naverVideosList(cri);
	}

	@Override
	public Integer naverVideosListTotalCnt(SearchCriteria cri) {

		return portalDAO.naverVideosListTotalCnt(cri);
	}

	@Override
	public List<NvVO> nvlistSearch(SearchCriteria cri) {

		return portalDAO.nvlistSearch(cri);
	}

	@Override
	public Integer nvlistSearchTotalCnt(SearchCriteria cri) {

		return portalDAO.nvlistSearchTotalCnt(cri);
	}

	@Override
	public Integer nvlistViewCnt(SearchFv fv) {

		return portalDAO.nvlistViewCnt(fv);
	}

	@Override
	public List<NvVO> nvlistMinus(SearchCriteria cri) {

		return portalDAO.nvlistMinus(cri);
	}

	@Override
	public Integer nvlistReply_cnt(SearchFv fv) {

		return portalDAO.nvlistReply_cnt(fv);
	}

	@Override
	public Integer nvlistlike_cnt(SearchFv fv) {

		return portalDAO.nvlistlike_cnt(fv);
	}

	@Override
	public List<NvVO> nvlistSearchEx(SearchCriteria cri) {

		return portalDAO.nvlistSearchEx(cri);
	}

	@Override
	public List<NvVO> nvlistSearchTime(SearchCriteria cri) {

		return portalDAO.nvlistSearchTime(cri);
	}

	@Override
	public List<NvVO> nvlistSearchList(SearchCriteria cri) {

		return portalDAO.nvlistSearchList(cri);
	}

	@Override
	public Integer nvlistSearchListTotalCnt(SearchCriteria cri) {

		return portalDAO.nvlistSearchListTotalCnt(cri);
	}

	@Override
	public List<NvVO> nvSearchlistSearchTime(SearchCriteria cri) {

		return portalDAO.nvSearchlistSearchTime(cri);
	}

	@Override
	public List<NvVO> nvlistPlus(SearchCriteria cri) {

		return portalDAO.nvlistPlus(cri);
	}

	@Override
	public List<NvVO> nvlistlimt(SearchCriteria cri) {

		return portalDAO.nvlistlimt(cri);
	}

	@Override
	public List<NvVO> nvlistMinus2(SearchCriteria cri) {

		return portalDAO.nvlistMinus2(cri);
	}

	@Override
	public List<NvVO> nvlistOne(SearchCriteria cri) {

		return portalDAO.nvlistOne(cri);
	}

	@Override
	public List<NvVO> nvlistTwo(SearchFv fv) {

		return portalDAO.nvlistTwo(fv);
	}

	@Override
	public List<NvVO> nvlistGraph(SearchFv fv) {

		return portalDAO.nvlistGraph(fv);
	}

	@Override
	public List<NvVO> naverVideosallList(SearchCriteria cri) {

		return portalDAO.naverVideosallList(cri);
	}

	@Override
	public Integer scoreTotalcnt(SearchCriteria cri) {

		return portalDAO.scoreTotalcnt(cri);
	}

	@Override
	public Integer portalTextcnt(SearchCriteria cri) {

		return portalDAO.portalTextcnt(cri);
	}

	@Override
	public Integer portalTextcnt2(SearchCriteria cri) {

		return portalDAO.portalTextcnt2(cri);
	}

	@Override
	public Integer graphNaverCount(SearchCriteria cri) {

		return portalDAO.graphNaverCount(cri);
	}

	@Override
	public Integer graphDaumCount(SearchCriteria cri) {

		return portalDAO.graphDaumCount(cri);
	}

	@Override
	public void scoreCheckList(Integer portal_idx) {

		portalDAO.scoreCheckList(portal_idx);
		
	}

	@Override
	public void scoreUpdate(Integer portal_idx) {

		portalDAO.scoreUpdate(portal_idx);
		
	}

	@Override
	public List<ScoreVO> scoreListReport(SearchCriteria cri) {

		return portalDAO.scoreListReport(cri);
	}

	@Override
	public void scoreCheckDelete(Integer portal_idx) {

		portalDAO.scoreCheckDelete(portal_idx);
	}

	@Override
	public void scoreUpdate2(Integer portal_idx) {

		portalDAO.scoreUpdate2(portal_idx);
		
	}

	@Override
	public List<PortalVO> totalAllPageex(SearchCriteria cri) {

		return portalDAO.totalAllPageex(cri);
	}

	@Override
	public Integer getNvCount(String url) {

		return portalDAO.getNvCount(url);
	}

	@Override
	public List<PortalVO> dashListAll(SearchCriteria cri) {

		return portalDAO.dashListAll(cri);
	}

	@Override
	public List<PortalVO> periodWlistSearch(SearchCriteria cri) {

		return portalDAO.periodWlistSearch(cri);
	}

	@Override
	public Integer periodWgetSearchCount(SearchCriteria cri) {

		return portalDAO.periodWgetSearchCount(cri);
	}
}
