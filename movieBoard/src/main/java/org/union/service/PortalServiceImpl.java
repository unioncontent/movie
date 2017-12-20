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
import org.union.domain.PortalVO;
import org.union.domain.SearchCriteria;
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
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		
		try {
			
			for(int i = 0; i < portalList.size(); i++) {
				ExtractVO vo = new ExtractVO();
				
				PortalVO data = portalList.get(i);
				
				vo.setPortal_idx(data.getPortal_idx());
				vo.setDomain("portal");
				vo.setDomainType(data.getPortal_name());
				vo.setTitle(data.getPortal_title());
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
		// TODO Auto-generated method stub

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
	public List<TextTypeVO> naverTextTypeCount(String type) {

		return portalDAO.naverTextTypeCount(type);
	}

	@Override
	public List<TextTypeVO> daumTextTypeCount(String type) {

		return portalDAO.daumTextTypeCount(type);
	}

	@Override
	public TextTypeVO textTypeCount(SearchCriteria cri) {

		return portalDAO.textTypeCount(cri);
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
	public GraphVO yesterdayCount() {

		return portalDAO.yesterdayCount();
	}

	@Override
	public Integer countAll(Date date) {

		return portalDAO.countAll(date);
	}

	@Override
	public List<PortalVO> allPageList(SearchCriteria cri) {

		return portalDAO.allPageList(cri);
	}

	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return portalDAO.allPageCount(cri);
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

}
