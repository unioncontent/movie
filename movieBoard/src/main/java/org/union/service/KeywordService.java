package org.union.service;

import java.util.List;

import org.union.domain.ExtractVO;
import org.union.domain.KeywordListVO;
import org.union.domain.KeywordVO;
import org.union.domain.SwearwordVO;

public interface KeywordService {

	
	public KeywordVO view(String keyword);
	
	public void remove(String keyword);
	
	public List<KeywordVO> listByUser(Integer user_idx);
	 
	public List<ExtractVO> viewByKeyword(List<ExtractVO> list);
	
	public List<KeywordVO> listAll();
	public List<KeywordVO> showboxListAll();
	
	public List<KeywordListVO> listPage();
	
	public void insertMain(KeywordListVO vo);
	
	public List<KeywordVO> listByMain(String keyword_main);
	
	public void insertKeyword(KeywordVO vo);
	
	public Integer checkMain(String keyword_main);
	
	public Integer checkSwearword(String swearword);
	
	public void removeMain(String keyword_main);
	
	public List<SwearwordVO> swearwordList();

	public void swearwordCreate(SwearwordVO vo);
	
	public void swearwordDelete(String swearword);
}
