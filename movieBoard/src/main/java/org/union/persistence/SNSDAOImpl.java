package org.union.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.FvVO;
import org.union.domain.GraphVO;
import org.union.domain.NvVO;
import org.union.domain.ReplyVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SearchFv;

@Repository
public class SNSDAOImpl implements SNSDAO {

	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.SNSMapper.";
	
	
	@Override
	public void create(SNSVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public SNSVO read(Integer SNS_idx) {
		
		return session.selectOne(namespace + "read", SNS_idx);
	}

	
	@Override
	public void update(SNSVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void delete(Integer SNS_idx) {
		try {
			session.delete(namespace + "delete", SNS_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<SNSVO> listExtract(SearchCriteria cri) {

		return session.selectList(namespace + "listExtract", cri);
	}


	@Override
	public Integer getExtractCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getExtractCount", cri);
	}
	
	
	@Override
	public List<SNSVO> listSearch(SearchCriteria cri) {

		return session.selectList(namespace + "listSearch", cri);
	}


	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCount", cri);
	}

	@Override
	public List<SNSVO> listAll(SearchCriteria cri) {

		return session.selectList(namespace + "listAll", cri);
	}
	
	@Override
	public List<SNSVO> facebookList(SearchCriteria cri) {
		
		return session.selectList(namespace + "facebookList", cri);
	}

	
	@Override
	public Integer facebookTotalCount(SearchCriteria  cri) {

		return session.selectOne(namespace + "facebookTotalCount", cri);
	}
	
	
	@Override
	public List<SNSVO> instaList(SearchCriteria cri) {

		return session.selectList(namespace + "instaList", cri);
	}


	@Override
	public Integer instaTotalCount(SearchCriteria cri) {

		return session.selectOne(namespace + "instaTotalCount", cri);
	}


	@Override
	public List<SNSVO> twitterList(SearchCriteria cri) {

		return session.selectList(namespace + "twitterList", cri);
	}


	@Override
	public Integer twitterTotalCount(SearchCriteria cri) {

		return session.selectOne(namespace + "twitterTotalCount", cri);
	}


	@Override
	public void updateTextType(SNSVO vo) {
		try {
			session.update(namespace + "updateTextType", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void updateThumbnail(SNSVO vo) {
		try {
			session.update(namespace + "updateThumbnail", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public List<SNSVO> getDateCount(SearchCriteria cri) {

		return session.selectList(namespace + "getDateCount", cri);
	}


	@Override
	public List<SNSVO> listExcel(SearchCriteria cri) {

		return session.selectList(namespace + "listExcel", cri);
	}


	@Override
	public Integer listExcelCount(SearchCriteria cri) {

		return session.selectOne(namespace + "listExcelCount", cri);
	}


	@Override
	public GraphVO facebookSum(SearchCriteria cri) {

		return session.selectOne(namespace + "facebookSum", cri);
	}


	@Override
	public GraphVO twitterSum(SearchCriteria cri) {

		return session.selectOne(namespace + "twitterSum", cri);
	}


	@Override
	public GraphVO instagramSum(SearchCriteria cri) {

		return session.selectOne(namespace + "instagramSum", cri);
	}


	@Override
	public GraphVO yesterdayCount(String name) {

		return session.selectOne(namespace + "yesterdayCount", name);
	}

	@Override
	public GraphVO showboxYesterdayCount(String name) {

		return session.selectOne(namespace + "showboxYesterdayCount", name);
	}

	@Override
	public Integer countAll(Date date) {

		return session.selectOne(namespace + "countAll", date);
	}
	
	@Override
	public Integer showboxCountAll(Date date) {

		return session.selectOne(namespace + "showboxCountAll", date);
	}

	@Override
	public List<SNSVO> allPageList(SearchCriteria cri) {

		return session.selectList(namespace + "allPageList", cri);
	}


	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return session.selectOne(namespace + "allPageCount", cri);
	}


	@Override
	public List<SNSVO> facebookCnt(SearchCriteria cri) {
		return session.selectList(namespace + "facebookCnt", cri);
	}


	@Override
	public List<SNSVO> instaCnt(SearchCriteria cri) {
		return session.selectList(namespace + "instaCnt", cri);
	}


	@Override
	public List<SNSVO> twiCnt(SearchCriteria cri) {
		return session.selectList(namespace + "twiCnt", cri);
	}


	@Override
	public List<SNSVO> snsTotalCnt(SearchCriteria cri) {
		return session.selectList(namespace + "snsTotalCnt", cri);
	}


	@Override
	public List<FvVO> facebookCGV(SearchCriteria cri) {

		return session.selectList(namespace + "facebookCGV", cri);
	}


	@Override
	public List<FvVO> facebookCGVList(SearchCriteria cri) {

		return session.selectList(namespace + "facebookCGVList", cri);
	}


	@Override
	public Integer facebookCGVListTotalCnt(SearchCriteria cri) {

		return session.selectOne(namespace + "facebookCGVListTotalCnt", cri);
	}


	@Override
	public List<FvVO> fvlistSearch(SearchCriteria cri) {

		return session.selectList(namespace + "fvlistSearch", cri);
	}


	@Override
	public Integer fvlistSearchTotalCnt(SearchCriteria cri) {

		return session.selectOne(namespace + "fvlistSearchTotalCnt", cri);
	}


	@Override
	public Integer fvlistViewCnt(SearchFv fv) {
		
		return session.selectOne(namespace + "fvlistViewCnt", fv);
	}


	@Override
	public List<FvVO> fvlistMinus(SearchCriteria cri) {

		return session.selectList(namespace + "fvlistMinus", cri);
	}


	@Override
	public Integer fvlistReply_cnt(SearchFv fv) {
		
		return session.selectOne(namespace + "fvlistReply_cnt", fv);
	}


	@Override
	public Integer fvlistlike_cnt(SearchFv fv) {
		
		return session.selectOne(namespace + "fvlistlike_cnt", fv);
	}


	@Override
	public List<FvVO> fvlistSearchEx(SearchCriteria cri) {

		return session.selectList(namespace + "fvlistSearchEx", cri);
	}


	@Override
	public List<FvVO> fvlistSearchTime(SearchCriteria cri) {

		return session.selectList(namespace + "fvlistSearchTime", cri);
	}


	@Override
	public List<FvVO> fvlistSearchList(SearchCriteria cri) {

		return session.selectList(namespace + "fvlistSearchList", cri);
	}


	@Override
	public Integer fvlistSearchListTotalCnt(SearchCriteria cri) {

		return session.selectOne(namespace + "fvlistSearchListTotalCnt", cri);
	}


	@Override
	public List<FvVO> fvSearchlistSearchTime(SearchCriteria cri) {

		return session.selectList(namespace + "fvSearchlistSearchTime", cri);
	}


}
