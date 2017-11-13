package org.union.service;

import java.util.List;

import org.union.domain.ExtractVO;
import org.union.domain.KeywordVO;

public interface KeywordService {

	
	public List<KeywordVO> listByUser(Integer user_idx);
	 
	public List<ExtractVO> viewByKeyword(List<ExtractVO> list);
	
	public List<KeywordVO> listAll();
}
