package org.union.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.MediaVO;
import org.union.domain.PeriodComparator;
import org.union.domain.PeriodMediaVO;
import org.union.domain.ReporterVO;
import org.union.domain.SearchCriteria;
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
	public List<MediaVO> listSearch(SearchCriteria vo) {

		return mediaDAO.listSearch(vo);
	}
	
	
	@Override
	public List<PeriodMediaVO> periodMedia(SearchCriteria criteria) {

		List<PeriodMediaVO> periodList = new ArrayList<PeriodMediaVO>();

		List<ReporterVO> reporterList = reporterDAO.listAll();

		for (int i = 0; i < reporterList.size(); i++) {
			PeriodMediaVO vo = new PeriodMediaVO();

			criteria.setKeyword(reporterList.get(i).getReporter_media_name());
			vo.setAllCount(mediaDAO.mediaGetTotalCount(criteria));
			vo.setMedia(reporterList.get(i).getReporter_media_name());
			vo.setReporter(reporterList.get(i).getReporter_name());
			
			periodList.add(vo);
		}
		
		for(int i = 0; i < periodList.size(); i++) {
			for(int j = 0; j < periodList.size(); j++) {
				if(i == j) {
					
				}else if(periodList.get(i).getMedia().equals(periodList.get(j).getMedia())) {
					int calcCount = periodList.get(i).getAllCount() + periodList.get(j).getAllCount();
					periodList.get(i).setAllCount(calcCount);
					periodList.remove(j);
				}
			}
		}
		
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

			criteria.setKeyword(reporterList.get(i).getReporter_media_name());
			vo.setAllCount(mediaDAO.mediaGetTotalCount(criteria));
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


}
