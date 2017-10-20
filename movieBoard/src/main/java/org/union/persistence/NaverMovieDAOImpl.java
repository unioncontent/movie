package org.union.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.NaverMovieVO;

@Repository
public class NaverMovieDAOImpl implements NaverMovieDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.NaverMovieMapper.";
	
	
	@Override
	public void create(NaverMovieVO vo) {
		try {
			session.insert(namespace + "create", vo);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public NaverMovieVO read(Integer NM_idx) {

		return session.selectOne(namespace + "read", NM_idx);
	}

	
	@Override
	public void update(NaverMovieVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void delete(Integer NM_idx) {
		try {
			session.delete(namespace + "delete", NM_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
