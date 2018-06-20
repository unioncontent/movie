package org.union.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.ExtractVO;
import org.union.domain.GraphVO;
import org.union.domain.MailVO;
import org.union.domain.MediaVO;
import org.union.domain.NewsVO;
import org.union.domain.PeriodMediaVO;
import org.union.domain.PortalVO;
import org.union.domain.ReplyVO;
import org.union.domain.ReporterVO;
import org.union.domain.SearchCriteria;
import org.union.domain.SearchFv;
import org.union.domain.SearchMedia;
import org.union.domain.TextTypeDateVO;
import org.union.domain.TextTypeVO;
import org.union.persistence.KeywordDAO;
import org.union.persistence.MediaDAO;
import org.union.persistence.ReporterDAO;

@Service
public class MediaServiceImpl implements MediaService {

	@Autowired
	MediaDAO mediaDAO;
	
	@Autowired
	ReporterDAO reporterDAO;
	
	@Autowired
	private KeywordDAO keywordDAO;
	
	
	@Override
	public void regist(MediaVO vo) {

		mediaDAO.create(vo);
	}
	
	@Override
	public void replyAdd(NewsVO vo) {

		try {
			mediaDAO.replyAdd(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public MediaVO view(Integer media_idx) {

		return mediaDAO.read(media_idx);
	}

	@Override
	public void modify(MediaVO vo) {

		mediaDAO.update(vo);
	}

	@Override
	public void remove(Integer media_idx) {

		mediaDAO.delete(media_idx);
		
	}
	
	@Override
	public void checkList(Integer media_idx) {

		mediaDAO.checkList(media_idx);
		
	}


	@Override
	public void newsRemove(Integer media_idx) {

		mediaDAO.newsDelete(media_idx);
		
	}
	
	@Override
	public void replyRemove(Integer reply_idx) {

		mediaDAO.replyDelete(reply_idx);
		
	}
	
	@Override
	public List<ExtractVO> listExtract(SearchCriteria cri) {

		try {
			List<MediaVO> mediaList = mediaDAO.listExtract(cri);
			
			List<ExtractVO> extractList = new ArrayList<ExtractVO>();
			
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			for(int i = 0; i < mediaList.size(); i++) {
				ExtractVO vo = new ExtractVO();
				MediaVO data = mediaList.get(i);
				
				vo.setMedia_idx(data.getMedia_idx());
				vo.setDomain("media");
				vo.setDomainType(data.getMedia_name());
				vo.setTitle(data.getMedia_title());
				vo.setContent(data.getMedia_content());
				vo.setKeyword(data.getKeyword());
				vo.setUrl(data.getUrl());
				vo.setCreateDate(date.format(data.getCreateDate()));
				vo.setWriteDate(data.getWriteDate());
				
				extractList.add(vo);
			}
			
			return extractList;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Integer getExtractCount(SearchCriteria cri) {

		return mediaDAO.getExtractCount(cri);
	}

	
	
	@Override
	public List<MediaVO> listSearch(SearchCriteria vo) {

		List<MediaVO> list = mediaDAO.listSearch(vo);
		
		for (MediaVO mediaVO : list) {
			if(mediaVO.getKeyword() != null && !mediaVO.getKeyword().equals("press")) {
				
				try {
					mediaVO.setKeyword_main(keywordDAO.read(mediaVO.getKeyword()).getKeyword_main());
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		}
		
		return mediaDAO.listSearch(vo);
	}
	
	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return mediaDAO.getSearchCount(cri);
	}

	@Override
	public List<MediaVO> wlistSearch(SearchCriteria vo) {

		List<MediaVO> list = mediaDAO.wlistSearch(vo);
		
		for (MediaVO mediaVO : list) {
			if(mediaVO.getKeyword() != null && !mediaVO.getKeyword().equals("press")) {
				
				try {
					mediaVO.setKeyword_main(keywordDAO.read(mediaVO.getKeyword()).getKeyword_main());
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		}
		
		return mediaDAO.listSearch(vo);
	}
	
	@Override
	public List<MediaVO> wlistSearch2(SearchCriteria vo) {
		
		List<MediaVO> list = mediaDAO.wlistSearch2(vo);
		
		for (MediaVO mediaVO : list) {
			if(mediaVO.getKeyword() != null && !mediaVO.getKeyword().equals("press")) {
				
				try {
					mediaVO.setKeyword_main(keywordDAO.read(mediaVO.getKeyword()).getKeyword_main());
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		}
		
		return mediaDAO.listSearch(vo);
	}
	
	@Override
	public Integer wgetSearchCount(SearchCriteria cri) {

		return mediaDAO.wgetSearchCount(cri);
	}

	
	
	@Override
	public List<PeriodMediaVO> periodMedia(SearchCriteria criteria) {

		List<PeriodMediaVO> periodList = new ArrayList<PeriodMediaVO>();

		List<ReporterVO> reporterList = reporterDAO.listChecked();

		
		for (int i = 0; i < reporterList.size(); i++) {
			PeriodMediaVO vo = new PeriodMediaVO();

			criteria.setKeyword(reporterList.get(i).getReporter_media_name());
			vo.setAllCount(mediaDAO.mediaGetTotalCount(criteria));
			
			Integer searchCount = mediaDAO.mediaGetSearchCount(criteria);
			if(criteria.getCompany() == null && criteria.getSelectKey() == null) {
				vo.setSearchCount(0);
			
			}else {
				vo.setSearchCount(searchCount);
			}
			
			if(vo.getSearchCount() != 0 && vo.getAllCount() != 0) {
				vo.setMatchPercent(Math.ceil(((double)vo.getSearchCount()/(double)vo.getAllCount())*100));
				
			}else {
				vo.setMatchPercent(0);
			}
			
			vo.setMedia(reporterList.get(i).getReporter_media_name());
			vo.setReporter(reporterList.get(i).getReporter_name());
			
			periodList.add(vo);

		}

		/*for(int i = 0; i < periodList.size(); i++) {
			for(int j = 0; j < periodList.size(); j++) {
				if(i == j) {
					
				}else if(periodList.get(i).getMedia().equals(periodList.get(j).getMedia())) {
					int calcCount = periodList.get(i).getAllCount() + periodList.get(j).getAllCount();
					periodList.get(i).setAllCount(calcCount);
					periodList.remove(j);
				}
			}
		}*/
		
		/*PeriodComparator comparator = new PeriodComparator();
		
		Collections.sort(periodList, comparator);
		
		periodList = periodList.subList(0, 20);*/

		return periodList;
	}
	
	
	@Override
	public List<PeriodMediaVO> periodReporter(SearchCriteria criteria) {

		List<PeriodMediaVO> periodList = new ArrayList<PeriodMediaVO>();

		List<ReporterVO> reporterList = reporterDAO.listAll();

		for (int i = 0; i < reporterList.size(); i++) {
			PeriodMediaVO vo = new PeriodMediaVO();

			criteria.setKeyword(reporterList.get(i).getReporter_name());
			vo.setAllCount(mediaDAO.reporterGetTotalCount(criteria));
			
			Integer searchCount = mediaDAO.reporterGetSearchCount(criteria);
			if(criteria.getCompany() == null && criteria.getSelectKey() == null) {
				vo.setSearchCount(0);
			
			}else {
				vo.setSearchCount(searchCount);
			}
			
			if(vo.getSearchCount() != 0 && vo.getAllCount() != 0) {
				vo.setMatchPercent(Math.ceil(((double)vo.getSearchCount()/(double)vo.getAllCount())*100));
				
			}else {
				vo.setMatchPercent(0);
			}
			
			vo.setMedia(reporterList.get(i).getReporter_media_name());
			vo.setReporter(reporterList.get(i).getReporter_name());
			
			periodList.add(vo);
		}
		
		/*PeriodComparator comparator = new PeriodComparator();
		
		Collections.sort(periodList, comparator);
	
		periodList = periodList.subList(0, 20);*/
		
		return periodList;
	}
	
	
	@Override
	public Integer mediaGetTotalCount(SearchCriteria criteria) {

		return mediaDAO.mediaGetTotalCount(criteria);
		
	}

	@Override
	public Integer reporterGetTotalCount(SearchCriteria criteria) {

		return mediaDAO.reporterGetTotalCount(criteria);
	}

	@Override
	public void modifyType(MediaVO vo) {

		mediaDAO.updateTextType(vo);
	}
	
	@Override
	public void newsUpdateTextType(NewsVO vo) {
		
		mediaDAO.newsUpdateTextType(vo);
	}
	
	@Override
	public void newsUpdateState(NewsVO vo) {
		
		mediaDAO.newsUpdateState(vo);
	}
	
	@Override
	public void replyUpdateTextType(ReplyVO vo) {
		
		mediaDAO.replyUpdateTextType(vo);
	}

	@Override
	public void modifyThumbnail(MediaVO vo) {

		mediaDAO.updateThumbnail(vo);
	}

	@Override
	public List<MediaVO> listAll(SearchCriteria cri) {

		List<MediaVO> list = mediaDAO.listAll(cri);
		
		for (MediaVO mediaVO : list) {
			mediaVO.setKeyword_main(keywordDAO.read(mediaVO.getKeyword()).getKeyword_main());
		}

		return list;
	}

	@Override
	public TextTypeVO naverMediaCount(SearchCriteria cri) {

		return mediaDAO.naverMediaCount(cri);
	}

	@Override
	public TextTypeVO daumMediaCount(SearchCriteria cri) {

		return mediaDAO.daumMediaCount(cri);
	}
	
	@Override
	public TextTypeVO totalMediaCount(SearchCriteria cri) {

		return mediaDAO.totalMediaCount(cri);
	}

	@Override
	public GraphVO yesterdayCount() {

		return mediaDAO.yesterdayCount();
	}
	
	@Override
	public GraphVO showboxYesterdayCount() {

		return mediaDAO.showboxYesterdayCount();
	}

	@Override
	public List<MediaVO> allPageList(SearchCriteria cri) {

		List<MediaVO> list = mediaDAO.allPageList(cri);
		
		return list;
	}
	
	@Override
	public List<MediaVO> TotalAllPageList(SearchCriteria cri) {

		List<MediaVO> list = mediaDAO.TotalAllPageList(cri);
		
		return list;
	}
	
	@Override
	public List<NewsVO> newsList(SearchCriteria cri) {
		
		List<NewsVO> list = mediaDAO.newsList(cri);
		
		return list;
	}
	
	@Override
	public List<ReplyVO> replyList(SearchCriteria cri) {
		
		List<ReplyVO> list = mediaDAO.replyList(cri);
		
		return list;
	}
	
	@Override
	public List<ReplyVO> replyTotalList(Integer news_idx) {

		List<ReplyVO> list = mediaDAO.replyTotalList(news_idx);
		
		return list;
	}
	
	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return mediaDAO.allPageCount(cri);
	}
	
	@Override
	public Integer newsAllPageCount(SearchCriteria cri) {

		return mediaDAO.newsAllPageCount(cri);
	}
	
	@Override
	public Integer replyAllPageCount(SearchCriteria cri) {

		return mediaDAO.replyAllPageCount(cri);
	}
	
	@Override
	public Integer TotalAllPageCount(SearchCriteria cri) {

		return mediaDAO.TotalAllPageCount(cri);
	}

	@Override
	public List<MediaVO> allPage(SearchCriteria cri) {

		List<MediaVO> list=  mediaDAO.allPage(cri);
		
		for (MediaVO mediaVO : list) {
			mediaVO.setKeyword_main(keywordDAO.read(mediaVO.getKeyword()).getKeyword_main());
		}
		
		return list;
	}
	
	@Override
	public List<ReplyVO> replyAllPage(SearchCriteria cri) {

		List<ReplyVO> list=  mediaDAO.replyAllPage(cri);
			
		return list;
	}

	@Override
	public Integer getTotalCount(SearchCriteria cri) {

		return mediaDAO.getTotalCount(cri);
	}

	@Override
	public Integer getMatchCount(SearchCriteria cri) {

		return mediaDAO.getMatchCount(cri);
	}

	@Override
	public TextTypeVO periodTextTypeCount(SearchCriteria cri) {

		return mediaDAO.periodTextTypeCount(cri);
	}

	@Override
	public TextTypeVO getMediaPortalCount(SearchCriteria cri) {

		return mediaDAO.getMediaPortalCount(cri);
	}

	@Override
	public TextTypeVO getMediaTextTypeTotalCount(SearchCriteria cri) {

		return mediaDAO.getMediaTextTypeTotalCount(cri);
	}

	@Override
	public TextTypeVO getMediaTextTypeSearchCount(SearchCriteria cri) {

		return mediaDAO.getMediaTextTypeSearchCount(cri);
	}

	@Override
	public TextTypeVO getPressPortalCount(SearchCriteria cri) {

		return mediaDAO.getPressPortalCount(cri);
	}

	@Override
	public TextTypeVO getPressTextTypeTotalCount(SearchCriteria cri) {

		return mediaDAO.getPressTextTypeTotalCount(cri);
	}

	@Override
	public TextTypeVO getPressTextTypeSearchCount(SearchCriteria cri) {

		return mediaDAO.getPressTextTypeSearchCount(cri);
	}

	@Override
	public List<MediaVO> wPageSearch(SearchCriteria cri) {

		return mediaDAO.wPageSearch(cri);
	}
	
	@Override
	public List<MediaVO> textTypelistSearch(SearchCriteria cri) {

		List<MediaVO> list = mediaDAO.textTypelistSearch(cri);
		return list;
	}

	@Override
	public List<MediaVO> textTypelistSearch2(SearchCriteria cri) {

		List<MediaVO> list = mediaDAO.textTypelistSearch2(cri);
		return list;
	}

	@Override
	public List<MediaVO> textTypelistSearch3(SearchCriteria cri) {

		List<MediaVO> list = mediaDAO.textTypelistSearch3(cri);
		return list;
	}

	@Override
	public List<MediaVO> textTypelistSearch4(SearchCriteria cri) {

		List<MediaVO> list = mediaDAO.textTypelistSearch4(cri);
		return list;
	}

	@Override
	public List<MediaVO> reporterGetTextTypeCount(SearchCriteria cri, String reporter, String textType) {
		
		List<MediaVO> list = mediaDAO.reporterGetTextTypeCount(cri, reporter, textType);
		return list;
	}

	@Override
	public List<MediaVO> mediaCnt(SearchCriteria cri) {
		
		return mediaDAO.mediaCnt(cri);
	}

	@Override
	public List<TextTypeDateVO> textTypeCount2(SearchCriteria cri) {

		return mediaDAO.textTypeCount2(cri);
	}

	@Override
	public Integer checkUrl(String url) {

		return mediaDAO.checkUrl(url);
	}

	@Override
	public Integer mTotalCnt(SearchCriteria cri) {

		return mediaDAO.mTotalCnt(cri);
	}

	@Override
	public List<MediaVO> headlineList(SearchCriteria cri) {

		return mediaDAO.headlineList(cri);
	}

	@Override
	public Integer mediaTotalcnt(SearchCriteria cri) {

		return mediaDAO.mediaTotalcnt(cri);
	}

	@Override
	public Integer replyTotalcnt(SearchCriteria cri) {

		return mediaDAO.replyTotalcnt(cri);
	}

	@Override
	public Integer mediaTextcnt(SearchCriteria cri) {

		return mediaDAO.replyTotalcnt(cri);
	}

	@Override
	public Integer mediaTextcnt2(SearchCriteria cri) {

		return mediaDAO.mediaTextcnt2(cri);
	}

	@Override
	public Integer mediaCountAll(SearchCriteria cri) {

		return mediaDAO.mediaCountAll(cri);
	}

	@Override
	public void headlineUpdate(Integer media_idx) {

		mediaDAO.headlineUpdate(media_idx);
		
	}

	@Override
	public void headlineUpdate2(Integer media_idx) {

		mediaDAO.headlineUpdate2(media_idx);
		
	}

	@Override
	public List<MailVO> mailList(SearchCriteria cri) {

		return mediaDAO.mailList(cri);
		
	}

	@Override
	public Integer mailCountAll(SearchCriteria cri) {

		return mediaDAO.mailCountAll(cri);
	}

	@Override
	public List<MediaVO> mediaMatchList(SearchCriteria cri) {

		return mediaDAO.mediaMatchList(cri);
	}

	@Override
	public Integer mediaMatchCount(SearchCriteria cri) {

		return mediaDAO.mediaMatchCount(cri);
	}

	@Override
	public List<MediaVO> mediaMatchList2(SearchCriteria cri) {

		return mediaDAO.mediaMatchList2(cri);
	}

	@Override
	public Integer mediaMatchCount2(SearchCriteria cri) {

		return mediaDAO.mediaMatchCount2(cri);
	}
	
	@Override
	public Integer mediaMatchCount3(SearchCriteria cri) {

		return mediaDAO.mediaMatchCount3(cri);
	}

	@Override
	public List<MediaVO> mediaTotalMatchList(SearchCriteria cri) {

		return mediaDAO.mediaTotalMatchList(cri);
	}

	@Override
	public List<MediaVO> reporterMatchList(SearchCriteria cri) {

		return mediaDAO.reporterMatchList(cri);
	}

	@Override
	public Integer reporterMatchCount(SearchCriteria cri) {

		return mediaDAO.reporterMatchCount(cri);
	}

	@Override
	public List<MediaVO> reporterMatchList2(SearchCriteria cri) {

		return mediaDAO.reporterMatchList2(cri);
	}

	@Override
	public Integer reporterMatchCount2(SearchCriteria cri) {

		return mediaDAO.reporterMatchCount2(cri);
	}

	@Override
	public Integer reporterMatchCount3(SearchCriteria cri) {

		return mediaDAO.reporterMatchCount3(cri);
	}

	@Override
	public List<MediaVO> reporterTotalMatchList(SearchCriteria cri) {

		return mediaDAO.reporterTotalMatchList(cri);
	}

	@Override
	public List<MediaVO> mediaMatchallList(SearchCriteria cri) {

		return mediaDAO.mediaMatchallList(cri);
	}

	@Override
	public List<MediaVO> reporterMatchallList(SearchCriteria cri) {

		return mediaDAO.reporterMatchallList(cri);
	}

	@Override
	public List<MediaVO> mediaDataList(SearchCriteria cri) {

		return mediaDAO.mediaDataList(cri);
	}

	@Override
	public List<MediaVO> mediaMatchDataList(SearchCriteria cri) {

		return mediaDAO.mediaMatchDataList(cri);
	}

	@Override
	public List<MediaVO> reporterDataList(SearchCriteria cri) {

		return mediaDAO.reporterDataList(cri);
	}

	@Override
	public List<MediaVO> reporterMatchDataList(SearchCriteria cri) {

		return mediaDAO.reporterMatchDataList(cri);
	}

	@Override
	public Integer mediaMatchCount4(SearchCriteria cri) {

		return mediaDAO.mediaMatchCount4(cri);
	}

	@Override
	public Integer reporterMatchCount4(SearchCriteria cri) {

		return mediaDAO.reporterMatchCount4(cri);
	}

	@Override
	public void checkDelete(Integer media_idx) {

		mediaDAO.checkDelete(media_idx);
		
	}

	@Override
	public List<MediaVO> totalAllPageex(SearchCriteria cri) {

		return mediaDAO.totalAllPageex(cri);
	}

	@Override
	public List<MediaVO> mailMatch(SearchCriteria cri) {

		return mediaDAO.mailMatch(cri);
	}

	@Override
	public List<MediaVO> mediaListData(SearchCriteria cri) {

		return mediaDAO.mediaListData(cri);
	}

	@Override
	public Integer graphmTotalCnt(SearchCriteria cri) {

		return mediaDAO.graphmTotalCnt(cri);
	}

	@Override
	public List<MediaVO> dashListAll(SearchCriteria cri) {

		return mediaDAO.dashListAll(cri);
	}

	@Override
	public List<MediaVO> newsExcel(SearchCriteria cri) {

		return mediaDAO.newsExcel(cri);
	}
}
