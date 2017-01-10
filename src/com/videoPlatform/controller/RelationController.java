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
import com.videoPlatform.dao.RelationDAO;
import com.videoPlatform.dao.UserDAO;
import com.videoPlatform.dao.VideoDAO;
import com.videoPlatform.model.TblComment;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblVideo;
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
	UserDAO userDAO;
	
	@Autowired(required=true)
	VideoDAO videoDAO;
	
	@Autowired(required=true)
	RelationDAO relationDAO;
	
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
	
	@RequestMapping("ajax_add_videoPlayer_commentPublish")
	@ResponseBody
	public String ajax_add_videoPlayer_commentPublish(String comment_videoId, String comment_userId, String comment_content ) throws JsonProcessingException, ParseException{
		
		TblUser user = userDAO.getUserByUserId(comment_userId);
		TblVideo video = videoDAO.getVideoByVideoID(comment_videoId);
		
		TblComment comment = relationDAO.addComment(user, video, null, comment_content);
		
		ObjectMapper mapper = new ObjectMapper(); 
	    String jsonString = mapper.writeValueAsString(comment);
	    return jsonString;
	}
	
	@RequestMapping("ajax_add_videoPlayer_replyPublish")
	@ResponseBody
	public String ajax_add_videoPlayer_replyPublish(String comment_videoId, String comment_userId, String replyTo_commentId, String comment_content ) throws JsonProcessingException, ParseException{
		
		TblUser user = userDAO.getUserByUserId(comment_userId);
		TblVideo video = videoDAO.getVideoByVideoID(comment_videoId);
		TblComment replyTo_comment = relationDAO.getCommentByCommentId(replyTo_commentId);
		
		TblComment comment = relationDAO.addComment(user, video, replyTo_comment, comment_content);
		
		ObjectMapper mapper = new ObjectMapper(); 
	    String jsonString = mapper.writeValueAsString(comment);
	    return "success";
	}
	
}
