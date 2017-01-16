package com.videoPlatform.dao.impl;

import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.videoPlatform.dao.VideoDAO;
import com.videoPlatform.model.TblDatadictionary;
import com.videoPlatform.model.TblTag;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblUservideorelation;
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.model.TblVideoCategory;
import com.videoPlatform.model.TblVideotagrelation;

@Repository("vd")
@Transactional
public class VideoDAOImpl implements VideoDAO{

	@PersistenceContext(name="un")
	private EntityManager em;
	
	@Override
	public List<TblVideoCategory> getVideoCategoryList() {
		
		String jpql = "select vc from TblVideoCategory vc";
		List<TblVideoCategory> videoCategoryList = em.createQuery(jpql).getResultList();
		return videoCategoryList;
		
	}
	
	@Override
	public TblVideoCategory getVideoCategoryByVideoCategoryID(String videoCategroyID) {
		String jpql = "select vc from TblVideoCategory vc where vc.videoCategoryId =:videoCategroyID";
		TblVideoCategory videoCategroy = (TblVideoCategory) em.createQuery(jpql).setParameter("videoCategroyID", videoCategroyID ).getResultList().get(0);
		return videoCategroy;
	}

	@Override
	public List<TblVideo> getVideoListByVideoCategroyAndPage(TblVideoCategory videoCategory , int page) {
		String jpql = "select v from TblVideo v where v.tblVideocategory =:videoCategory";
		int startVideoIndex = ( page -1 ) * 16 ;
		List<TblVideo> videoList = em.createQuery(jpql)
													.setParameter("videoCategory", videoCategory)
													.setMaxResults(16)
													.setFirstResult(startVideoIndex)
													.getResultList();
		return videoList;
	}

	@Override
	public int getVideoListSizeByVideoCategory(TblVideoCategory videoCategory) {
		String jpql = "select count(v) from TblVideo v where v.tblVideocategory =:videoCategory";
		String videoListSizeTemp=em.createQuery(jpql).setParameter("videoCategory", videoCategory ).getSingleResult().toString();
		int videoListSize = Integer.parseInt(videoListSizeTemp);
		return videoListSize;
	}

	@Override
	public TblVideo getVideoByVideoID(String videoID) {
		// TODO Auto-generated method stub
		String jpql = "select v from TblVideo v where v.videoId =:videoID ";
		TblVideo video = (TblVideo) em.createQuery(jpql).setParameter("videoID", videoID).getResultList().get(0);
		return video;
	}

	@Override
	public List<TblVideo> getVideoByVideoname(String userId, String videoName) {
		// TODO Auto-generated method stub
		String jpql  = "select v from TblVideo v where v.tblUser.userId =:userId and v.videoName =:videoName";
		List<TblVideo> videoList = em.createQuery(jpql).setParameter("userId", userId)
																					.setParameter("videoName", videoName)
																					.getResultList();
		return videoList;
	}
	
	@Override
	public List<TblVideo> getVideoByVideokeyword(String userId, String videoKeyword) {
		// TODO Auto-generated method stub
		//随后需要将这个方法修改成“高级”的模糊查询
		String jpql  = "select v from TblVideo v where v.tblUser.userId =:userId and v.videoName LIKE :videoKeyword";
		List<TblVideo> videoList = em.createQuery(jpql).setParameter("userId", userId)
																					.setParameter("videoKeyword", "%" + videoKeyword + "%")
																					.getResultList();
		return videoList;
	}
	
	@Override
	public List<TblUservideorelation> getUservideorelationByMultiParams(String userId, String videoKeyword, String operateDateStart,
			String operateDateEnd, String operation_type) {
		// TODO Auto-generated method stub
		java.sql.Date operateDateStart_temp1 = java.sql.Date.valueOf(operateDateStart);
		java.util.Date operateDateStart_temp2 = new java.util.Date(operateDateStart_temp1.getTime());
		java.sql.Date operateDateEnd_temp1 = java.sql.Date.valueOf(operateDateEnd);
		java.util.Date operateDateEnd_temp2 = new java.util.Date(operateDateEnd_temp1.getTime());
		List<TblUservideorelation> videoList = new ArrayList<TblUservideorelation>();
		
		if( !videoKeyword.isEmpty()){
			String jpql1  = "select uvr from TblUservideorelation uvr where uvr.tblUser.userId =:userId and uvr.tblVideo.videoName LIKE :videoKeyword and  uvr.userVideoRelationOperationTimestamps >:operateDateStart and uvr.userVideoRelationOperationTimestamps <:operateDateEnd and uvr.userVideoRelationType =:operation_type";
			videoList = em.createQuery(jpql1).setParameter("userId", userId)
																.setParameter("videoKeyword", "%" + videoKeyword + "%" )
																.setParameter("operateDateStart", operateDateStart_temp2)
																.setParameter("operateDateEnd", operateDateEnd_temp2)
																.setParameter("operation_type", operation_type)
																.getResultList();
		}else
		{
			String jpql2  = "select uvr from TblUservideorelation uvr where uvr.tblUser.userId =:userId and uvr.userVideoRelationOperationTimestamps >:operateDateStart and uvr.userVideoRelationOperationTimestamps <:operateDateEnd and uvr.userVideoRelationType =:operation_type";
			videoList = em.createQuery(jpql2).setParameter("userId", userId)
																.setParameter("operateDateStart", operateDateStart_temp2)
																.setParameter("operateDateEnd", operateDateEnd_temp2)
																.setParameter("operation_type", operation_type)
																.getResultList();
		}
																		
		return videoList;
	}


