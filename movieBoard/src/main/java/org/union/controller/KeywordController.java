package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/keyword/*")
public class KeywordController {

	
	private static Logger logger = LoggerFactory.getLogger(KeywordController.class);
	
	@GetMapping("/keyword")
	public void keywordGET() {
		logger.info("keywordGET called....");
	}
}
