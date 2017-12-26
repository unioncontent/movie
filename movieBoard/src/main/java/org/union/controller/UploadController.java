package org.union.controller;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.union.domain.PortalVO;
import org.union.service.CommunityService;
import org.union.service.MediaService;
import org.union.service.PortalService;
import org.union.util.UploadFileUtils;

@Controller
@RequestMapping
public class UploadController {
	
	@Autowired
	private PortalService portalService;
	
	@Autowired
	private MediaService mediaService;
	
	@Autowired
	private CommunityService communityService;

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	/*@PostMapping("/uploadFile")
	@ResponseBody
	public void uploadFile(MultipartFile file, Model model) throws Exception {

		logger.info("uploadFile called....");
		UUID uid = UUID.randomUUID();
		
		String fileName = file.getOriginalFilename();
		String uploadName = uid + "_" + fileName;

		FileOutputStream fos = new FileOutputStream("C:\\img\\" + uploadName);
		
		IOUtils.copy(file.getInputStream(), fos);
		model.addAttribute("uploadName", uploadName);
		fos.close();
		
		logger.info("uploadName :"+uploadName);

	}*/

	@GetMapping(value = "classification/show", produces = {"image/jpg", "image/jpeg" })
	public @ResponseBody byte[] show(String name) throws Exception {

		InputStream in = new FileInputStream("C:\\img\\" + name);
		// OutputStream out = new ByteArrayOutputStream();

		return IOUtils.toByteArray(in);

	}

	@Resource(name = "uploadPath")
	private String uploadPath;


	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file, String domain, String idx) throws Exception {
		logger.info("domain: " + domain);
		logger.info("idx: " + idx);
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		logger.info(uploadPath);
		
//		return new ResponseEntity<String>(file.getOriginalFilename(),HttpStatus.CREATED);

		/*logger.info(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);*/
		
		ResponseEntity<String> insertFileName;
		
		if(domain.equals("portal")) {
			logger.info("domain is portal");
			PortalVO vo = new PortalVO();
			
			insertFileName = new ResponseEntity<String>(
					UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
					HttpStatus.CREATED);
			
			
			vo.setPortal_idx(Integer.parseInt(idx));
			vo.setThumbnail(insertFileName.getBody());
			
			logger.info("vo: " + vo);
			
			portalService.modifyThumbnail(vo);
			
			return insertFileName;
			
		}else if(domain.equals("media")) {
			
			return null;
			
		}else if(domain.equals("community")) {
			
			return null;
			
		}else {
			return null;
		}
		
		
	}
	
}
