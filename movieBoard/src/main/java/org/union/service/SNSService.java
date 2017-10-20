package org.union.service;

import java.util.List;

import org.union.domain.SNSVO;
import org.union.domain.SearchVO;

public interface SNSService {

	
	public void regist(SNSVO vo);
	
	public SNSVO read(Integer sns_idx);
	
	public void modify(SNSVO vo);
	
	public void remove(Integer sns_idx);
	
	public List<SNSVO> listSearch (SearchVO vo);
	
	public void modifyType(SNSVO vo);
	
	public void modifyThumbnail(SNSVO vo);
	
}
