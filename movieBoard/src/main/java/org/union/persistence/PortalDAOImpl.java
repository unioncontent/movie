package org.union.persistence;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.domain.CommunityVO;
import org.union.domain.FvVO;
import org.union.domain.GraphVO;
import org.union.domain.NvVO;
import org.union.domain.PortalVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SearchFv;
import org.union.domain.TextTypeDateVO;
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
	public List<PortalVO> wlistSearch(SearchCriteria vo) {
		
		return session.selectList(namespace + "wlistSearch", vo);
	}
	
	@Override
	public Integer wgetSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "wgetSearchCount", cri);
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
	public List<TextTypeVO> naverTextTypeCountb(SearchCriteria cri) {

		return session.selectList(namespace + "naverTextTypeCountb", cri);
	}
	@Override
	public List<TextTypeVO> naverTextTypeCountc(SearchCriteria cri) {
		
		return session.selectList(namespace + "naverTextTypeCountc", cri);
	}
	@Override
	public List<TextTypeVO> naverTextTypeCountk(SearchCriteria cri) {
		
		return session.selectList(namespace + "naverTextTypeCountk", cri);
	}
	@Override
	public List<TextTypeVO> naverTextTypeCountw(SearchCriteria cri) {
		
		return session.selectList(namespace + "naverTextTypeCountw", cri);
	}


	@Override
	public List<TextTypeVO> daumTextTypeCountb(SearchCriteria cri) {

		return session.selectList(namespace + "daumTextTypeCountb", cri);
	}
	@Override
	public List<TextTypeVO> daumTextTypeCountc(SearchCriteria cri) {
		
		return session.selectList(namespace + "daumTextTypeCountc", cri);
	}
	@Override
	public List<TextTypeVO> daumTextTypeCountk(SearchCriteria cri) {
		
		return session.selectList(namespace + "daumTextTypeCountk", cri);
	}
	@Override
	public List<TextTypeVO> daumTextTypeCountw(SearchCriteria cri) {
		
		return session.selectList(namespace + "daumTextTypeCountw", cri);
	}


	@Override
	public TextTypeVO textTypeCount(SearchCriteria cri) {

		return session.selectOne(namespace + "textTypeCount", cri);
	}
	
	@Override
	public List<TextTypeDateVO> textTypeCount2(SearchCriteria cri) {
		
		return session.selectList(namespace + "textTypeCount2", cri);
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
	public GraphVO showboxToDayCount(String type) {
		
		return session.selectOne(namespace + "showboxToDayCount", type);
	}

	@Override
	public GraphVO yesterdayCount() {

		return session.selectOne(namespace + "yesterdayCount");
	}
	
	@Override
	public GraphVO showboxYesterdayCount() {

		return session.selectOne(namespace + "showboxYesterdayCount");
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
	public List<PortalVO> allPageList(SearchCriteria cri) {
	
		return session.selectList(namespace + "allPageList", cri);
	}

	@Override
	public List<PortalVO> TotalAllPageList(SearchCriteria cri) {
		
		return session.selectList(namespace + "TotalAllPageList", cri);
	}
	
	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return session.selectOne(namespace + "allPageCount", cri);
	}
	
	@Override
	public Integer TotalAllPageCount(SearchCriteria cri) {

		return session.selectOne(namespace + "TotalAllPageCount", cri);
	}

	
	@Override
	public Integer getTypeOfMovieCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getTypeOfMovieCount", cri);
	}


	@Override
	public Integer getTypeOfActorCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getTypeOfActorCount", cri);
	}


	@Override
	public Integer getScoreCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getScoreCount", cri);
	}


	@Override
	public List<PortalVO> getScoreList(SearchCriteria cri) {

		return session.selectList(namespace + "getScoreList", cri);
	}
	
	@Override
	public List<PortalVO> getScoreExcelList(SearchCriteria cri) {

		return session.selectList(namespace + "getScoreExcelList", cri);
	}


	@Override
	public TextTypeVO getScoreTextType(SearchCriteria cri) {

		return session.selectOne(namespace + "getScoreTextType", cri);
	}

	@Override
	public List<Integer> getOnlyScore(SearchCriteria cri) {

		return session.selectList(namespace + "getOnlyScore", cri);
	}


	@Override
	public List<PortalVO> wPageSearch(SearchCriteria cri) {

		return session.selectList(namespace + "wPageSearch", cri);
	}


	@Override
	public List<PortalVO> allPage(SearchCriteria cri) {

		return session.selectList(namespace + "allPage", cri);
	}


	@Override
	public List<NvVO> naverVideosList(SearchCriteria cri) {

		return session.selectList(namespace + "naverVideosList", cri);
	}


	@Override
	public Integer naverVideosListTotalCnt(SearchCriteria cri) {

		return session.selectOne(namespace + "naverVideosListTotalCnt", cri);
	}


	@Override
	public List<NvVO> nvlistSearch(SearchCriteria cri) {

		return session.selectList(namespace + "nvlistSearch", cri);
	}


	@Override
	public Integer nvlistSearchTotalCnt(SearchCriteria cri) {

		return session.selectOne(namespace + "nvlistSearchTotalCnt", cri);
	}


	@Override
	public Integer nvlistViewCnt(SearchFv fv) {

		return session.selectOne(namespace + "nvlistViewCnt", fv);
	}


	

}
