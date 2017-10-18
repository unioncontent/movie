package org.union.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.BiralVO;

@Repository
public class BiralDAOImpl implements BiralDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mapper.BiralMapper.";
								
	
	@Override
	public void create(BiralVO vo){
		
		try {
			session.insert(namespace + "create", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}

	
	@Override
	public void read(Integer biral_idx){
		
		try {
			session.selectOne(namespace + "read", biral_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	@Override
	public void update(BiralVO vo){
		
		try {
			session.update(namespace + "update", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}	

	}
	

	@Override
	public void delete(Integer biral_idx){
		
		try {
			session.delete(namespace + "delete", biral_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
	}

}
