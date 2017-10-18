package org.union.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.union.domain.BiralVO;

@Repository
public class BiralDAOImpl implements BiralDAO {

	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "org.union.mapper.BiralMapper.";
											
	@Override
	public void create(BiralVO vo) throws Exception{
		session.insert(namespace + "create", vo);

	}

	@Override
	public void read(Integer biral_idx) throws Exception {
		session.selectOne(namespace + "read", biral_idx);
	}

	@Override
	public void update(BiralVO vo) throws Exception {
		session.update(namespace + "update", vo);

	}

	@Override
	public void delete(Integer biral_idx) throws Exception {
		session.delete(namespace + "delete", biral_idx);
		
	}

}
