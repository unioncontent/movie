package org.union.service;

import java.util.List;

import org.union.domain.ExtractVO;
import org.union.domain.KeywordListVO;
import org.union.domain.KeywordVO;

public interface KeywordService {

	
	public List<KeywordVO> listByUser(Integer user_idx);
	 
	public List<ExtractVO> viewByKeyword(List<ExtractVO> list);
	
	public List<KeywordVO> listAll();
	
	public List<KeywordListVO> listPage();
	
	public void insertMain(KeywordListVO vo);
	
	public List<KeywordVO> listByMain(String keyword_main);
	
	public void insertKeyword(KeywordVO vo);
	
	public Integer checkMain(String keyword_main);
	
	public void removeMain(String keyword_main);

}
