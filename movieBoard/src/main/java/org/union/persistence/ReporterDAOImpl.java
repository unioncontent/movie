package org.union.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.ReporterVO;
import org.union.domain.SearchCriteria;

@Repository
public class ReporterDAOImpl implements ReporterDAO {
	
	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.ReporterMapper.";
	
	
	@Override
	public void create(ReporterVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public ReporterVO read(Integer reporter_idx) {
		
		return session.selectOne(namespace + "read", reporter_idx);
	}

	
	@Override
	public void update(ReporterVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void delete(Integer reporter_idx) {
		try {
			session.delete(namespace + "delete", reporter_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public List<ReporterVO> listAll() {

		return session.selectList(namespace + "listAll");
	}


	@Override
	public List<ReporterVO> listChecked() {

		return session.selectList(namespace  +"listChecked");
	}


	@Override
	public List<ReporterVO> listSearch(SearchCriteria cri) {

		return session.selectList(namespace + "listSearch", cri);
	}


	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCount", cri);
	}


	@Override
	public ReporterVO readByName(String reporter_name) {

		return session.selectOne(namespace + "readByName", reporter_name);
	}

}
