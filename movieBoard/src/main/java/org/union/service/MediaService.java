package org.union.service;

import java.util.Date;
import java.util.List;

import org.union.domain.ExtractVO;
import org.union.domain.GraphVO;
import org.union.domain.MailVO;
import org.union.domain.MediaVO;
import org.union.domain.NewsVO;
import org.union.domain.PeriodMediaVO;
import org.union.domain.ReplyVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SearchFv;
import org.union.domain.SearchMedia;
import org.union.domain.TextTypeDateVO;
import org.union.domain.TextTypeVO;

public interface MediaService {

	public void regist(MediaVO vo);
	public void replyAdd(NewsVO vo);
	
	public List<NewsVO> newsList(SearchCriteria cri);
	
	public MediaVO view(Integer media_idx);
	
	public void modify(MediaVO vo);
	
	public void remove(Integer media_idx);
	
	public void checkList(Integer media_idx);
	public void headlineUpdate(Integer media_idx);
	public void headlineUpdate2(Integer media_idx);
	
	public void newsRemove(Integer media_idx);
	
	public void replyRemove(Integer reply_idx);
	
	public List<ReplyVO> replyList(SearchCriteria cri); 
	public List<ReplyVO> replyTotalList(Integer news_idx);
	
	public TextTypeVO periodTextTypeCount(SearchCriteria cri);
	
	public List<MediaVO> allPageList(SearchCriteria cri);
	public List<MediaVO> TotalAllPageList(SearchCriteria cri);
	public Integer allPageCount(SearchCriteria cri);
	public Integer TotalAllPageCount(SearchCriteria cri);
	public Integer newsAllPageCount(SearchCriteria cri);
	public Integer replyAllPageCount(SearchCriteria cri);
	
	public List<MediaVO> allPage(SearchCriteria cri);
	public List<ReplyVO> replyAllPage(SearchCriteria cri);
	
	public GraphVO yesterdayCount();
	public GraphVO showboxYesterdayCount();
	
	public TextTypeVO naverMediaCount(SearchCriteria cri);
	public TextTypeVO daumMediaCount(SearchCriteria cri);
	public TextTypeVO totalMediaCount(SearchCriteria cri);
	
	public List<ExtractVO> listExtract(SearchCriteria cri);
	
	public Integer getExtractCount(SearchCriteria cri);
	
	public List<MediaVO> listSearch(SearchCriteria criteria);
	public List<MediaVO> textTypelistSearch(SearchCriteria cri);
	public List<MediaVO> textTypelistSearch2(SearchCriteria cri);
	public List<MediaVO> textTypelistSearch3(SearchCriteria cri);
	public List<MediaVO> textTypelistSearch4(SearchCriteria cri);
	
	public Integer getSearchCount(SearchCriteria cri);

	public List<MediaVO> wlistSearch(SearchCriteria criteria);
	public List<MediaVO> wlistSearch2(SearchCriteria criteria);
	public List<MediaVO> wPageSearch(SearchCriteria criteria);
	
	public Integer wgetSearchCount(SearchCriteria cri);
	
	public List<MediaVO> listAll(SearchCriteria cri);
	
	public List<PeriodMediaVO> periodMedia(SearchCriteria criteria);
	
	public List<PeriodMediaVO> periodReporter(SearchCriteria criteria);
	
	public Integer getTotalCount(SearchCriteria criteria);
	public Integer getMatchCount(SearchCriteria criteria);
	
	public Integer mediaGetTotalCount(SearchCriteria criteria);
	
	public Integer reporterGetTotalCount(SearchCriteria criteria);
	
	public void modifyType(MediaVO vo);
	public void newsUpdateTextType (NewsVO vo);
	public void newsUpdateState (NewsVO vo);
	public void replyUpdateTextType (ReplyVO vo);
	
	public void modifyThumbnail(MediaVO vo);
	
	public TextTypeVO getMediaPortalCount(SearchCriteria cri);
	public TextTypeVO getMediaTextTypeTotalCount(SearchCriteria cri);
	public TextTypeVO getMediaTextTypeSearchCount(SearchCriteria cri);
	
	public TextTypeVO getPressPortalCount(SearchCriteria cri);
	public TextTypeVO getPressTextTypeTotalCount(SearchCriteria cri);
	public TextTypeVO getPressTextTypeSearchCount(SearchCriteria cri);
	
	public List<MediaVO> reporterGetTextTypeCount(SearchCriteria cri, String reporter,String textType);
	
	public List<MediaVO> mediaCnt(SearchCriteria cri);
	public List<TextTypeDateVO> textTypeCount2(SearchCriteria cri);
	public Integer checkUrl(String url);
	public Integer mTotalCnt(SearchCriteria cri);
	
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
}
