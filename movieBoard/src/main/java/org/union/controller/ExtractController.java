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
import org.union.domain.ExtractVO;
import org.union.domain.PageMaker;
import org.union.domain.SearchCriteria;
import org.union.service.CommunityService;
import org.union.service.MediaService;
import org.union.service.PortalService;
import org.union.service.SNSService;
import org.union.util.ExtractComparator;
import org.union.util.ListUtil;

@Controller
@RequestMapping("/extract/*")
public class ExtractController {

	
	private static Logger logger = LoggerFactory.getLogger(ExtractController.class);
	
	
	
	@Autowired
	private SNSService snsService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private PortalService portalService;
	
	@Autowired
	private MediaService mediaService;
	
	
	
	@GetMapping("/extract")
	public void extractGET(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		logger.info("extractGET called....");
		logger.info("cri: " + cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(snsService.getExtractCount(cri) 
								+ communityService.getExtractCount(cri)
								+ portalService.getExtractCount(cri)
								+ mediaService.getExtractCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		List<ExtractVO> extractList = new ArrayList<ExtractVO>();
		ListUtil listUtil = new ListUtil();
		
		listUtil.listAddList(extractList, snsService.listExtract(cri));
		listUtil.listAddList(extractList, communityService.listExtract(cri));
		listUtil.listAddList(extractList, portalService.listExtract(cri));
		listUtil.listAddList(extractList, mediaService.listExtract(cri));

		/*ExtractComparator comparator = new ExtractComparator();
		Collections.sort(extractList, comparator);
		logger.info(extractList.toString());*/
		model.addAttribute("extractList", extractList);
	}
}
