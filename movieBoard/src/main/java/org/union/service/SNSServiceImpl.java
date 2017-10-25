package org.union.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.SNSVO;
import org.union.domain.SearchVO;
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
	public List<SNSVO> listSearch(SearchVO vo) {

		return dao.listSearch(vo);
	}
	

	@Override
	public void modifyTextType(SNSVO vo) {

		dao.updateTextType(vo);
	}
	

	@Override
	public void modifyThumbnail(SNSVO vo) {

		dao.updateThumbnail(vo);
	}

}