	@Override
	public Integer getNumOfComments(String videoId, String uploadDateStart, String uploadDateEnd) throws ParseException {
		// TODO Auto-generated method stub

		java.sql.Date uploadDateStart_temp1 = java.sql.Date.valueOf(uploadDateStart);
		java.util.Date uploadDateStart_temp2 = new java.util.Date(uploadDateStart_temp1.getTime());
		java.sql.Date uploadDateEnd_temp1 = java.sql.Date.valueOf(uploadDateEnd);
		java.util.Date uploadDateEnd_temp2 = new java.util.Date(uploadDateEnd_temp1.getTime());
		
		String jpql = "select count(uvr) from TblUservideorelation uvr where uvr.userVideoRelationOperationTimestamps >:uploadDateStart and uvr.userVideoRelationOperationTimestamps <:uploadDateEnd and uvr.userVideoRelationType =:relationType ";
		Number num = (Number)em.createQuery(jpql).setParameter("uploadDateStart", uploadDateStart_temp2)
																															.setParameter("uploadDateEnd", uploadDateEnd_temp2)
																															.setParameter("relationType", "comment")
																															.getResultList().get(0);
		Integer numOfComments = num.intValue();
		return numOfComments;
		
	}

	@Override
	public Integer getNumOfPlays(String videoId, String uploadDateStart, String uploadDateEnd) {
		// TODO Auto-generated method stub
		java.sql.Date uploadDateStart_temp1 = java.sql.Date.valueOf(uploadDateStart);
		java.util.Date uploadDateStart_temp2 = new java.util.Date(uploadDateStart_temp1.getTime());
		java.sql.Date uploadDateEnd_temp1 = java.sql.Date.valueOf(uploadDateEnd);
		java.util.Date uploadDateEnd_temp2 = new java.util.Date(uploadDateEnd_temp1.getTime());
		
		String jpql = "select count(uvr) from TblUservideorelation uvr where uvr.userVideoRelationOperationTimestamps >:uploadDateStart and uvr.userVideoRelationOperationTimestamps <:uploadDateEnd and uvr.userVideoRelationType =:relationType ";
		Number num = (Number) em.createQuery(jpql).setParameter("uploadDateStart", uploadDateStart_temp2)
																																.setParameter("uploadDateEnd", uploadDateEnd_temp2)
																																.setParameter("relationType", "play")
																																.getResultList().get(0);
		Integer numOfPlays = num.intValue();
		return numOfPlays;
		
	}

	@Override
	public List<TblVideotagrelation> getVideoTagList(String videoId) {
		// TODO Auto-generated method stub
		String jpql = "select vtr from TblVideotagrelation vtr where vtr.tblVideo.videoId =:videoId ";
		List<TblVideotagrelation> tblVideotagrelationList = em.createQuery(jpql).setParameter("videoId", videoId).getResultList();
		if(tblVideotagrelationList.size() > 0)
		{
			return tblVideotagrelationList;
		}else{
			return null;
		}
		
	}
	
//	@Override
//	public TblDatadictionary getTblDatadictionaryByVideoCategory(String videoCategory) {
//		// TODO Auto-generated method stub
//		String jpql = "select tb from TblDatadictionary tb where tb.dataDictionaryName =:videoCategory";
//		List<TblDatadictionary> tblDatadictionaryList = em.createQuery(jpql).setParameter("videoCategory", videoCategory).getResultList();
//		if(tblDatadictionaryList.size() > 0){
//			return tblDatadictionaryList.get(0);
//		}else{
//			return null;
//		}
//	}
	
