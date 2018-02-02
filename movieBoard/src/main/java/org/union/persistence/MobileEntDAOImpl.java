package org.union.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.MobileEntVO;
import org.union.domain.SearchCriteria;

@Repository
public class MobileEntDAOImpl implements MobileEntDAO {
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.MobileEntMapper.";
		
	@Override
	public Integer getTypeOfMovieCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getTypeOfMovieCount", cri);
	}


	@Override
	public Integer getTypeOfActorCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getTypeOfActorCount", cri);
	}
	
	@Override
	public MobileEntVO read(Integer NM_idx) {

		return session.selectOne(namespace + "read", NM_idx);
	}

	@Override
	public List<MobileEntVO> searchList(SearchCriteria cri) {

		return session.selectList(namespace + "searchList", cri);
	}
	
	@Override
	public List<MobileEntVO> searchAllList(SearchCriteria cri) {

		return session.selectList(namespace + "searchAllList", cri);
	}


	@Override
	public Integer getSearchCount(SearchCriteria cri) {
	    
		return session.selectOne(namespace + "getSearchCount", cri);
	}

}
