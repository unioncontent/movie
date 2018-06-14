package org.union.persistence;

import java.util.Date;
import java.util.List;

import org.union.domain.GraphVO;
import org.union.domain.MailVO;
import org.union.domain.MediaVO;
import org.union.domain.NewsVO;
import org.union.domain.ReplyVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SearchFv;
import org.union.domain.SearchMedia;
import org.union.domain.TextTypeDateVO;
import org.union.domain.TextTypeVO;

public interface MediaDAO {

	public void create(MediaVO vo);
	public void replyAdd(NewsVO vo);
	
	public MediaVO read(Integer media_idx);
	
	public void update(MediaVO vo);
	
	public void delete(Integer media_idx);
	
	public void checkList(Integer media_idx);
	public void checkDelete(Integer media_idx);
	public void headlineUpdate(Integer media_idx);
	public void headlineUpdate2(Integer media_idx);
	
	public void newsDelete(Integer news_idx);
	public void replyDelete(Integer reply_idx);
	
	public List<ReplyVO> replyTotalList(Integer news_idx);
	
	public TextTypeVO periodTextTypeCount(SearchCriteria cri);
	
	public List<MediaVO> allPageList(SearchCriteria cri);
	public List<MediaVO> TotalAllPageList(SearchCriteria cri);
	public Integer allPageCount(SearchCriteria cri);
	public Integer TotalAllPageCount(SearchCriteria cri);
	public Integer newsAllPageCount(SearchCriteria cri);
	public Integer replyAllPageCount(SearchCriteria cri);
	
	public List<MediaVO> allPage(SearchCriteria cri);
	public List<MediaVO> totalAllPageex(SearchCriteria cri);
	public List<ReplyVO> replyAllPage(SearchCriteria cri);
	
	public GraphVO yesterdayCount();
	public GraphVO showboxYesterdayCount();
	
	public TextTypeVO naverMediaCount(SearchCriteria cri);
	public TextTypeVO daumMediaCount(SearchCriteria cri);
	public TextTypeVO totalMediaCount(SearchCriteria cri);
	
	public List<MediaVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<MediaVO> listSearch(SearchCriteria cri);
	public List<MediaVO> textTypelistSearch(SearchCriteria cri);
	public List<MediaVO> textTypelistSearch2(SearchCriteria cri);
	public List<MediaVO> textTypelistSearch3(SearchCriteria cri);
	public List<MediaVO> textTypelistSearch4(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);
	
	public List<MediaVO> mediaListData(SearchCriteria cri);
	public List<MediaVO> wlistSearch(SearchCriteria cri);
	public List<MediaVO> wlistSearch2(SearchCriteria cri);
	public List<MediaVO> wPageSearch(SearchCriteria cri);
	public Integer wgetSearchCount(SearchCriteria cri);
	
	
	public List<MediaVO> listAll(SearchCriteria cri);
	
	public List<MediaVO> searchAll(SearchCriteria cri);
	
	public Integer getTotalCount(SearchCriteria cri);
	public Integer getMatchCount(SearchCriteria cri);
	
	public Integer mediaGetTotalCount(SearchCriteria cri);
	
	public Integer reporterGetTotalCount(SearchCriteria cri);
	
	public Integer mediaGetSearchCount(SearchCriteria cri);
	
	public Integer reporterGetSearchCount(SearchCriteria cri);
	
	public void updateTextType (MediaVO vo);
	public void newsUpdateTextType (NewsVO vo);
	public void newsUpdateState (NewsVO vo);
	public void replyUpdateTextType (ReplyVO vo);
	
	public void updateThumbnail (MediaVO vo);
	
	public TextTypeVO getMediaPortalCount(SearchCriteria cri);
	public TextTypeVO getMediaTextTypeTotalCount(SearchCriteria cri);
	public TextTypeVO getMediaTextTypeSearchCount(SearchCriteria cri);
	
	public TextTypeVO getPressPortalCount(SearchCriteria cri);
	public TextTypeVO getPressTextTypeTotalCount(SearchCriteria cri);
	public TextTypeVO getPressTextTypeSearchCount(SearchCriteria cri);
	
	
	public List<MediaVO> reporterGetTextTypeCount(SearchCriteria cri, String reporter,String textType);
	
	public List<NewsVO> newsList(SearchCriteria cri);
	
	public List<ReplyVO> replyList(SearchCriteria cri);
	
	public List<MediaVO> mediaCnt(SearchCriteria cri);
	public List<TextTypeDateVO> textTypeCount2(SearchCriteria cri);
	public Integer checkUrl(String url);
	public Integer mTotalCnt(SearchCriteria cri);
	public Integer graphmTotalCnt(SearchCriteria cri);
	
	public List<MediaVO> headlineList(SearchCriteria cri);
	public Integer mediaTotalcnt(SearchCriteria cri);
	public Integer replyTotalcnt(SearchCriteria cri);
	
	public Integer mediaTextcnt(SearchCriteria cri);
	public Integer mediaTextcnt2(SearchCriteria cri);
	public Integer mediaCountAll(SearchCriteria cri);
	public List<MailVO> mailList(SearchCriteria cri);
	public Integer mailCountAll(SearchCriteria cri);
	
	public List<MediaVO> mediaMatchList(SearchCriteria cri);
	public Integer mediaMatchCount(SearchCriteria cri);
	public List<MediaVO> mediaMatchList2(SearchCriteria cri);
	public Integer mediaMatchCount2(SearchCriteria cri);
	public Integer mediaMatchCount3(SearchCriteria cri);
	public Integer mediaMatchCount4(SearchCriteria cri);
	public List<MediaVO> mediaTotalMatchList(SearchCriteria cri);
	public List<MediaVO> mediaDataList(SearchCriteria cri);
	public List<MediaVO> mediaMatchDataList(SearchCriteria cri);
	
	public List<MediaVO> reporterMatchList(SearchCriteria cri);
	public Integer reporterMatchCount(SearchCriteria cri);
	public List<MediaVO> reporterMatchList2(SearchCriteria cri);
	public Integer reporterMatchCount2(SearchCriteria cri);
	public Integer reporterMatchCount3(SearchCriteria cri);
	public Integer reporterMatchCount4(SearchCriteria cri);
	public List<MediaVO> reporterTotalMatchList(SearchCriteria cri);
	public List<MediaVO> reporterDataList(SearchCriteria cri);
	public List<MediaVO> reporterMatchDataList(SearchCriteria cri);
	
	public List<MediaVO> mediaMatchallList(SearchCriteria cri);
	public List<MediaVO> reporterMatchallList(SearchCriteria cri);
	public List<MediaVO> mailMatch(SearchCriteria cri);
}
