package org.union.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.SearchCriteria;
import org.union.domain.ViralVO;

@Repository
public class ViralDAOImpl implements ViralDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mapper.ViralMapper.";
								
	
	@Override
	public void create(ViralVO vo){
		
		try {
			session.insert(namespace + "create", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}

	
	@Override
	public ViralVO read(Integer biral_idx){
		
		return  session.selectOne(namespace + "read", biral_idx);
		
	}

	
	@Override
	public void update(ViralVO vo){
		
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


	@Override
	public List<ViralVO> searchInList(SearchCriteria cri) {

		return session.selectList(namespace + "searchInList", cri);
	}


	@Override
	public List<ViralVO> searchOutList(SearchCriteria cri) {

		return session.selectList(namespace + "searchOutList", cri);
	}

	
	@Override
	public List<ViralVO> searchAllList(SearchCriteria cri) {

		return session.selectList(namespace + "searchAllList", cri);
	}

	
	@Override
	public Integer getSearchInCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchInCount", cri);
	}


	@Override
	public Integer getSearchOutCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchOutCount", cri);
	}

}
