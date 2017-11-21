package org.union.persistence;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.GraphVO;
import org.union.domain.PortalVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeVO;

@Repository
public class PortalDAOImpl implements PortalDAO {

	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.PortalMapper.";
	
	
	@Override
	public void create(PortalVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public PortalVO read(Integer portal_idx) {
		
		return session.selectOne(namespace + "read", portal_idx);
			
	}

	
	@Override
	public void update(PortalVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void delete(Integer portal_idx) {
		try {
			session.delete(namespace + "delete", portal_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public List<PortalVO> listExtract(SearchCriteria cri) {

		return session.selectList(namespace + "listExtract", cri);
		
	}
	
	
	@Override
	public Integer getExtractCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getExtractCount", cri);
	}
	

	@Override
	public List<PortalVO> listSearch(SearchCriteria vo) {
		
		return session.selectList(namespace + "listSearch", vo);
	}
	
	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCount", cri);
	}

	@Override
	public List<PortalVO> listAll(SearchCriteria cri) {

		return session.selectList(namespace + "listAll", cri);
	}

	@Override
	public void updateTextType(PortalVO vo) {
		try {
			session.update(namespace + "updateTextType", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void updateThumbnail(PortalVO vo) {
		try {
			session.update(namespace + "updateThumbnail", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public List<PortalVO> listNaver(SearchCriteria cri) {

		return session.selectList(namespace + "listNaver", cri);
	}


	@Override
	public Integer getNaverCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getNaverCount", cri);
	}


	@Override
	public List<PortalVO> listDaum(SearchCriteria cri) {

		return session.selectList(namespace + "listDaum", cri);
	}


	@Override
	public Integer getDaumCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getDaumCount", cri);
	}


	@Override
	public List<TextTypeVO> naverTextTypeCount(String type) {

		return session.selectList(namespace + "naverTextTypeCount", type);
	}


	@Override
	public List<TextTypeVO> daumTextTypeCount(String type) {

		return session.selectList(namespace + "daumTextTypeCount", type);
	}


	@Override
	public TextTypeVO textTypeCount(SearchCriteria cri) {

		return session.selectOne(namespace + "textTypeCount", cri);
	}


	@Override
	public TextTypeVO blogTextTypeCount(SearchCriteria cri) {

		return session.selectOne(namespace + "blogTextTypeCount", cri);
	}


	@Override
	public TextTypeVO cafeTextTypeCount(SearchCriteria cri) {

		return session.selectOne(namespace + "cafeTextTypeCount", cri);
	}


	@Override
	public GraphVO toDayCount(String type) {

		return session.selectOne(namespace + "toDayCount", type);
	}


	@Override
	public GraphVO yesterdayCount() {

		return session.selectOne(namespace + "yesterdayCount");
	}


	@Override
	public Integer countAll(Date date) {

		return session.selectOne(namespace + "countAll", date);
	}


}
