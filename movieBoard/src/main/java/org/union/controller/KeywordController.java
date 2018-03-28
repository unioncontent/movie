package org.union.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.union.domain.KeywordListVO;
import org.union.domain.KeywordVO;
import org.union.domain.SwearwordVO;
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
	
	@GetMapping("/swearword")
	public void swearwordGET(Model model) {
		logger.info("swearwordGET called....");
		
		model.addAttribute("swearwordList", keywordService.swearwordList());
	}
	
	
	@GetMapping("/create")
	public void createGET(Model model) {
		logger.info("createGET called....");
		
		model.addAttribute("companyList", userService.listAll());
	}
	
	@GetMapping("/swearwordCreate")
	public void swearwordCreate() {
		
	}
	
	@GetMapping("/swearwordCreateOk")
	public String swearwordCreateGET(SwearwordVO vo) {
		logger.info("createGET called....");
		
		keywordService.swearwordCreate(vo);
		
		return "redirect:/keyword/swearword";
	}
	
	
	@ResponseBody
	@PostMapping("/checkMain")
	public Integer checkMainPOST(String keyword_main) {
		logger.info("checkMainPOST called....");
		
		logger.info("keywordMain: " + keyword_main);
		
		return keywordService.checkMain(keyword_main);
	}
	
	@ResponseBody
	@PostMapping("/checkSwearword")
	public Integer checkSwearwordPOST(String swearword) {
		logger.info("checkSwearwordPOST called....");
		
		logger.info("swearword: " + swearword);
		
		return keywordService.checkSwearword(swearword);
	}

	
	@ResponseBody
	@PostMapping("/insertMain")
	public String insertMainPOST(KeywordListVO vo) {
		logger.info("insertMainPOST called....");
		
		logger.info("vo: " + vo);
		
		keywordService.insertMain(vo);
		
		return "keyword";
	}
	
	
	@ResponseBody
	@PostMapping("/removeMain")
	public String removeMain(String keyword_main) {
		logger.info("removeMain called....");
		
		keywordService.removeMain(keyword_main);
		
		return "success";
	}
	
	@GetMapping("/modify")
	public void modifyGET(@ModelAttribute("keyword_main") String keyword_main, Model model) {
		logger.info("keywordGET called....");
		
		logger.info("keyword_main: " + keyword_main);
		
		List<KeywordVO> list = keywordService.listByMain(keyword_main);
		
		logger.info(list.toString());
		
		model.addAttribute("keyword_main", keyword_main);
		model.addAttribute("company_name", userService.view(list.get(0).getUser_idx()).getCompany_name());
		
		for(int i = 0 ; i < list.size(); i ++) {
			if(list.get(i).getKeyword() == null) {
				list.remove(i);
			}
		}
		
		model.addAttribute("keywordList", list);
		
	}
	
	@ResponseBody
	@PostMapping("/insertKeyword")
	public void insertKeywordPOST(KeywordVO vo) {
		logger.info("insertKeywordPOST called....");
		
		logger.info("keywordVO: " + vo);
		
		keywordService.insertKeyword(vo);
	}
	
	
	@ResponseBody
	@PostMapping("/removeKeyword")
	public void removeKeywordPOST(String keyword) {
		logger.info("removeKeywordPOST called....");
		
		logger.info("keyword: " + keyword);
		
		keywordService.remove(keyword);
		
	}
	
	@ResponseBody
	@PostMapping("swearwordRemove")
	public String swearwordRemovePOST(String swearword) {
		logger.info("swearwordRemovePOST called....");
		logger.info("swearword: " + swearword);
		
		keywordService.swearwordDelete(swearword);
		
		return "success";
	}
}
