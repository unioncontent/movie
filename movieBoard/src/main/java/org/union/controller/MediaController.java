package org.union.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/media/*")
public class MediaController {

	
	private static Logger logger = LoggerFactory.getLogger(MediaController.class);
	
	
	@GetMapping("/news")
	public void newsGET() {
		logger.info("newsGET called....");
	}
	
	@GetMapping("/press")
	public void pressGET() {
		logger.info("pressGET called....");
	}
}
