package com.videoPlatform.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.service.RelationManager;
import com.videoPlatform.service.VideoManager;
import com.videoPlatform.util.CustomVideoInfo;

@Component
@Controller
public class RelationController {

	@Autowired(required=true)
	VideoManager vm;
	
	@Autowired(required=true)
	RelationManager rm;
	
	@Autowired(required=true)
	private HttpServletRequest httpServletRequest;
	
	@RequestMapping("ajax_search_personalVideoManagement_videos")
	@ResponseBody
	public String ajax_search_personalVideoManagement_videos(String videoName, String uploadDateStart, String uploadDateEnd ) throws JsonProcessingException, ParseException{
		
		HttpSession session = httpServletRequest.getSession();
		TblUser user = (TblUser) session.getAttribute("user");
		String operation_type = "upload";
		List<CustomVideoInfo> customVideoInfoList = rm.getCustomVideoInfoList(user, operation_type, videoName, uploadDateStart, uploadDateEnd);
		
		ObjectMapper mapper = new ObjectMapper(); 
	    String jsonString = mapper.writeValueAsString(customVideoInfoList);
	    return jsonString;
	}
	
	@RequestMapping("ajax_search_personalVideoManagement_favorite")
	@ResponseBody
	public String ajax_search_personalVideoManagement_favorite(String videoName, String uploadDateStart, String uploadDateEnd ) throws JsonProcessingException, ParseException{
		
		HttpSession session = httpServletRequest.getSession();
		TblUser user = (TblUser) session.getAttribute("user");
		String operation_type = "favorite";
		List<CustomVideoInfo> customVideoInfoList = rm.getCustomVideoInfoList(user, operation_type, videoName, uploadDateStart, uploadDateEnd);
		
		ObjectMapper mapper = new ObjectMapper(); 
	    String jsonString = mapper.writeValueAsString(customVideoInfoList);
	    return jsonString;
	}
	
}
