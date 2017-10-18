package org.union.persistence;

import org.union.domain.CommunityVO;

public interface CommunityDAO {

	
	public void create(CommunityVO vo);

	public void read(Integer community_idx);

	public void update(CommunityVO vo);

	public void delete(Integer community_idx);
	
}
