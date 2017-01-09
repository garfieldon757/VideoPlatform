package com.videoPlatform.service;

import java.sql.Date;
import java.text.ParseException;
import java.util.List;
import java.util.TreeMap;

import com.videoPlatform.model.TblUser;
import com.videoPlatform.util.CustomVideoInfo;

public interface RelationManager {

	public List<CustomVideoInfo> getCustomVideoInfoList(TblUser user, String operation_type, String videoName, String uploadDateStart, String uploadDateEnd) throws ParseException;
	public TreeMap<String, Integer> getOperationCountList(String userId, Date userOperationDatetimeStart, Date userOperationDatetimeEnd, String operationType );
}
