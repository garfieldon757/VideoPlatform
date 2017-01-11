package com.videoPlatform.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.videoPlatform.dao.UserDAO;
import com.videoPlatform.listener.MyProgressListener;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.util.Progress;

@Component
@Controller
public class uploadController {

	@Autowired(required=true)
	UserDAO userDAO;
	
	@RequestMapping(value = "uploadVideoFile", method = RequestMethod.POST)
	@ResponseBody 
	public String uploadVideoFile(@RequestParam("uploadVideoFile") MultipartFile uploadVideoFile, HttpServletRequest request) throws IOException,FileUploadException{
			
		 	String basePath = "E:/workspace2/VideoPlatform/WebContent/" ;
		 	String relativePath = "uploadVideo/";
	        String fileName = uploadVideoFile.getOriginalFilename();
      
	        File targetFile = new File( basePath + relativePath  , fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	  
	        //保存  
	        try {  
	        	uploadVideoFile.transferTo(targetFile);  
	            
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  


		return "sss";
		
	}
	
	@RequestMapping("uploadAvatar")
	public ModelAndView uploadAvatar(@RequestParam(value = "imgFile", required = false) MultipartFile file, HttpServletRequest request) throws FileNotFoundException, IOException, InterruptedException{
			ModelAndView mv = new ModelAndView("personalProfile");
		 	String basePath = "E:/workspace2/VideoPlatform/WebContent/" ;
		 	String relativePath = "avatarImg/";
		 	HttpSession session = request.getSession();
	        TblUser tblUser = (TblUser) session.getAttribute("user"); 
	        String personalPath = tblUser.getUserNickName() + "/" ;
	        String fileName = file.getOriginalFilename();
	        //在这里建立一个个人的文件夹，要做文件存在性判断和操作
	        //...
	        String absolutePath = basePath + relativePath + personalPath;
      
//	        // 获取上传文件扩展名
//	        String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());  
//	        // 对扩展名进行小写转换  
//	        fileExt = fileExt.toLowerCase();
//	        // 图片文件大小过滤  
//	        if (!"jpg".equals(fileExt) && !"jpeg".equals(fileExt) && !"png".equals(fileExt) && !"bmp".equals(fileExt)  
//	                && !"gif".equals(fileExt)) {  
//	        	
//	            //return new Result(900001, "", "上传失败:无效图片文件类型");  
//	        }
//	        long fileSize = file.getSize();  
//	        if (fileSize <= 0) {   
//	            //return new Result(900001, "", "上传失败:文件为空");  
//	        } else if (fileSize > (100 * 1024)) {  
//	            //return new Result(900001, "", "上传失败:文件大小不能超过100K");  
//	        }  
	        
	        
	        
	        File targetFile = new File( absolutePath , fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	  
	        //保存  
	        try {  
	            file.transferTo(targetFile);  
	            
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        
	        tblUser.setUserAvatarImgLink( relativePath + personalPath + fileName );
	        tblUser = userDAO.updateTblUser(tblUser);
	        session.setAttribute("user", tblUser);
//	        BufferedImage sourceImg = ImageIO.read(new FileInputStream(targetFile));  
//            int imgWidth = sourceImg.getWidth();  
//            int imgHeight = sourceImg.getHeight();  
//            System.out.println("上传的图片宽：" + imgWidth);  
//            System.out.println("上传的图片高：" + imgHeight); 
	        
        //mv.addObject("fileUrl", relativePath +fileName);

        mv.addObject("user", tblUser);
        mv.addObject("defualt_tab", "baseAvatar");
		return mv;
		
	}
	
	@RequestMapping(value = "progress.json")
    public String initCreateInfo(HttpServletRequest request, ModelMap map) throws JsonProcessingException {
		System.out.println("progress.json!!!!!!!!!!!!!  start");
		// 设置监听器
		MyProgressListener progressListener = new MyProgressListener(request);
		progressListener.update(20, 100 , 1 );
		 Progress status = (Progress) request.getSession().getAttribute("picStatus");
		 if (status == null) {
		     //return "null %";
		 }
		 //System.out.println("progress.json!!!!!!!!!!!!!      " + status.getPercent());
		// map.put("percent", status.getPercent());
		 ObjectMapper mapper = new ObjectMapper(); 
	    String s = mapper.writeValueAsString(status); 
		 return s;//"/progress.json";
    }
	
	
}
