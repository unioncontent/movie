package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/classification/*")
public class ClassificationController {

	private static Logger logger = LoggerFactory.getLogger(ClassificationController.class);
	

	@GetMapping("/classification")
	public void classificationGET() {
		logger.info("classificationGET called....");
	}
	
	
}
