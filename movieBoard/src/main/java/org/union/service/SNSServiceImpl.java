package org.union.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.ExtractVO;
import org.union.domain.GraphVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;
import org.union.persistence.SNSDAO;

@Service
public class SNSServiceImpl implements SNSService {

	
	@Autowired
	private SNSDAO dao;
	
	
	@Override
	public void regist(SNSVO vo) {

		dao.create(vo);
	}
	

	@Override
	public SNSVO view(Integer SNS_idx) {

		return dao.read(SNS_idx);
	}
	

	@Override
	public void modify(SNSVO vo) {

		dao.update(vo);
	}
	

	@Override
	public void remove(Integer SNS_idx) {

		dao.delete(SNS_idx);
	}

	@Override
	public List<ExtractVO> listExtract(SearchCriteria cri) {

		try {
			List<SNSVO> snsList = dao.listExtract(cri);
			
			List<ExtractVO> extractList = new ArrayList<ExtractVO>();
			
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			
			for(int i = 0; i < snsList.size(); i++) {
				ExtractVO vo = new ExtractVO();
				
				SNSVO data = snsList.get(i);
				
				vo.setSns_idx(data.getSns_idx());
				vo.setDomain("sns");
				vo.setDomainType(data.getSns_name());
				vo.setTitle(data.getSns_title());
				vo.setContent(data.getSns_content());
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
	public Integer getExtractCount (SearchCriteria cri) {

		return dao.getExtractCount(cri);
	}
	
	@Override
	public List<SNSVO> facebookList(SearchCriteria cri) {

		return dao.facebookList(cri);
	}
	
	
	@Override
	public Integer facebookTotalCount(SearchCriteria  cri) {

		return dao.facebookTotalCount(cri);
	}
	
	
	@Override
	public List<SNSVO> instaList(SearchCriteria cri) {

		return dao.instaList(cri);
	}


	@Override
	public Integer instaTotalCount(SearchCriteria cri) {

		return dao.instaTotalCount(cri);
	}


	@Override
	public List<SNSVO> twitterList(SearchCriteria cri) {

		return dao.twitterList(cri);
	}


	@Override
	public Integer twitterTotalCount(SearchCriteria cri) {

		return dao.twitterTotalCount(cri);
	}
	

	@Override
	public void modifyTextType(SNSVO vo) {

		dao.updateTextType(vo);
	}
	

	@Override
	public void modifyThumbnail(SNSVO vo) {

		dao.updateThumbnail(vo);
	}


	@Override
	public List<SNSVO> getDateCount(GraphVO vo) {

		return dao.getDateCount(vo);
	}


}
