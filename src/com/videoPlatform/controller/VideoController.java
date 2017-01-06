package com.videoPlatform.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.videoPlatform.service.VideoManager;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.videoPlatform.dao.VideoDAO;
import com.videoPlatform.model.TblDatadictionary;
import com.videoPlatform.model.TblTag;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.model.TblVideotagrelation;

@Component
@Controller
public class VideoController {

	@Autowired(required=true)
	VideoManager vm;
	
	@Autowired(required=true)
	VideoDAO videoDAO;
	
	 @Autowired(required=true)
     private HttpServletRequest httpServletRequest;

	
	@RequestMapping(value="videoSearchInit")
	public ModelAndView videoSearchInit(@RequestParam("videoCategoryID") String videoCategoryID , @RequestParam("page") int page , HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("VideoSearch");
		List<TblDatadictionary> videoCategoryList = vm.getVideoCategoryList();
		List<TblVideo> videoList = vm.getVideoListByVideoCategroyIDAndPage(videoCategoryID , page);
		int videoListSize = vm.getVideoListSizeByVideoCategoryID(videoCategoryID);
		if(videoCategoryList != null && videoList != null){
			mv.addObject("videoCategoryList" , videoCategoryList);//传给视频分类栏使用
			mv.addObject("videoList" , videoList);//传16个视频对象给16个视频区域使用
			mv.addObject("videoListSize", videoListSize);//传给分页组件使用
			mv.addObject("videoCategoryID", videoCategoryID);
			mv.addObject("page", page);
		}
		return mv;
	}
	
	@RequestMapping(value="videoPlay")
	public ModelAndView videoPlay(@RequestParam("videoID") String videoID , HttpServletRequest request){
		ModelAndView mv = new ModelAndView("VideoPlayer");
		TblVideo video = vm.getVideoByVideoID(videoID);
		if(video != null){
			mv.addObject("video", video);
		}
		return mv;
	}
	
	@RequestMapping(value="videoInfoEdit_load")
	public ModelAndView videoInfoEdit_load(@RequestParam("videoId") String videoId , HttpServletRequest request){
		ModelAndView mv = new ModelAndView("videoEdit");
		TblVideo video = vm.getVideoByVideoID(videoId);
		List<TblDatadictionary> tblDatadictionaryList = vm.getVideoCategoryList();
		List<TblVideotagrelation> videoTagList = vm.getVideoTagList(videoId);
		if(video != null){
			mv.addObject("video", video);
			mv.addObject("videoCategoryList", tblDatadictionaryList);
			mv.addObject("videoTagList", videoTagList);
		}
		return mv;
	}
	
	@RequestMapping(value="videoInfoEdit")
	public ModelAndView videoInfoEdit(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView mv = new ModelAndView("videoEdit");
		
		HttpSession session = request.getSession();
		TblUser user = (TblUser) session.getAttribute("user");
		
		String videoId = request.getParameter("videoId");
		String videoName = request.getParameter("videoName");
		String videoDescription = request.getParameter("videoDescription");//为获取
		String videoCategory = request.getParameter("videoCategory");//中文编码
		String tag = request.getParameter("tag");
		//对tag进行预处理：将传入的tag字符串再空格处分割成独立的tags
		String[] newTagList_temp = tag.split(" ");
		List<String> newTagList = new ArrayList<String>();
		for(String newTag:newTagList_temp){
			if( !newTag.equals("") ){
				newTagList.add(newTag);
			}
		}
		
		vm.addTags(newTagList);
		TblVideo video = videoDAO.updateVideo(videoId, videoName, videoDescription, videoCategory);
		vm.addVideotagrelations(user, videoId, newTagList);
		
		video = vm.getVideoByVideoID(videoId);
		List<TblDatadictionary> tblDatadictionaryList = vm.getVideoCategoryList();
		List<TblVideotagrelation> videoTagList = vm.getVideoTagList(videoId);
		if(video != null){
			mv.addObject("video", video);
			mv.addObject("videoCategoryList", tblDatadictionaryList);
			mv.addObject("videoTagList", videoTagList);
		}
		
		return mv;
	}
	
	@RequestMapping(value="videoManage_load")
	public ModelAndView videoManage_load(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("videoManage");

		
		
		return mv;
	}
	
	@RequestMapping(value="ajax_search_videoManage_videos")
	@ResponseBody
	public String ajax_search_videoManage_videos(String videoKeyword) throws JsonProcessingException{

		HttpSession session = httpServletRequest.getSession();
		TblUser user = (TblUser) session.getAttribute("user");
		
		List<TblVideo> tblVideoList = videoDAO.getVideoByVideokeyword(user.getUserId(), videoKeyword);
		
		ObjectMapper mapper = new ObjectMapper(); 
	    String jsonString = mapper.writeValueAsString(tblVideoList);
	    return jsonString;
	}
	
}
