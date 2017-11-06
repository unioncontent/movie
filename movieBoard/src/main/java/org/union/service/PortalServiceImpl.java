package org.union.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.ExtractVO;
import org.union.domain.PortalVO;
import org.union.domain.SearchCriteria;
import org.union.persistence.PortalDAO;

@Service
public class PortalServiceImpl implements PortalService {

	
	@Autowired
	private PortalDAO portalDAO;
	
	
	@Override
	public void regist(PortalVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public PortalVO view(Integer portal_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modify(PortalVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(Integer portal_idx) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ExtractVO> listExtract(SearchCriteria cri) {

		try {
			List<PortalVO> portalList = portalDAO.listExtract(cri);
			
			List<ExtractVO> extractList = new ArrayList<ExtractVO>();
			
			SimpleDateFormat date = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
			
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
			return null;
		}
	
	}
	
	@Override
	public Integer getExtractCount(SearchCriteria cri) {

		return portalDAO.getExtractCount(cri);
	}
	

	@Override
	public List<PortalVO> listSearch(SearchCriteria vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyType(PortalVO vo) {

		portalDAO.updateTextType(vo);
	}

	@Override
	public void modifyThumbnail(PortalVO vo) {
		// TODO Auto-generated method stub

	}

}
