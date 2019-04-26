package org.union.persistence;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.GloVO;
import org.union.domain.KeywordVO;
import org.union.domain.SearchCriteria;

@Repository
public class GloDAOImpl implements GloDAO {
	
	@Autowired
	@Resource(name="oneSqlSession")
	private SqlSession session1;
	
	private final static String namespace  = "org.union.mappers.GloMapper.";

	@Override
	public Integer totalCnt() throws SQLException {
		return session1.selectOne(namespace + "totalCnt");
	}

	@Override
	public Integer gloCnt() throws SQLException {
		return session1.selectOne(namespace + "gloCnt");
	}

	@Override
	public List<GloVO> gloTypeCount() throws SQLException {
		return session1.selectList(namespace + "gloTypeCount");
	}

	@Override
	public Integer graphGloCount(SearchCriteria cri) throws SQLException {

		return session1.selectOne(namespace + "graphGloCount", cri);
	}

	@Override
	public Integer graphKoCount(SearchCriteria cri) throws SQLException {

		return session1.selectOne(namespace + "graphKoCount", cri);
	}

	@Override
	public List<GloVO> graphGloList(SearchCriteria cri) throws SQLException {
		return session1.selectList(namespace + "graphGloList", cri);
	}

	@Override
	public List<GloVO> nationList() throws SQLException {
		return session1.selectList(namespace + "nationList");
	}

	@Override
	public List<GloVO> siteList() throws SQLException {
		return session1.selectList(namespace + "siteList");
	}

	@Override
	public List<GloVO> detailList(SearchCriteria cri) throws SQLException {
		return session1.selectList(namespace + "detailList", cri);
	}

	@Override
	public Integer detailCnt(SearchCriteria cri) throws SQLException {

		return session1.selectOne(namespace + "detailCnt", cri);
	}

	@Override
	public void deleteGlo(Integer glo_idx) throws SQLException {
		try {
			session1.delete(namespace + "deleteGlo", glo_idx);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

	@Override
	public void updateGlo(GloVO vo) throws SQLException {
		try {
			session1.update(namespace + "updateGlo", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<GloVO> detailExcel(SearchCriteria cri) throws SQLException {
		return session1.selectList(namespace + "detailExcel", cri);
	}

	@Override
	public List<KeywordVO> keywordList() throws SQLException {
		return session1.selectList(namespace + "keywordList");
	}
}
