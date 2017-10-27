package org.union.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
