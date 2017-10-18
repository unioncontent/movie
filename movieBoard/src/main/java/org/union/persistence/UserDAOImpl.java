package org.union.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.UserMapper.";
	
	
	@Override
	public void create(UserVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void read(Integer user_idx) {
		try {
			session.selectOne(namespace + "read", user_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void update(UserVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void delete(Integer user_idx) {
		try {
			session.delete(namespace + "delete", user_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
