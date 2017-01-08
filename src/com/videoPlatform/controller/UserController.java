package com.videoPlatform.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.videoPlatform.dao.UserDAO;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblUservideorelation;
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.service.UserManager;
import com.videoPlatform.service.VideoManager;
import com.videoPlatform.util.CustomVideoInfo;


@Component
@Controller
public class UserController {
	
	@Autowired(required=true)
	UserManager um;
	
	@Autowired(required=true)
	VideoManager vm;
	
	@Autowired(required=true)
	UserDAO userDAO;
	
	@Autowired(required=true)
    private HttpServletRequest httpServletRequest;
	

	@RequestMapping(value="signUp_page")
	public String signUp_page(){
		
		return "SignUp";
	}
	
	@RequestMapping(value="signUp")
	public String signUp(HttpServletRequest request){

				String result_page_url = um.signUp(request);
				return result_page_url;
	}
	/*
	 * 注册页面的一些ajax验证
	 * */
	@ResponseBody
	@RequestMapping(value="ajax_userNameValidation")
	public String ajax_userNameValidation(String userNickName){
		String result = um.userNickNameExist(userNickName);
		return result;
	}
	
	@RequestMapping(value="login_page")
	public String login_page(){
		return "Login";
	}
	
	@RequestMapping(value="login")
	public String login(HttpServletRequest request){
		
		String result_page_url = um.login(request) ;
		return result_page_url;
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		return "main_page";
	}
	
	@RequestMapping("edit_personalProfile_load")
	public ModelAndView edit_personalProfile_load( HttpServletRequest request){
		ModelAndView mv = new ModelAndView("personalProfile");
		TblUser user = um.getSession(request, "user");
		mv.addObject("user", user);
		mv.addObject("defualt_tab", "baseProfile");
		return mv;//跳转至personalProfile页面
	}
	
	@RequestMapping("edit_personalProfile_baseProfile")
	public ModelAndView edit_personalProfile_baseProfile( HttpServletRequest request) throws ParseException{
		ModelAndView mv = new ModelAndView("personalProfile");
		
		TblUser old_user = um.getSession(request, "user");
		String userNickName = request.getParameter("userNickName");
		String userSex = request.getParameter("userSex");
		String userBirthDate_temp1 = request.getParameter("userBirthDate");
		SimpleDateFormat df =  new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date userBirthDate_temp2 = df.parse(userBirthDate_temp1);
		java.sql.Date userBirthDate = new java.sql.Date(userBirthDate_temp2.getTime());
		String userBirthPlace = request.getParameter("userBirthPlace");
		um.updateTblUser_baseProfile(old_user, userNickName, userSex, userBirthDate, userBirthPlace);
		
		TblUser new_user = um.getSession(request, "user");
		mv.addObject("user", new_user );
		mv.addObject("defualt_tab", "baseProfile");
		return mv;//修改"基本信息"属性，跳转至personalProfile页面
	}
	
	@RequestMapping("edit_personalProfile_baseAvatar")
	public ModelAndView edit_personalProfile_baseAvatar( HttpServletRequest request){
		ModelAndView mv = new ModelAndView("personalProfile");
		TblUser user = um.getSession(request, "user");
		mv.addObject("defualt_tab", "baseAvatar");
		return mv;//修改"上传头像"属性，跳转至personalProfile页面
	}
	
	@RequestMapping("edit_personalProfile_security")
	public ModelAndView edit_personalProfile_security( HttpServletRequest request){
		ModelAndView mv = new ModelAndView("personalProfile");
		
		TblUser old_user = um.getSession(request, "user");
		String userEmail = request.getParameter("userEmail");
		String userPhoneNumber = request.getParameter("userPhoneNumber");
		String userPassword = request.getParameter("userPassword");
		um.updateTblUser_security(old_user, userEmail, userPhoneNumber, userPassword);
		
		TblUser new_user = um.getSession(request, "user");
		mv.addObject("user", new_user );
		mv.addObject("defualt_tab", "security");
		return mv;//修改"安全设置"属性，跳转至personalProfile页面
	}
	
	@RequestMapping("edit_personalVideoManagement_load")
	public ModelAndView edit_personalVideoManagement_load( HttpServletRequest request){
		ModelAndView mv = new ModelAndView("personalVideoManagement");
		TblUser user = um.getSession(request, "user");
		mv.addObject("user", user);
		mv.addObject("defualt_tab", "videos");
		return mv;//跳转至personalProfile页面
	}
	
	
	@RequestMapping(value="userManage_load")
	public ModelAndView userManage_load(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("userManage");
		return mv;
	}
	
	@RequestMapping(value="ajax_search_userManage_users", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String ajax_search_userManage_users(String userNickname, HttpServletResponse response) throws JsonProcessingException{

		HttpSession session = httpServletRequest.getSession();
		TblUser user = (TblUser) session.getAttribute("user");
		
		//List<TblVideo> tblVideoList = videoDAO.getVideoByVideokeyword(user.getUserId(), videoKeyword);
		List<TblUser> tblUserList = userDAO.getUserByUserNickName_likeSearch(userNickname);
		
		ObjectMapper mapper = new ObjectMapper(); 
	    String jsonString = mapper.writeValueAsString(tblUserList);
	    return jsonString;
	}
	
	
	
	
}
