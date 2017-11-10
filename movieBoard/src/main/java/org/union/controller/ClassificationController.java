package org.union.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.union.domain.ExtractVO;
import org.union.domain.PageMaker;
import org.union.domain.SearchCriteria;
import org.union.service.CommunityService;
import org.union.service.MediaService;
import org.union.service.PortalService;
import org.union.service.SNSService;
import org.union.util.ExcelView;
import org.union.util.ExtractComparator;
import org.union.util.ListUtil;

@Controller
@RequestMapping("/classification/*")
public class ClassificationController {

	
	@Autowired
	private SNSService snsService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private PortalService portalService;
	
	@Autowired
	private MediaService mediaService;
	
	
	
	private static Logger logger = LoggerFactory.getLogger(ClassificationController.class);
	
	
	//List<ExtractVO> excelList;
	
	@GetMapping("/classification")
	public void classificationGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		logger.info("classificationGET called....");
		
		
		if(cri.getSelectKey() != null) {
			if(cri.getSelectKey().equals("키워드")) {
				cri.setSelectKey(null);
			}
		}
		
		logger.info("cri: " + cri);
		
		PageMaker pageMaker = new PageMaker();
		// 4번 리스트기 때문에  perPageNum / 4
		if(cri.getPerPageNum() != 10) {
			cri.setPerPageNum(cri.getPerPageNum()/4);
		}
		
		logger.info("community: " + communityService.getSearchCount(cri));
		logger.info("sns: " + snsService.getSearchCount(cri));
		logger.info("portalService: " + portalService.getSearchCount(cri));
		logger.info("media: " + mediaService.getSearchCount(cri));
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(communityService.getSearchCount(cri)
								+ snsService.getSearchCount(cri)
								+ portalService.getSearchCount(cri)
								+ mediaService.getSearchCount(cri));
		
		logger.info("pageMaker: " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
		List<ExtractVO> classiList = new ArrayList<ExtractVO>();
		ListUtil listUtil = new ListUtil();
		
		listUtil.listAddSNSList(classiList, snsService.listSearch(cri));
		listUtil.listAddCommunityList(classiList, communityService.listSearch(cri));
		listUtil.listAddPortalList(classiList, portalService.listSearch(cri));
		listUtil.listAddMediaList(classiList, mediaService.listSearch(cri));

		ExtractComparator comparator = new ExtractComparator();
		Collections.sort(classiList, comparator);
		
		model.addAttribute("classiList", classiList);

		//excelList = classiList;
	}
	
	
	SearchCriteria localCri;
	
	@ResponseBody
	@GetMapping("/excel")
	public ModelAndView excelGET(ModelAndView model, ExcelView excelView, SearchCriteria cri) {
		
		logger.info("cri: " + cri);

		List<ExtractVO> classiList = new ArrayList<ExtractVO>();
		ListUtil listUtil = new ListUtil();

		if(cri.getKeyword() == "") {
			logger.info("keyword is null");
			cri.setKeyword(null);
			
		} 
		if(cri.getSelectKey() == "" || "키워드".equals(cri.getSelectKey()) ) {
			logger.info("selectKey is null");
			cri.setSelectKey(null);
		}
		logger.info("cri: " + cri);
		
		localCri = cri;
		
		listUtil.listAddSNSList(classiList, snsService.listAll(cri));
		listUtil.listAddCommunityList(classiList, communityService.listAll(cri));
		listUtil.listAddPortalList(classiList, portalService.listAll(cri));
		listUtil.listAddMediaList(classiList, mediaService.listAll(cri));
		
		ExtractComparator comparator = new ExtractComparator();
		Collections.sort(classiList, comparator);
		
		
		
		model.addObject("list", classiList);
		model.setView(excelView);
		
		return model;
	}
	
	
	/*@GetMapping("/excel")
	public ModelAndView excelGET(ModelAndView model, ExcelView excelView, String url) {
		
		logger.info("excelList: " + excelList);
		logger.info(success);
		model.addObject("list", excelList);
		model.setView(excelView);

		return model;
	}*/
}
