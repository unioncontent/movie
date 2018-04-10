package org.union.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.union.domain.ExtractVO;
import org.union.domain.FvVO;
import org.union.domain.GraphVO;
import org.union.domain.SNSVO;
import org.union.domain.SearchCriteria;
import org.union.persistence.KeywordDAO;
import org.union.persistence.SNSDAO;

@Service
public class SNSServiceImpl implements SNSService {

	@Autowired
	private SNSDAO snsDAO;
	
	@Autowired
	private KeywordDAO keywordDAO;
	
	@Override
	public void regist(SNSVO vo) {

		snsDAO.create(vo);
	}
	

	@Override
	public SNSVO view(Integer SNS_idx) {

		return snsDAO.read(SNS_idx);
	}
	

	@Override
	public void modify(SNSVO vo) {

		snsDAO.update(vo);
	}
	

	@Override
	public void remove(Integer SNS_idx) {

		snsDAO.delete(SNS_idx);
	}

	@Override
	public List<ExtractVO> listExtract(SearchCriteria cri) {

		try {
			List<SNSVO> snsList = snsDAO.listExtract(cri);
			
			List<ExtractVO> extractList = new ArrayList<ExtractVO>();
			
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
			
			for(int i = 0; i < snsList.size(); i++) {
				ExtractVO vo = new ExtractVO();
				
				SNSVO data = snsList.get(i);
				
				vo.setSns_idx(data.getSns_idx());
				vo.setDomain("sns");
				vo.setDomainType(data.getSns_name());
				vo.setTitle(data.getSns_title());
				vo.setContent(data.getSns_content());
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
	public Integer getExtractCount (SearchCriteria cri) {

		return snsDAO.getExtractCount(cri);
	}
	
	
	@Override
	public List<SNSVO> listSearch(SearchCriteria cri) {

		return snsDAO.listSearch(cri);
	}


	@Override
	public Integer getSearchCount(SearchCriteria cri) {

		return snsDAO.getSearchCount(cri);
	}
	
	
	
	@Override
	public List<SNSVO> facebookList(SearchCriteria cri) {

		return snsDAO.facebookList(cri);
	}
	
	
	@Override
	public Integer facebookTotalCount(SearchCriteria  cri) {

		return snsDAO.facebookTotalCount(cri);
	}
	
	
	@Override
	public List<SNSVO> instaList(SearchCriteria cri) {

		return snsDAO.instaList(cri);
	}


	@Override
	public Integer instaTotalCount(SearchCriteria cri) {

		return snsDAO.instaTotalCount(cri);
	}


	@Override
	public List<SNSVO> twitterList(SearchCriteria cri) {

		return snsDAO.twitterList(cri);
	}


	@Override
	public Integer twitterTotalCount(SearchCriteria cri) {

		return snsDAO.twitterTotalCount(cri);
	}
	

	@Override
	public void modifyTextType(SNSVO vo) {

		snsDAO.updateTextType(vo);
	}
	

	@Override
	public void modifyThumbnail(SNSVO vo) {

		snsDAO.updateThumbnail(vo);
	}


	@Override
	public List<SNSVO> getDateCount(SearchCriteria cri) {

		return snsDAO.getDateCount(cri);
	}


	@Override
	public List<SNSVO> listAll(SearchCriteria cri) {

		List<SNSVO> list = snsDAO.listAll(cri);

		for (SNSVO snsvo : list) {
			snsvo.setKeyword_main(keywordDAO.read(snsvo.getKeyword()).getKeyword_main());
		}
		
		return list;
	}


	@Override
	public List<SNSVO> listExcel(SearchCriteria cri) {

		return snsDAO.listExcel(cri);
	}


	@Override
	public Integer listExcelCount(SearchCriteria cri) {

		return snsDAO.listExcelCount(cri);
	}


	@Override
	public GraphVO facebookSum(SearchCriteria cri) {

		return snsDAO.facebookSum(cri);
	}


	@Override
	public GraphVO twitterSum(SearchCriteria cri) {

		return snsDAO.twitterSum(cri);
	}


	@Override
	public GraphVO instagramSum(SearchCriteria cri) {

		return snsDAO.instagramSum(cri);
	}


	@Override
	public GraphVO yesterdayCount(String name) {

		return snsDAO.yesterdayCount(name);
	}

	@Override
	public GraphVO showboxYesterdayCount(String name) {

		return snsDAO.showboxYesterdayCount(name);
	}

	@Override
	public Integer countAll(Date date) {

		return snsDAO.countAll(date);
	}

	@Override
	public Integer showboxCountAll(Date date) {

		return snsDAO.showboxCountAll(date);
	}

	@Override
	public List<SNSVO> allPageList(SearchCriteria cri) {

		return snsDAO.allPageList(cri);
	}


	@Override
	public Integer allPageCount(SearchCriteria cri) {

		return snsDAO.allPageCount(cri);
	}


	@Override
	public List<SNSVO> facebookCnt(SearchCriteria cri) {

		return snsDAO.facebookCnt(cri);
	}


	@Override
	public List<SNSVO> instaCnt(SearchCriteria cri) {

		return snsDAO.instaCnt(cri);
	}


	@Override
	public List<SNSVO> twiCnt(SearchCriteria cri) {

		return snsDAO.twiCnt(cri);
	}


	@Override
	public List<SNSVO> snsTotalCnt(SearchCriteria cri) {

		return snsDAO.snsTotalCnt(cri);
	}


	@Override
	public List<FvVO> facebookCGV(SearchCriteria cri) {

		return snsDAO.facebookCGV(cri);
	}

}
