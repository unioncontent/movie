package org.union.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.CommunityVO;
import org.union.domain.ExtractVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeDateVO;
import org.union.domain.TextTypeVO;
import org.union.persistence.CommunityDAO;
import org.union.persistence.KeywordDAO;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDAO communityDAO;
	
	@Autowired
	private KeywordDAO keywordDAO;
	
	
	@Override
	public void regist(CommunityVO vo) {

		communityDAO.create(vo);
	}

	@Override
	public CommunityVO read(Integer community_idx) {

		return null;
	}

	@Override
	public void modify(CommunityVO vo) {

	}

	@Override
	public void remove(Integer community_idx) {

		communityDAO.delete(community_idx);
	}

	@Override
	public List<ExtractVO> listExtract(SearchCriteria cri) {
		try {
			List<CommunityVO> communityList = communityDAO.listExtract(cri);
			
			List<ExtractVO> extractList = new ArrayList<ExtractVO>();
			
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			for(int i = 0; i < communityList.size(); i++) {
				ExtractVO vo = new ExtractVO();
				CommunityVO data = communityList.get(i);
				vo.setCommunity_idx(data.getCommunity_idx());
				vo.setDomain("community");
				vo.setDomainType(data.getCommunity_name());
				vo.setTitle(data.getCommunity_title());
				vo.setContent(data.getCommunity_content());
				vo.setKeyword(data.getKeyword());
				vo.setUrl(data.getUrl());
				vo.setCreateDate(date.format(data.getCreateDate()));
				vo.setWriteDate(data.getWriteDate());
				
				extractList.add(vo);
			}
			
			return extractList;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getExtractCount(SearchCriteria cri) {

		return communityDAO.getExtractCount(cri);
	}

	@Override
	public List<CommunityVO> listSearch(SearchCriteria cri) {

		return communityDAO.listSearch(cri);
	}

	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return communityDAO.getSearchCount(cri);
	}
	
	@Override
	public Integer getSearchCount2(SearchCriteria cri) {

		return communityDAO.getSearchCount2(cri);
	}

	@Override
	public List<CommunityVO> wlistSearch(SearchCriteria cri) {

		return communityDAO.wlistSearch(cri);
	}

	@Override
	public Integer wgetSearchCount(SearchCriteria cri) {

		return communityDAO.wgetSearchCount(cri);
	}

	
	@Override
	public List<CommunityVO> listAll(SearchCriteria cri) {
		
		List<CommunityVO> list = communityDAO.listAll(cri);
		
		for (CommunityVO communityVO : list) {
			communityVO.setKeyword_main(keywordDAO.read(communityVO.getKeyword()).getKeyword_main());
		}

		return list;
	}
	
	@Override
	public void modifyType(CommunityVO vo) {

		communityDAO.updateTextType(vo);
	}

	@Override
	public void modifyThumbnail(CommunityVO vo) {

		communityDAO.updateThumbnail(vo);
	}

	@Override
	public List<CommunityVO> listComplete(SearchCriteria cri) {

		return communityDAO.listComplete(cri);
	}

	@Override
	public Integer getCompleteCount(SearchCriteria cri) {

		return communityDAO.getCompleteCount(cri);
	}

	@Override
	public TextTypeVO textTypeCount(SearchCriteria cri) {

		return communityDAO.textTypeCount(cri);
	}

	@Override
	public Integer countAll(Date date) {

		return communityDAO.countAll(date);
	}
	
	@Override
	public Integer showboxCountAll(Date date) {

		return communityDAO.showboxCountAll(date);
	}

	@Override
	public List<CommunityVO> allPageList(SearchCriteria cri) {

		return communityDAO.allPageList(cri);
	}
	
	@Override
	public List<CommunityVO> TotalAllPageList(SearchCriteria cri) {

		return communityDAO.TotalAllPageList(cri);
	}

	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return communityDAO.allPageCount(cri);
	}
	
	@Override
	public Integer TotalAllPageCount(SearchCriteria cri) {

		return communityDAO.TotalAllPageCount(cri);
	}

	@Override
	public List<CommunityVO> wPageSearch(SearchCriteria cri) {
		
		List<CommunityVO> list = communityDAO.wPageSearch(cri);
		
		for (CommunityVO communityVO : list) {
			communityVO.setKeyword_main(keywordDAO.read(communityVO.getKeyword()).getKeyword_main());
		}

		return list;
	}

	@Override
	public List<CommunityVO> allPage(SearchCriteria cri) {

		List<CommunityVO> list = communityDAO.allPage(cri);
		
		for (CommunityVO communityVO : list) {
			communityVO.setKeyword_main(keywordDAO.read(communityVO.getKeyword()).getKeyword_main());
		}

		return list;
		
	}

	@Override
	public List<TextTypeDateVO> textTypeCount2(SearchCriteria cri) {

		return communityDAO.textTypeCount2(cri);
	}

	@Override
	public Integer communityTextcnt(SearchCriteria cri) {

		return communityDAO.communityTextcnt(cri);
	}

	@Override
	public Integer communityTextcnt2(SearchCriteria cri) {

		return communityDAO.communityTextcnt2(cri);
	}

	@Override
	public Integer graphSearchCount(SearchCriteria cri) {

		return communityDAO.graphSearchCount(cri);
	}

	@Override
	public List<CommunityVO> totalAllPageex(SearchCriteria cri) {

		return communityDAO.totalAllPageex(cri);
	}

	@Override
	public List<CommunityVO> dashListAll(SearchCriteria cri) {

		return communityDAO.dashListAll(cri);
	}

	@Override
	public Integer periodWgetSearchCount(SearchCriteria cri) {

		return communityDAO.periodWgetSearchCount(cri);
	}

	@Override
	public List<CommunityVO> alllistExtract(SearchCriteria cri) {

		return communityDAO.alllistExtract(cri);
	}

	@Override
	public Integer allgetExtractCount(SearchCriteria cri) {

		return communityDAO.allgetExtractCount(cri);
	}

	@Override
	public List<CommunityVO> alllistSearch(SearchCriteria cri) {

		return communityDAO.alllistSearch(cri);
	}

	@Override
	public Integer allgetSearchCount(SearchCriteria cri) {

		return communityDAO.allgetSearchCount(cri);
	}

	@Override
	public List<CommunityVO> allPageallList(SearchCriteria cri) {

		return communityDAO.allPageallList(cri);
	}

	@Override
	public Integer allPageallCount(SearchCriteria cri) {

		return communityDAO.allPageallCount(cri);
	}

	@Override
	public List<CommunityVO> totalallPageallList(SearchCriteria cri) {

		return communityDAO.totalallPageallList(cri);
	}

	@Override
	public Integer totalallPageallCount(SearchCriteria cri) {

		return communityDAO.totalallPageallCount(cri);
	}

	@Override
	public List<CommunityVO> listAllEx(SearchCriteria cri) {

		return communityDAO.listAllEx(cri);
	}

	
}
