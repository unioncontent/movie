package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.union.domain.KeywordListVO;
import org.union.service.KeywordService;
import org.union.service.UserService;

@Controller
@RequestMapping("/keyword/*")
public class KeywordController {

	
	@Autowired
	private KeywordService keywordService;
	
	@Autowired
	private UserService userService;
	
	private static Logger logger = LoggerFactory.getLogger(KeywordController.class);
	
	@GetMapping("/keyword")
	public void keywordGET(Model model) {
		logger.info("keywordGET called....");
		
		model.addAttribute("mainList", keywordService.listPage());
	}
	
	
	@GetMapping("/create")
	public void createGET(Model model) {
		logger.info("createGET called....");
		
		model.addAttribute("companyList", userService.listAll());
	}
	
	@ResponseBody
	@PostMapping("/checkMain")
	public Integer checkMainPOST(String keyword_main) {
		logger.info("checkMainPOST called....");
		
		logger.info("keywordMain: " + keyword_main);
		
		return keywordService.checkMain(keyword_main);
	}

	
	@ResponseBody
	@PostMapping("/insertMain")
	public String insertMainPOST(KeywordListVO vo) {
		logger.info("insertMainPOST called....");
		
		logger.info("vo: " + vo);
		
		keywordService.insertMain(vo);
		
		return "keyword";
	}
	
	@GetMapping("/modify")
	public void modifyGET() {
		logger.info("keywordGET called....");
	}
	
	@ResponseBody
	@PostMapping("/removeMain")
	public String removeMain(String keyword_main) {
		logger.info("removeMain called....");
		
		keywordService.removeMain(keyword_main);
		
		return "success";
	}
	
}
