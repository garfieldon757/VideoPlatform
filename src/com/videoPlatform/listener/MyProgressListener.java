package com.videoPlatform.listener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.videoPlatform.util.Progress;

public class MyProgressListener implements ProgressListener {

	private HttpSession session;
	
	public MyProgressListener(HttpServletRequest request){
		this.session = request.getSession();
		Progress status = new Progress();
		session.setAttribute("picStatus", status);
	}
	
	@Override
	public void update(long pBytesRead, long pContentLength, int pItems) {
		// TODO Auto-generated method stub
		Progress status = (Progress) session.getAttribute("picStatus");
		  status.setBytesRead(pBytesRead);
		  status.setContentLength(pContentLength);
		  status.setItems(pItems);
		  session.setAttribute("picStatus",status);
		//  session.setAttribute("pBytesRead", status.getBytesRead());
		//  session.setAttribute("pContentLength", status.getContentLength());
		  session.setAttribute("percent",status.getPercent());
		//  System.out.println(status+"目前："+status.getPercent());
	}

}
