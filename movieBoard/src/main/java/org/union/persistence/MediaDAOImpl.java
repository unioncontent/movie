package org.union.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.union.controller.MediaController;
import org.union.domain.GraphVO;
import org.union.domain.MailVO;
import org.union.domain.MediaVO;
import org.union.domain.NewsVO;
import org.union.domain.ReplyVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SearchFv;
import org.union.domain.SearchMedia;
import org.union.domain.TextTypeDateVO;
import org.union.domain.TextTypeVO;

@Repository
public class MediaDAOImpl implements MediaDAO {

	@Autowired
	private SqlSession session;
	
	private static final String namespace = "org.union.mappers.MediaMapper.";
	private static Logger logger = LoggerFactory.getLogger(MediaController.class);
	
	@Override
	public void create(MediaVO vo) {
		try {
			session.insert(namespace + "create", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void replyAdd(NewsVO vo) {
		try {
			session.insert(namespace + "replyAdd", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public List<NewsVO> newsList(SearchCriteria cri) {
		
		return session.selectList(namespace + "newsList", cri);
	}

	@Override
	public List<ReplyVO> replyList(SearchCriteria cri) {
		logger.info("replyList: " + cri);
		return session.selectList(namespace + "replyList", cri);
	}
	
	@Override
	public MediaVO read(Integer media_idx) {

		return session.selectOne(namespace + "read", media_idx);
	}

	
	@Override
	public void update(MediaVO vo) {
		try {
			session.update(namespace + "update", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void delete(Integer media_idx) {
		try {
			session.delete(namespace + "delete", media_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
	
	@Override
	public void newsDelete(Integer media_idx) {
		try {
			session.delete(namespace + "newsDelete", media_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
	
	@Override
	public void replyDelete(Integer reply_idx) {
		try {
			session.delete(namespace + "replyDelete", reply_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
	
	@Override
	public List<MediaVO> listExtract(SearchCriteria cri) {

		return session.selectList(namespace + "listExtract", cri);
	}

	@Override
	public Integer getExtractCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getExtractCount", cri);
	}



	@Override
	public List<MediaVO> listSearch(SearchCriteria vo) {
		
		return session.selectList(namespace + "listSearch", vo);
	}
	
	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getSearchCount", cri);
	}
	
	@Override
	public List<MediaVO> wlistSearch(SearchCriteria vo) {
		
		return session.selectList(namespace + "wlistSearch", vo);
	}
	
	@Override
	public List<MediaVO> wlistSearch2(SearchCriteria vo) {
		
		return session.selectList(namespace + "wlistSearch2", vo);
	}

	
	@Override
	public Integer wgetSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "wgetSearchCount", cri);
	}
	
	@Override
	public List<MediaVO> searchAll(SearchCriteria criteria) {

		return session.selectList(namespace + "searchAll", criteria);
	}

	public List<MediaVO> listAll(SearchCriteria cri) {

		return session.selectList(namespace + "listAll", cri);
	}
	
	@Override
	public Integer mediaGetTotalCount(SearchCriteria criteria) {

		return session.selectOne(namespace + "mediaGetTotalCount", criteria);
	}


	@Override
	public Integer reporterGetTotalCount(SearchCriteria criteria) {

		return session.selectOne(namespace + "reporterGetTotalCount", criteria);
	}
	

	@Override
	public void updateTextType(MediaVO vo) {
		try {
			session.update(namespace + "updateTextType", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void newsUpdateTextType(NewsVO vo) {
		try {
			session.update(namespace + "newsUpdateTextType", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void newsUpdateState(NewsVO vo) {
		try {
			session.update(namespace + "newsUpdateState", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void replyUpdateTextType(ReplyVO vo) {
		try {
			session.update(namespace + "replyUpdateTextType", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void updateThumbnail(MediaVO vo) {
		try {
			session.update(namespace + "updateThumbnail", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public Integer mediaGetSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "mediaGetSearchCount", cri);
	}


	@Override
	public Integer reporterGetSearchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "reporterGetSearchCount", cri);
	}


	@Override
	public TextTypeVO naverMediaCount(SearchCriteria cri) {

		return session.selectOne(namespace + "naverMediaCount", cri);
	}


	@Override
	public TextTypeVO daumMediaCount(SearchCriteria cri) {

		return session.selectOne(namespace + "daumMediaCount", cri);
	}
	
	@Override
	public TextTypeVO totalMediaCount(SearchCriteria cri) {

		return session.selectOne(namespace + "totalMediaCount", cri);
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
	public List<MediaVO> allPageList(SearchCriteria cri) {

		return session.selectList(namespace + "allPageList", cri);
	}
	
	@Override
	public List<MediaVO> TotalAllPageList(SearchCriteria cri) {
		
		return session.selectList(namespace + "TotalAllPageList", cri);
	}

	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return session.selectOne(namespace + "allPageCount", cri);
	}
	
	@Override
	public Integer newsAllPageCount(SearchCriteria cri) {

		return session.selectOne(namespace + "newsAllPageCount", cri);
	}
	
	@Override
	public Integer replyAllPageCount(SearchCriteria cri) {

		return session.selectOne(namespace + "replyAllPageCount", cri);
	}
	
	@Override
	public List<ReplyVO> replyTotalList(Integer news_idx) {

		return session.selectList(namespace + "replyTotalList", news_idx);
	}
	
	@Override
	public Integer TotalAllPageCount(SearchCriteria cri) {

		return session.selectOne(namespace + "TotalAllPageCount", cri);
	}

	@Override
	public List<MediaVO> allPage(SearchCriteria cri) {

		return session.selectList(namespace + "allPage", cri);
	}
	
	@Override
	public List<ReplyVO> replyAllPage(SearchCriteria cri) {

		return session.selectList(namespace + "replyAllPage", cri);
	}

	@Override
	public Integer getTotalCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getTotalCount", cri);
		
	}

	@Override
	public Integer getMatchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getMatchCount", cri);
	}


	@Override
	public TextTypeVO periodTextTypeCount(SearchCriteria cri) {

		return session.selectOne(namespace + "periodTextTypeCount", cri);
	}


	@Override
	public TextTypeVO getMediaPortalCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getMediaPortalCount", cri);
	}


	@Override
	public TextTypeVO getMediaTextTypeTotalCount(SearchCriteria cri) {

		return session.selectOne(namespace + "getMediaTextTypeTotalCount", cri);
	}


	@Override
	public TextTypeVO getMediaTextTypeSearchCount(SearchCriteria cri) {
		
		return session.selectOne(namespace + "getMediaTextTypeSearchCount", cri);
	}


	@Override
	public TextTypeVO getPressPortalCount(SearchCriteria cri) {
		
		return session.selectOne(namespace + "getPressPortalCount", cri);
	}


	@Override
	public TextTypeVO getPressTextTypeTotalCount(SearchCriteria cri) {
		
		return session.selectOne(namespace + "getPressTextTypeTotalCount", cri);
	}


	@Override
	public TextTypeVO getPressTextTypeSearchCount(SearchCriteria cri) {
		
		return session.selectOne(namespace + "getPressTextTypeSearchCount", cri);
	}


	@Override
	public List<MediaVO> wPageSearch(SearchCriteria cri) {

		return session.selectList(namespace + "wPageSearch", cri);
	}
	
	@Override
	public List<MediaVO> textTypelistSearch(SearchCriteria cri) {
		
		return session.selectList(namespace + "textTypelistSearch", cri);
	}

	@Override
	public List<MediaVO> textTypelistSearch2(SearchCriteria cri) {
		
		return session.selectList(namespace + "textTypelistSearch2", cri);
	}


	@Override
	public List<MediaVO> textTypelistSearch3(SearchCriteria cri) {
		
		return session.selectList(namespace + "textTypelistSearch3", cri);
	}


	@Override
	public List<MediaVO> textTypelistSearch4(SearchCriteria cri) {
		
		return session.selectList(namespace + "textTypelistSearch4", cri);
	}


	@Override
	public List<MediaVO> reporterGetTextTypeCount(SearchCriteria cri, String reporter, String textType) {
		
		Map data = new HashMap();
		data.put("cri", cri);
		data.put("reporter", reporter);
		data.put("textType", textType);
		
		
		return session.selectList(namespace + "reporterGetTextTypeCount", data);
	}

	@Override
	public List<MediaVO> mediaCnt(SearchCriteria cri) {
		return session.selectList(namespace + "mediaCnt", cri);
	}

	@Override
	public List<TextTypeDateVO> textTypeCount2(SearchCriteria cri) {

		return session.selectList(namespace + "textTypeCount2", cri);
	}

	@Override
	public Integer checkUrl(String url) {
		return session.selectOne(namespace + "checkUrl", url);
	}

	@Override
	public Integer mTotalCnt(SearchCriteria cri) {

		return session.selectOne(namespace + "mTotalCnt", cri);
	}

	@Override
	public void checkList(Integer media_idx) {
		try {
			session.insert(namespace + "checkList", media_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<MediaVO> headlineList(SearchCriteria cri) {

		return session.selectList(namespace + "headlineList", cri);
	}

	@Override
	public Integer mediaTotalcnt(SearchCriteria cri) {
		
		return session.selectOne(namespace + "mediaTotalcnt", cri);
	}

	@Override
	public Integer replyTotalcnt(SearchCriteria cri) {
		
		return session.selectOne(namespace + "replyTotalcnt", cri);
	}

	@Override
	public Integer mediaTextcnt(SearchCriteria cri) {

		return session.selectOne(namespace + "mediaTextcnt", cri);
	}

	@Override
	public Integer mediaTextcnt2(SearchCriteria cri) {

		return session.selectOne(namespace + "mediaTextcnt2", cri);
	}

	@Override
	public Integer mediaCountAll(SearchCriteria cri) {

		return session.selectOne(namespace + "mediaCountAll", cri);
	}

	@Override
	public void headlineUpdate(Integer media_idx) {
		try {
			session.insert(namespace + "headlineUpdate", media_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void headlineUpdate2(Integer media_idx) {
		try {
			session.insert(namespace + "headlineUpdate2", media_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<MailVO> mailList(SearchCriteria cri) {

		return session.selectList(namespace + "mailList", cri);
	}

	@Override
	public Integer mailCountAll(SearchCriteria cri) {

		return session.selectOne(namespace + "mailCountAll", cri);
	}

	@Override
	public List<MediaVO> mediaMatchList(SearchCriteria cri) {

		return session.selectList(namespace + "mediaMatchList", cri);
	}

	@Override
	public Integer mediaMatchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "mediaMatchCount", cri);
	}

	@Override
	public List<MediaVO> mediaMatchList2(SearchCriteria cri) {

		return session.selectList(namespace + "mediaMatchList2", cri);
	}

	@Override
	public Integer mediaMatchCount2(SearchCriteria cri) {

		return session.selectOne(namespace + "mediaMatchCount2", cri);
	}
	
	@Override
	public Integer mediaMatchCount3(SearchCriteria cri) {

		return session.selectOne(namespace + "mediaMatchCount3", cri);
	}

	@Override
	public List<MediaVO> mediaTotalMatchList(SearchCriteria cri) {

		return session.selectList(namespace + "mediaTotalMatchList", cri);
	}

	@Override
	public List<MediaVO> reporterMatchList(SearchCriteria cri) {

		return session.selectList(namespace + "reporterMatchList", cri);
	}

	@Override
	public Integer reporterMatchCount(SearchCriteria cri) {

		return session.selectOne(namespace + "reporterMatchCount", cri);
	}

	@Override
	public List<MediaVO> reporterMatchList2(SearchCriteria cri) {

		return session.selectList(namespace + "reporterMatchList2", cri);
	}

	@Override
	public Integer reporterMatchCount2(SearchCriteria cri) {

		return session.selectOne(namespace + "reporterMatchCount2", cri);
	}

	@Override
	public Integer reporterMatchCount3(SearchCriteria cri) {

		return session.selectOne(namespace + "reporterMatchCount3", cri);
	}

	@Override
	public List<MediaVO> reporterTotalMatchList(SearchCriteria cri) {

		return session.selectList(namespace + "reporterTotalMatchList", cri);
	}

	@Override
	public List<MediaVO> mediaMatchallList(SearchCriteria cri) {

		return session.selectList(namespace + "mediaMatchallList", cri);
	}

	@Override
	public List<MediaVO> reporterMatchallList(SearchCriteria cri) {

		return session.selectList(namespace + "reporterMatchallList", cri);
	}

	@Override
	public List<MediaVO> mediaDataList(SearchCriteria cri) {

		return session.selectList(namespace + "mediaDataList", cri);
	}

	@Override
	public List<MediaVO> mediaMatchDataList(SearchCriteria cri) {

		return session.selectList(namespace + "mediaMatchDataList", cri);
	}

	@Override
	public List<MediaVO> reporterDataList(SearchCriteria cri) {

		return session.selectList(namespace + "reporterDataList", cri);
	}

	@Override
	public List<MediaVO> reporterMatchDataList(SearchCriteria cri) {

		return session.selectList(namespace + "reporterMatchDataList", cri);
	}

	@Override
	public Integer mediaMatchCount4(SearchCriteria cri) {

		return session.selectOne(namespace + "mediaMatchCount4", cri);
	}

	@Override
	public Integer reporterMatchCount4(SearchCriteria cri) {

		return session.selectOne(namespace + "reporterMatchCount4", cri);
	}

	@Override
	public void checkDelete(Integer media_idx) {
		try {
			session.delete(namespace + "checkDelete", media_idx);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}

	@Override
	public List<MediaVO> totalAllPageex(SearchCriteria cri) {

		return session.selectList(namespace + "totalAllPageex", cri);
	}

	@Override
	public List<MediaVO> mailMatch(SearchCriteria cri) {

		return session.selectList(namespace + "mailMatch", cri);
	}

	@Override
	public List<MediaVO> mediaListData(SearchCriteria cri) {

		return session.selectList(namespace + "mediaListData", cri);
	}

	@Override
	public Integer graphmTotalCnt(SearchCriteria cri) {

		return session.selectOne(namespace + "graphmTotalCnt", cri);
	}

	@Override
	public List<MediaVO> dashListAll(SearchCriteria cri) {

		return session.selectList(namespace + "dashListAll", cri);
	}

	@Override
	public List<MediaVO> newsExcel(SearchCriteria cri) {

		return session.selectList(namespace + "newsExcel", cri);
	}

	@Override
	public List<MediaVO> dashMediaMatch(SearchCriteria cri) {

		return session.selectList(namespace + "dashMediaMatch", cri);
	}

	@Override
	public List<MediaVO> listAllEx(SearchCriteria cri) {

		return session.selectList(namespace + "listAllEx", cri);
	}
}
