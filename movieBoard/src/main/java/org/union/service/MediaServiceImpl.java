package org.union.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.ExtractVO;
import org.union.domain.GraphVO;
import org.union.domain.MediaVO;
import org.union.domain.PeriodMediaVO;
import org.union.domain.ReporterVO;
import org.union.domain.SearchCriteria;
import org.union.domain.TextTypeVO;
import org.union.persistence.MediaDAO;
import org.union.persistence.ReporterDAO;

@Service
public class MediaServiceImpl implements MediaService {

	
	@Autowired
	MediaDAO mediaDAO;
	
	@Autowired
	ReporterDAO reporterDAO;
	
	
	@Override
	public void regist(MediaVO vo) {

		mediaDAO.create(vo);
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
	public List<ExtractVO> listExtract(SearchCriteria cri) {

		try {
			List<MediaVO> mediaList = mediaDAO.listExtract(cri);
			
			List<ExtractVO> extractList = new ArrayList<ExtractVO>();
			
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			
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

		return mediaDAO.listSearch(vo);
	}
	
	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return mediaDAO.getSearchCount(cri);
	}

	
	
	@Override
	public List<PeriodMediaVO> periodMedia(SearchCriteria criteria) {

		List<PeriodMediaVO> periodList = new ArrayList<PeriodMediaVO>();

		List<ReporterVO> reporterList = reporterDAO.listChecked();

		
		for (int i = 0; i < reporterList.size(); i++) {
			PeriodMediaVO vo = new PeriodMediaVO();

			criteria.setKeyword(reporterList.get(i).getReporter_media_name());
			vo.setAllCount(mediaDAO.mediaGetTotalCount(criteria));
			vo.setSearchCount(mediaDAO.mediaGetSearchCount(criteria));
			if(vo.getAllCount() != 0) {
				vo.setMatchPercent((vo.getSearchCount()/vo.getAllCount())*100);
			
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
			vo.setSearchCount(mediaDAO.reporterGetSearchCount(criteria));
			if(vo.getAllCount() != 0) {
				vo.setMatchPercent((vo.getSearchCount()/vo.getAllCount())*100);
			
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
	public Integer getTotalCount() {

		return mediaDAO.getTotalCount();
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
	public void modifyThumbnail(MediaVO vo) {

		mediaDAO.updateThumbnail(vo);
	}

	@Override
	public List<MediaVO> listAll(SearchCriteria cri) {

		return mediaDAO.listAll(cri);
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
	public GraphVO yesterdayCount() {

		return mediaDAO.yesterdayCount();
	}

	@Override
	public List<MediaVO> allPageList(SearchCriteria cri) {

		return mediaDAO.allPageList(cri);
	}

	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return mediaDAO.allPageCount(cri);
	}

	@Override
	public List<MediaVO> allPage(SearchCriteria cri) {

		return mediaDAO.allPage(cri);
	}

}
