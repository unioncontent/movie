package org.union.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.union.domain.PageMaker;
import org.union.domain.SNSVO;
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
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.facebookTotalCount(cri));
		logger.info("totalCount: " + service.facebookTotalCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		logger.info("pageMaker: " + pageMaker);
		
		List<SNSVO> list = new ArrayList<SNSVO>();
		list = service.facebookList(cri);
		
		model.addAttribute("facebookList", list);
		logger.info("list: " + list);
		
		
		
	}
	
}
