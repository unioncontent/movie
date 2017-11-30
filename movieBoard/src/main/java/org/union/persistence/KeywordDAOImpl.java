package org.union.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.KeywordListVO;
import org.union.domain.KeywordVO;

@Repository
public class KeywordDAOImpl implements KeywordDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mapper.KeywordMapper.";
	
	
	@Override
	public void create(KeywordVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public KeywordVO read(Integer keyword_idx) {

		return session.selectOne(namespace + "read", keyword_idx);
	}

	@Override
	public void update(KeywordVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Integer keyword_idx) {
		try {
			session.delete(namespace + "delete", keyword_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<KeywordVO> listByUser(Integer user_idx) {

		return session.selectList(namespace + "listByUser", user_idx);
	}

	@Override
	public KeywordVO readByKeyword(String keyword) {

		return session.selectOne(namespace + "readByKeyword",keyword);
	}

	@Override
	public List<KeywordVO> listAll() {

		return session.selectList(namespace + "listAll");
	}

	@Override
	public List<KeywordListVO> listPage() {

		return session.selectList(namespace + "listPage");
	}

	@Override
	public void createMain(KeywordListVO vo) {

		session.insert(namespace + "createMain", vo);
	}

	@Override
	public List<KeywordVO> listByMain(String keyword_main) {

		return session.selectList(namespace + "listByMain", keyword_main);
	}

	@Override
	public void createKeyword(KeywordVO vo) {

		session.insert(namespace + "createKeyword", vo);
	}

	@Override
	public Integer checkMain(String keyword_main) {
		

		return session.selectOne(namespace + "checkMain", keyword_main);
	}

	@Override
	public void deleteMain(String keyword_main) {

		session.delete(namespace + "deleteMain", keyword_main);
	}

}
