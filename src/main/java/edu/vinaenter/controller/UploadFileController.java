package edu.vinaenter.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadFileController {

	@Autowired
	private ServletContext servletContext;

	@GetMapping("upload")
	public String upload() {
		return "upload";
	}

	@PostMapping("upload")
	public String upload(@RequestParam("picture") MultipartFile file, Model model) {
		String fileName = "";
		if (!file.isEmpty()) {
			String dirUpload = servletContext.getRealPath("WEB-INF/resources/uploads");
			File fileUpload = new File(dirUpload);
			if (!fileUpload.exists()) {
				fileUpload.mkdirs();
			}
			fileName = file.getOriginalFilename();
//			Rename file
			fileName = FilenameUtils.getBaseName(fileName) + "_" + System.nanoTime() + "."
					+ FilenameUtils.getExtension(fileName);
			String filePath = dirUpload + File.separator + fileName;
			try {
				file.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("fileName", fileName);
		return "upload";
	}

}
