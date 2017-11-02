package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/extract/*")
public class ExtractController {

	
	private static Logger logger = LoggerFactory.getLogger(ExtractController.class);
	
	
	@GetMapping("/extract")
	public void extractGET() {
		logger.info("extractGET called....");
	}
}
