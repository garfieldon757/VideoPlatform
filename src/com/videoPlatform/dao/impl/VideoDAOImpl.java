package com.videoPlatform.dao.impl;

import java.sql.Date;
import java.text.ParseException;
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
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.model.TblVideotagrelation;

@Repository("vd")
@Transactional
public class VideoDAOImpl implements VideoDAO{

	@PersistenceContext(name="un")
	private EntityManager em;
	
	@Override
	public List<TblDatadictionary> getVideoCategoryList() {
		
		String jpql = "select vc from TblDatadictionary vc where vc.dataDictionaryKey = 'videoCategory' ";
		List<TblDatadictionary> videoCategoryList = em.createQuery(jpql).getResultList();
		return videoCategoryList;
		
	}
	
	@Override
	public TblDatadictionary getVideoCategoryByVideoCategoryID(String videoCategroyID) {
		String jpql = "select vc from TblDatadictionary vc where vc.dataDictionaryId =:videoCategroyID";
		TblDatadictionary videoCategroy = (TblDatadictionary) em.createQuery(jpql).setParameter("videoCategroyID", videoCategroyID ).getResultList().get(0);
		return videoCategroy;
	}

	@Override
	public List<TblVideo> getVideoListByVideoCategroyAndPage(TblDatadictionary videoCategory , int page) {
		String jpql = "select v from TblVideo v where v.tblDatadictionary =:videoCategory";
		int startVideoIndex = ( page -1 ) * 16 ;
		List<TblVideo> videoList = em.createQuery(jpql)
													.setParameter("videoCategory", videoCategory)
													.setMaxResults(16)
													.setFirstResult(startVideoIndex)
													.getResultList();
		return videoList;
	}

	@Override
	public int getVideoListSizeByVideoCategory(TblDatadictionary videoCategory) {
		String jpql = "select count(v) from TblVideo v where v.tblDatadictionary =:videoCategory";
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
	
	@Override
	public TblDatadictionary getTblDatadictionaryByVideoCategory(String videoCategory) {
		// TODO Auto-generated method stub
		String jpql = "select tb from TblDatadictionary tb where tb.dataDictionaryName =:videoCategory";
		List<TblDatadictionary> tblDatadictionaryList = em.createQuery(jpql).setParameter("videoCategory", videoCategory).getResultList();
		if(tblDatadictionaryList.size() > 0){
			return tblDatadictionaryList.get(0);
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
		TblDatadictionary tblDatadictionary = getTblDatadictionaryByVideoCategory(videoCategory);
		video.setTblDatadictionary(tblDatadictionary);
		
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
