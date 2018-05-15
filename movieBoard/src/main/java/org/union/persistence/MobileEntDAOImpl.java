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


	@Override
	public Integer MgetTypeOfMovieCount(SearchCriteria cri) {

		return session.selectOne(namespace + "MgetTypeOfMovieCount", cri);
	}


	@Override
	public Integer MgetTypeOfActorCount(SearchCriteria cri) {

		return session.selectOne(namespace + "MgetTypeOfActorCount", cri);
	}


	@Override
	public List<MobileEntVO> MsearchList(SearchCriteria cri) {

		return session.selectList(namespace + "MsearchList", cri);
	}


	@Override
	public List<MobileEntVO> MsearchAllList(SearchCriteria cri) {

		return session.selectList(namespace + "MsearchAllList", cri);
	}


	@Override
	public Integer MgetSearchCount(SearchCriteria cri) {
		 
		return session.selectOne(namespace + "MgetSearchCount", cri);
	}


	@Override
	public Integer getMatchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getMatchCount", cri);
	}


	@Override
	public Integer MgetMatchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "MgetMatchCount", cri);
	}


	@Override
	public Integer getTypeOfMovieCountGraph(SearchCriteria cri) {

		return session.selectOne(namespace + "getTypeOfMovieCountGraph", cri);
	}


	@Override
	public Integer getTypeOfActorCountGraph(SearchCriteria cri) {

		return session.selectOne(namespace + "getTypeOfActorCountGraph", cri);
	}


	@Override
	public Integer getMatchCountGraph(SearchCriteria cri) {

		return session.selectOne(namespace + "getMatchCountGraph", cri);
	}


	@Override
	public Integer MgetTypeOfMovieCountGraph(SearchCriteria cri) {

		return session.selectOne(namespace + "MgetTypeOfMovieCountGraph", cri);
	}


	@Override
	public Integer MgetTypeOfActorCountGraph(SearchCriteria cri) {

		return session.selectOne(namespace + "MgetTypeOfActorCountGraph", cri);
	}


	@Override
	public Integer MgetMatchCountGraph(SearchCriteria cri) {

		return session.selectOne(namespace + "MgetMatchCountGraph", cri);
	}


}
