package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.union.domain.PageMaker;
import org.union.domain.SearchCriteria;
import org.union.service.SNSService;

@Controller
@RequestMapping("/sns/*")
public class SNSController {

	
	@Autowired
	private SNSService service;
	
	private static Logger logger = LoggerFactory.getLogger(SNSController.class);
	
	/*@GetMapping("/facebook")
	public String facebook() {
		logger.info("GET facebook....");
		
		return "sns/facebook";
	}*/
	
	
	@GetMapping("/facebook")
	public void list(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info("GET list call....");
		
		
		logger.info("cri : " + cri);
		
		PageMaker pageMaker = new PageMaker();
		
		logger.info("SearchType: "+cri.getSearchType());
		logger.info("keyWord: "+cri.getKeyword());
		
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(service.getTotalCount(cri));
		
	
		model.addAttribute("facebookList", service.listSearch(cri));
		model.addAttribute("pageMaker", pageMaker);
	
		logger.info("complete....");
		logger.info(service.listSearch(cri).toString());
		logger.info(pageMaker.toString());
		
		
	}
	
}
