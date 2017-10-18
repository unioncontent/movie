package org.union.persistence;

import org.union.domain.RelationVO;

public interface RelationDAO {

	
	public void create(RelationVO vo);
	
	public void read(Integer relation_idx);
	
	public void update(RelationVO vo);
	
	public void delete(Integer relation_idx);
	
}
