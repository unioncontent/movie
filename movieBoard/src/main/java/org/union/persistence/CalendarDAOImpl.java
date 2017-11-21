package org.union.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.CalendarVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO{

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mapper.CalendarMapper.";

	@Override
	public void create(CalendarVO vo) {

		session.insert(namespace + "create", vo);
	}

	@Override
	public void delete(String title) {

		session.delete(namespace + "delete", title);
	}

	@Override
	public List<CalendarVO> listDate() {

		return session.selectList(namespace + "listDate" );
	}
	
	
	
}
