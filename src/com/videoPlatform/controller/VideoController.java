package com.videoPlatform.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.videoPlatform.service.VideoManager;
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
	public ModelAndView videoInfoEdit(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("videoEdit");
		
		HttpSession session = request.getSession();
		TblUser user = (TblUser) session.getAttribute("user");
		
		String videoId = request.getParameter("videoId");
		String videoName = request.getParameter("videoName");
		String videoDescription = request.getParameter("videoDescription");
		String videoCategory = request.getParameter("videoCategory");
		String tag = request.getParameter("tag");
		String[] newTagList = tag.split(" ");//将传入的tag字符串再空格处分割成独立的tags
		
		TblVideo video = videoDAO.updateVideo(videoId, videoName, videoDescription, videoCategory);
		vm.addVideotagrelations(user, videoId, newTagList);
		
		return mv;
	}
	
}
