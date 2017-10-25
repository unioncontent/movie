package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sns/*")
public class SNSController {

	
	private static Logger logger = LoggerFactory.getLogger(SNSController.class);
	
	@GetMapping("/facebook")
	public String facebook() {
		logger.info("GET facebook....");
		
		return "sns/faceBook";
	}
	
}
