package org.union.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.NaverMovieVO;
import org.union.domain.SearchCriteria;

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
	public List<NaverMovieVO> searchAllList(SearchCriteria cri) {

		return session.selectList(namespace + "searchAllList", cri);
	}
	
	@Override
	public List<NaverMovieVO> searchList(SearchCriteria cri) {

		return session.selectList(namespace + "searchList", cri);
	}


	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCount", cri);
	}

}
