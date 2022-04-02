package com.one.springpj.constant;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

public class FileMaker {
	
	public static String save(MultipartFile file, String path) {
		String originFile = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String saveFileName = uuid.toString()+"_"+originFile;
		String today = new SimpleDateFormat("yyMMdd").format(new Date());
		
		String saveFolder = path+File.separator+today;
		
		File folder = new File(saveFolder);

		if (!folder.exists()) {
			folder.mkdirs();
		}
		
		try {
			File saveFile = new File(saveFolder, saveFileName);
			
			String contentType = Files.probeContentType(saveFile.toPath());
			if(contentType.startsWith("image")) {
				FileOutputStream thumbnail= new FileOutputStream(new File(saveFolder, "s_"+ saveFileName));
				Thumbnailator.createThumbnail(file.getInputStream(),
						thumbnail,100,100);
				thumbnail.close();
			}
			file.transferTo(saveFile);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return saveFolder+File.separator+saveFileName;
	}
}
