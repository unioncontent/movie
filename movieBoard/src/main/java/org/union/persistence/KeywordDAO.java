package org.union.persistence;

import org.union.domain.KeywordVO;

public interface KeywordDAO {

	
	public void create(KeywordVO vo);
	
	public void read(Integer keyword_idx);
	
	public void update(KeywordVO vo);
	
	public void delete(Integer keyword_idx);
}
