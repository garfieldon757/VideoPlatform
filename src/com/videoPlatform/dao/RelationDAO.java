package com.videoPlatform.dao;

import java.sql.Date;
import java.util.List;
import java.text.ParseException;

import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblUservideorelation;
import com.videoPlatform.model.TblVideo;

public interface RelationDAO {

	public Integer getNumOfComments(String videoId, String uploadDateStart, String uploadDateEnd) throws ParseException;
	public Integer getNumOfPlays(String videoId, String uploadDateStart, String uploadDateEnd);
	public Date getOperationDatetime(TblUser user, String operation_type, TblVideo video);
	public Integer getVideoPlayNum(String videoId, String datetimeStart, String datetimeEnd);
	public List<TblUservideorelation> getUservideorelationList(String userId, Date userOperationDatetimeStart, Date userOperationDatetimeEnd, String operationType);
	
	public Integer getUserPlayNum(String userId, String datetimeStart, String datetimeEnd);
	public Integer getUserCollectNum(String userId, String datetimeStart, String datetimeEnd);
	public Integer getUserCommentNum(String userId, String datetimeStart, String datetimeEnd);
}
