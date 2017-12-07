package org.union.persistence;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.SearchCriteria;


@Repository
public class EtDAOImpl implements EtDAO{

	
	@Autowired
	private SqlSession session;
	
	private final static String namespace  = "org.union.mappers.EtMapper.";
	

	@Override
	public Integer getSearchCount1(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCount1", cri);
	}

	@Override
	public Integer getSearchCount2(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCount2", cri);
	}

	@Override
	public Integer getSearchCount3(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCount3", cri);
	}

	@Override
	public Integer getSearchCountAll(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCountAll", cri);
	}


}
