package org.union.persistence;

import org.union.domain.BiralVO;

public interface BiralDAO {

	
	public void create(BiralVO vo) throws Exception;
	
	public void read(Integer biral_idx) throws Exception;
	
	public void update(BiralVO vo) throws Exception;
	
	public void delete(Integer biral_idx) throws Exception;
	
}
