package org.union.persistence;

import java.util.List;

import org.union.domain.KeywordVO;

public interface KeywordDAO {

	
	public void create(KeywordVO vo);
	
	public KeywordVO read(Integer keyword_idx);
	
	public void update(KeywordVO vo);
	
	public void delete(Integer keyword_idx);
	
	public List<KeywordVO> listByUser(Integer user_idx);
	
	public List<KeywordVO> listAll();
	
	public KeywordVO readByKeyword(String keyword);
}
