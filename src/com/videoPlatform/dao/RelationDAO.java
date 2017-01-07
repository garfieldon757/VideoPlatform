package com.videoPlatform.dao;

import java.util.Date;
import java.util.List;
import java.text.ParseException;

import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblVideo;

public interface RelationDAO {

	public Integer getNumOfComments(String videoId, String uploadDateStart, String uploadDateEnd) throws ParseException;
	public Integer getNumOfPlays(String videoId, String uploadDateStart, String uploadDateEnd);
	public Date getOperationDatetime(TblUser user, String operation_type, TblVideo video);
	public Integer getVideoPlayNumList(String videoId, String datetimeStart, String datetimeEnd);
	
}
