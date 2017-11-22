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
import org.union.domain.TextTypeVO;
import org.union.persistence.CommunityDAO;

@Service
public class CommunityServiceImpl implements CommunityService {

	
	@Autowired
	private CommunityDAO communityDAO;
	
	
	
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
			
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			
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
	public List<CommunityVO> listAll(SearchCriteria cri) {

		return communityDAO.listAll(cri);
	}
	
	@Override
	public void modifyType(CommunityVO vo) {

		communityDAO.updateTextType(vo);
	}

	@Override
	public void modifyThumbnail(CommunityVO vo) {
		// TODO Auto-generated method stub

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
	public List<CommunityVO> allPageList(SearchCriteria cri) {

		return communityDAO.allPageList(cri);
	}

	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return communityDAO.allPageCount(cri);
	}


}