	@Override
	public TblVideoCategory getTblVideoCategoryByVideoCategoryName(String videoCategoryName) {
		// TODO Auto-generated method stub
		String jpql = "select tvc from TblVideoCategory tvc where tvc.videoCategoryName =:videoCategoryName";
		List<TblVideoCategory> tblVideoCategoryList = em.createQuery(jpql).setParameter("videoCategoryName", videoCategoryName).getResultList();
		if(tblVideoCategoryList.size() > 0){
			return tblVideoCategoryList.get(0);
		}else{
			return null;
		}
	}

	@Override
	public TblVideo updateVideo(String videoId, String videoName, String videoDescription, String videoCategory) {
		// TODO Auto-generated method stub
		TblVideo video = getVideoByVideoID(videoId);
		video.setVideoName(videoName);
		video.setVideoDescription(videoDescription);
		TblVideoCategory tblVideoCategroy = getTblVideoCategoryByVideoCategoryName(videoCategory);
		video.setTblVideocategory(tblVideoCategroy);;
		
		em.merge(video);
		return video;
	}
	
	@Override
	public TblTag getTblTagByTagName(String newTag) {
		// TODO Auto-generated method stub
		String jpql = "select tt from TblTag tt where tt.tagName =:newTag";
		TblTag tblTag = (TblTag) em.createQuery(jpql).setParameter("newTag", newTag).getResultList().get(0);
		return tblTag;
	}
	
	@Override
	public List<TblTag> getTblTagList() {
		// TODO Auto-generated method stub
		String jpql = "select tt from TblTag tt";
		List<TblTag> tblTagList = em.createQuery(jpql).getResultList();
		return tblTagList;
	}

	@Override
	public void addVideotagrelation(TblUser user, String videoId, String newTag) {
		// TODO Auto-generated method stub
		TblVideotagrelation tblVideotagrelation = new TblVideotagrelation();
		TblVideo tblVideo = getVideoByVideoID(videoId);
		TblTag tblTag = getTblTagByTagName(newTag);
		UUID uuid = UUID.randomUUID();
		tblVideotagrelation.setVideoTagRelationId(uuid.toString());
		tblVideotagrelation.setTblUser(user);
		tblVideotagrelation.setTblVideo(tblVideo);
		tblVideotagrelation.setTblTag(tblTag);
		
		em.persist(tblVideotagrelation);
		return ;
	}

	@Override
	public void addTag(String newTag) {
		// TODO Auto-generated method stub
		TblTag newTblTag = new TblTag();
		UUID uuid = UUID.randomUUID();
		newTblTag.setTagId(uuid.toString());
		newTblTag.setTagName(newTag);
		em.persist(newTblTag);
	}

	@Override
	public Integer getTotalCountOfPlay(String videoId, Date videoPlayDatetimeStart, Date videoPlayDatetimeEnd) {
		// TODO Auto-generated method stub
		String videoPlayDatetimeStart_string = videoPlayDatetimeStart.toString();
		String videoPlayDatetimeEnd_string = videoPlayDatetimeEnd.toString();
		String jpql = "select count(uvr) from TblUservideorelation uvr where uvr.tblVideo.videoId =:videoId and uvr.userVideoRelationOperationTimestamps >:videoPlayDatetimeStart and uvr.userVideoRelationOperationTimestamps <:videoPlayDatetimeEnd";
		Number totalCount_play = (Number)em.createQuery(jpql).setParameter("videoId", videoId)
																					.setParameter("videoPlayDatetimeStart", videoPlayDatetimeStart)
																					.setParameter("videoPlayDatetimeEnd", videoPlayDatetimeEnd)
																					.getSingleResult();
		
		return totalCount_play.intValue();
	}

	@Override
	public Integer getTotalCountOfPlayPeople(String videoId, Date videoPlayDatetimeStart, Date videoPlayDatetimeEnd) {
		// TODO Auto-generated method stub
		String jpql = "select count(DISTINCT user_ID) from TblUservideorelation uvr where uvr.tblVideo.videoId =:videoId and uvr.userVideoRelationType =:userVideoRelationType and uvr.userVideoRelationOperationTimestamps >:videoPlayDatetimeStart and uvr.userVideoRelationOperationTimestamps <:videoPlayDatetimeEnd ";
		Number totalCount_playPeople = (Number) em.createQuery(jpql).setParameter("videoId", videoId)
																								.setParameter("userVideoRelationType", "play")
																								.setParameter("videoPlayDatetimeStart", videoPlayDatetimeStart)
																								.setParameter("videoPlayDatetimeEnd", videoPlayDatetimeEnd)
																								.getSingleResult();
		return totalCount_playPeople.intValue();
	}

	

	


	

	
	
}
