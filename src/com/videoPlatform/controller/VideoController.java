package com.videoPlatform.controller;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.videoPlatform.service.RelationManager;
import com.videoPlatform.service.VideoManager;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.videoPlatform.dao.RelationDAO;
import com.videoPlatform.dao.VideoDAO;
import com.videoPlatform.model.TblComment;
import com.videoPlatform.model.TblDatadictionary;
import com.videoPlatform.model.TblTag;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblUservideorelation;
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.model.TblVideoCategory;
import com.videoPlatform.model.TblVideotagrelation;

@Component
@Controller
public class VideoController {

	@Autowired(required=true)
	VideoManager vm;
	
	@Autowired(required=true)
	RelationDAO relationDAO;
	
	@Autowired(required=true)
	VideoDAO videoDAO;
	
	 @Autowired(required=true)
     private HttpServletRequest httpServletRequest;

	
	@RequestMapping(value="videoSearchInit")
	public ModelAndView videoSearchInit(@RequestParam("videoCategoryID") String videoCategoryID , @RequestParam("page") int page , HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("VideoSearch");
		List<TblVideoCategory> videoCategoryList = vm.getVideoCategoryList();
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
		TblVideo video = vm.getVideoByVideoID(videoID);//视频部分信息
		List<TblComment> commentList = relationDAO.getCommentListByVideoId(videoID);//评论部分信息
		List<TblVideotagrelation> tblVideotagrelationList = videoDAO.getVideoTagList(videoID);//标签部分信息
		//推荐视频部分信息
		//推荐最近看过该视频用户信息
		if(video != null){
			mv.addObject("video", video);
			mv.addObject("commentList", commentList);
			mv.addObject("tblVideotagrelationList", tblVideotagrelationList);
		}
		return mv;
	}
	
	@RequestMapping(value="videoInfoEdit_load")
	public ModelAndView videoInfoEdit_load(@RequestParam("videoId") String videoId , HttpServletRequest request){
		ModelAndView mv = new ModelAndView("videoEdit");
		HttpSession session = request.getSession();
		TblUser user = (TblUser) session.getAttribute("user");
		TblVideo video = vm.getVideoByVideoID(videoId);
		List<TblVideoCategory> tblVideoCategoryList = vm.getVideoCategoryList();
		List<TblVideotagrelation> videoTagList = vm.getVideoTagList(videoId);
		if(video != null){
			mv.addObject("user", user);
			mv.addObject("video", video);
			mv.addObject("videoCategoryList", tblVideoCategoryList);
			mv.addObject("videoTagList", videoTagList);
		}
		return mv;
	}
	
//	@RequestMapping(value="videoInfoEdit")
//	public ModelAndView videoInfoEdit(HttpServletRequest request) throws UnsupportedEncodingException{
//		ModelAndView mv = new ModelAndView("videoEdit");
//		
//		HttpSession session = request.getSession();
//		TblUser user = (TblUser) session.getAttribute("user");
//		
//		String videoId = request.getParameter("videoId");
//		String videoName = request.getParameter("videoName");
//		String videoDescription = request.getParameter("videoDescription");//为获取
//		String videoCategory = request.getParameter("videoCategory");//中文编码
//		String tag = request.getParameter("tag");
//		//对tag进行预处理：将传入的tag字符串再空格处分割成独立的tags
//		String[] newTagList_temp = tag.split(" ");
//		List<String> newTagList = new ArrayList<String>();
//		for(String newTag:newTagList_temp){
//			if( !newTag.equals("") ){
//				newTagList.add(newTag);
//			}
//		}
//		
//		vm.addTags(newTagList);
//		TblVideo video = videoDAO.updateVideo(videoId, user, videoName, videoDescription, videoCategory);
//		vm.addVideotagrelations(user, videoId, newTagList);
//		
//		video = vm.getVideoByVideoID(videoId);
//		List<TblVideoCategory> tblVideoCategoryList = vm.getVideoCategoryList();
//		List<TblVideotagrelation> videoTagList = vm.getVideoTagList(videoId);
//		if(video != null){
//			mv.addObject("video", video);
//			mv.addObject("videoCategoryList", tblVideoCategoryList);
//			mv.addObject("videoTagList", videoTagList);
//		}
//		
//		return mv;
//	}
	
	
	@RequestMapping(value="videoManage_load")
	public ModelAndView videoManage_load(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("videoManage");

		return mv;
	}
	
	@RequestMapping(value="ajax_search_videoManage_videos", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String ajax_search_videoManage_videos(String videoKeyword, HttpServletResponse response) throws JsonProcessingException{

		HttpSession session = httpServletRequest.getSession();
		TblUser user = (TblUser) session.getAttribute("user");
		
		List<TblVideo> tblVideoList = videoDAO.getVideoByVideokeyword(user.getUserId(), videoKeyword);
		
		ObjectMapper mapper = new ObjectMapper(); 
	    String jsonString = mapper.writeValueAsString(tblVideoList);
	    return jsonString;
	}
	
	@RequestMapping(value="videoConsole_load")
	public ModelAndView videoConsole_load(String videoId, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("videoConsole");
		TblVideo video = vm.getVideoByVideoID(videoId);
		mv.addObject("video", video);
		return mv;
	}
	
	@RequestMapping(value="ajax_search_videoConsole_videoPlayInfo", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String ajax_search_videoConsole_videoPlayInfo(String videoId, String videoPlayDatetimeStart, String videoPlayDatetimeEnd, HttpServletResponse response) throws JsonProcessingException, ParseException{

		HttpSession session = httpServletRequest.getSession();
		TblUser user = (TblUser) session.getAttribute("user");
		
		HashMap<String , Integer> videoPlayInfo = new HashMap<String , Integer>();
		TreeMap<String , Integer> playCountList = new TreeMap<String , Integer>();
		
		SimpleDateFormat df =  new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date videoPlayDatetimeStart_temp1 = df.parse(videoPlayDatetimeStart);
		java.sql.Date videoPlayDatetimeStart_final = new java.sql.Date(videoPlayDatetimeStart_temp1.getTime());
		
		java.util.Date videoPlayDatetimeEnd_temp1 = df.parse(videoPlayDatetimeEnd);
		java.sql.Date videoPlayDatetimeEnd_final = new java.sql.Date(videoPlayDatetimeEnd_temp1.getTime());//为了将2017-01格式转换成2017-01-01的格式的类型
		
		videoPlayInfo = vm.getPlayInfo(videoId, videoPlayDatetimeStart_final, videoPlayDatetimeEnd_final);//获取当前视频的播放统计数据
		playCountList = vm.getPlayCountList(videoId, videoPlayDatetimeStart_final, videoPlayDatetimeEnd_final);//获取当前视频的播放统计折线图数据
		List<Object> returnObj = new ArrayList<Object>();
		returnObj.add(videoPlayInfo);
		returnObj.add(playCountList);
		
		ObjectMapper mapper = new ObjectMapper(); 
	    String jsonString = mapper.writeValueAsString(returnObj);
	    return jsonString;
	}
	
	@RequestMapping(value="watchRecord_load", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public ModelAndView watchRecord_load(HttpServletResponse response) throws ParseException{
		ModelAndView mv = new ModelAndView("watchRecord");
		HttpSession session = httpServletRequest.getSession();
		TblUser user = (TblUser) session.getAttribute("user");
		
		Map<String, List<TblUservideorelation>> uservideorelation_watchRecord_list = relationDAO.getUservideorelationListByUserIdAndOpetationType(user.getUserId(), "play");

		mv.addObject("tblUservideorelationList_watchRecord", uservideorelation_watchRecord_list);
		return mv;
	} 
	
}
