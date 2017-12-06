package org.union.persistence;

import java.util.List;

import org.union.domain.KeywordListVO;
import org.union.domain.KeywordVO;

public interface KeywordDAO {

	
	public void create(KeywordVO vo);
	
	public KeywordVO read(String keyword);
	
	public void update(KeywordVO vo);
	
	public void delete(String keyword);
	
	public List<KeywordVO> listByUser(Integer user_idx);
	
	public List<KeywordVO> listAll();
	
	public KeywordVO readByKeyword(String keyword);
	
	public List<KeywordListVO> listPage();
	
	public void createMain(KeywordListVO vo);
	
	public List<KeywordVO> listByMain(String keyword_main);
	
	public void createKeyword(KeywordVO vo);
	
	public Integer checkMain(String keyword_main);
	
	public void deleteMain(String keyword_main);
}
