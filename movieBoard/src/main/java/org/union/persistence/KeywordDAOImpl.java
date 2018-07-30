package org.union.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.IssueVO;
import org.union.domain.KeywordListVO;
import org.union.domain.KeywordVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SwearwordVO;

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
	public KeywordVO read(String keyword) {

		return session.selectOne(namespace + "read", keyword);
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
	public void stateUpdateOn(String keyword_main) {
		try {
			session.update(namespace + "stateUpdateOn", keyword_main);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void stateUpdateOff(String keyword_main) {
		try {
			session.update(namespace + "stateUpdateOff", keyword_main);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(String keyword) {
		try {
			session.delete(namespace + "delete", keyword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<KeywordVO> listByUser(Integer user_idx) {

		return session.selectList(namespace + "listByUser", user_idx);
	}
	
	@Override
	public List<KeywordVO> getKeyword(String keyword_main) {

		return session.selectList(namespace + "getKeyword", keyword_main);
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
	public List<KeywordVO> showboxListAll() {

		return session.selectList(namespace + "showboxListAll");
	}

	@Override
	public List<KeywordListVO> listPage(SearchCriteria cri) {

		return session.selectList(namespace + "listPage", cri);
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

	@Override
	public List<SwearwordVO> swearwordList() {

		return session.selectList(namespace + "swearwordList");
	}

	@Override
	public void swearwordCreate(SwearwordVO vo) {
		try {
			session.insert(namespace + "swearwordCreate", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void swearwordDelete(String swearword) {
		try {
			session.delete(namespace + "swearwordDelete", swearword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Integer checkSwearword(String swearword) {
		return session.selectOne(namespace + "checkSwearword", swearword);
	}

	@Override
	public List<KeywordVO> keywordGetList(SearchCriteria cri) {

		return session.selectList(namespace + "keywordGetList", cri);
	}

	@Override
	public void createIssue(IssueVO vo) {
		try {
			session.insert(namespace + "createIssue", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<IssueVO> issueList(SearchCriteria cri) {

		return session.selectList(namespace + "issueList", cri);
	}

	@Override
	public List<IssueVO> issueUpList(SearchCriteria cri) {

		return session.selectList(namespace + "issueUpList", cri);
	}

	@Override
	public void issueUpdate(IssueVO vo) {
		try {
			session.update(namespace + "issueUpdate", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void issueDelete(Integer issue_idx) {
		try {
			session.delete(namespace + "issueDelete", issue_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
