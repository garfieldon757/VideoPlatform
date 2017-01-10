package com.videoPlatform.dao.impl;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.videoPlatform.dao.RelationDAO;
import com.videoPlatform.model.TblComment;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblUservideorelation;
import com.videoPlatform.model.TblVideo;

@Repository("rd")
@Transactional
public class RelationDAOImpl implements RelationDAO {

	@PersistenceContext(name="un")
	private EntityManager em;
	
	@Override
	public Integer getNumOfComments(String videoId, String uploadDateStart, String uploadDateEnd) throws ParseException {
		// TODO Auto-generated method stub

		java.sql.Date uploadDateStart_temp1 = java.sql.Date.valueOf(uploadDateStart);
		java.util.Date uploadDateStart_temp2 = new java.util.Date(uploadDateStart_temp1.getTime());
		java.sql.Date uploadDateEnd_temp1 = java.sql.Date.valueOf(uploadDateEnd);
		java.util.Date uploadDateEnd_temp2 = new java.util.Date(uploadDateEnd_temp1.getTime());
		
		String jpql = "select count(c) from TblComment c where c.commentCommentTimestamps >:uploadDateStart and c.commentCommentTimestamps <:uploadDateEnd";
		Number num = (Number)em.createQuery(jpql).setParameter("uploadDateStart", uploadDateStart_temp2)
																				.setParameter("uploadDateEnd", uploadDateEnd_temp2)
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
	public Date getOperationDatetime(TblUser user, String operation_type, TblVideo video) {
		// TODO Auto-generated method stub
		String jpql = "select uvr from TblUservideorelation uvr where uvr.tblUser.userId =:userId and uvr.tblVideo.videoId =:videoId and uvr.userVideoRelationType =:userVideoRelationType";
		List<TblUservideorelation> tblUservideorelationList = em.createQuery(jpql).setParameter("userId", user.getUserId())
																															.setParameter("videoId", video.getVideoId())
																															.setParameter("userVideoRelationType", operation_type)
																															.getResultList();
		if(tblUservideorelationList.size() > 0){
			Date operationDatetime = new java.sql.Date(tblUservideorelationList.get(0).getUserVideoRelationOperationTimestamps().getTime());
			return operationDatetime;
		}else{
			return null;
		}
		
	}

	@Override
	public Integer getVideoPlayNum(String videoId, String datetimeStart, String datetimeEnd) {
		// TODO Auto-generated method stub
		
		java.sql.Date uploadDateStart_temp1 = java.sql.Date.valueOf(datetimeStart+"-01");
		java.util.Date uploadDateStart_temp2 = new java.util.Date(uploadDateStart_temp1.getTime());
		java.sql.Date uploadDateEnd_temp1 = java.sql.Date.valueOf(datetimeEnd+"-01");
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
	public List<TblUservideorelation> getUservideorelationList(String userId, Date userOperationDatetimeStart,
			Date userOperationDatetimeEnd, String operationType) {
		// TODO Auto-generated method stub
		String jpql = "select uvr from TblUservideorelation uvr where uvr.tblUser.userId =:userId and uvr.userVideoRelationOperationTimestamps >:uploadDateStart and uvr.userVideoRelationOperationTimestamps <:uploadDateEnd and uvr.userVideoRelationType =:relationType ";
		List<TblUservideorelation> tblUservideorelationList = em.createQuery(jpql).setParameter("userId", userId)
																																.setParameter("uploadDateStart", userOperationDatetimeStart)
																																.setParameter("uploadDateEnd", userOperationDatetimeEnd)
																																.setParameter("relationType", operationType)
																																.getResultList();
		return tblUservideorelationList;
	}

	@Override
	public Integer getUserPlayNum(String userId, String datetimeStart, String datetimeEnd) {
		// TODO Auto-generated method stub
		java.sql.Date dateStart_temp1 = java.sql.Date.valueOf(datetimeStart+"-01");
		java.util.Date dateStart_temp2 = new java.util.Date(dateStart_temp1.getTime());
		java.sql.Date dateEnd_temp1 = java.sql.Date.valueOf(datetimeEnd+"-01");
		java.util.Date dateEnd_temp2 = new java.util.Date(dateEnd_temp1.getTime());
		
		String jpql = "select count(uvr) from TblUservideorelation uvr where uvr.tblUser.userId =:userId and uvr.userVideoRelationOperationTimestamps >:uploadDateStart and uvr.userVideoRelationOperationTimestamps <:uploadDateEnd and uvr.userVideoRelationType =:relationType ";
		Number num = (Number) em.createQuery(jpql).setParameter("userId", userId)
																				.setParameter("uploadDateStart", dateStart_temp2)
																				.setParameter("uploadDateEnd", dateEnd_temp2)
																				.setParameter("relationType", "play")
																				.getResultList().get(0);
		Integer numOfPlays = num.intValue();
		return numOfPlays;
	}

	@Override
	public Integer getUserCollectNum(String userId, String datetimeStart, String datetimeEnd) {
		// TODO Auto-generated method stub
		java.sql.Date dateStart_temp1 = java.sql.Date.valueOf(datetimeStart+"-01");
		java.util.Date dateStart_temp2 = new java.util.Date(dateStart_temp1.getTime());
		java.sql.Date dateEnd_temp1 = java.sql.Date.valueOf(datetimeEnd+"-01");
		java.util.Date dateEnd_temp2 = new java.util.Date(dateEnd_temp1.getTime());
		
		String jpql = "select count(uvr) from TblUservideorelation uvr where uvr.tblUser.userId =:userId and uvr.userVideoRelationOperationTimestamps >:uploadDateStart and uvr.userVideoRelationOperationTimestamps <:uploadDateEnd and uvr.userVideoRelationType =:relationType ";
		Number num = (Number) em.createQuery(jpql).setParameter("userId", userId)
																				.setParameter("uploadDateStart", dateStart_temp2)
																				.setParameter("uploadDateEnd", dateEnd_temp2)
																				.setParameter("relationType", "collect")
																				.getResultList().get(0);
		Integer numOfCollect = num.intValue();
		return numOfCollect;
	}

	@Override
	public Integer getUserCommentNum(String userId, String datetimeStart, String datetimeEnd) {
		// TODO Auto-generated method stub
		java.sql.Date dateStart_temp1 = java.sql.Date.valueOf(datetimeStart+"-01");
		java.util.Date dateStart_temp2 = new java.util.Date(dateStart_temp1.getTime());
		java.sql.Date dateEnd_temp1 = java.sql.Date.valueOf(datetimeEnd+"-01");
		java.util.Date dateEnd_temp2 = new java.util.Date(dateEnd_temp1.getTime());
		
		String jpql = "select count(c) from TblComment c where c.tblUser.userId =:userId and c.commentCommentTimestamps >:uploadDateStart and c.commentCommentTimestamps <:uploadDateEnd ";
		Number num = (Number) em.createQuery(jpql).setParameter("userId", userId)
																				.setParameter("uploadDateStart", dateStart_temp2)
																				.setParameter("uploadDateEnd", dateEnd_temp2)
																				.getResultList().get(0);
		Integer numOfComment = num.intValue();
		return numOfComment;
	}

	@Override
	public TblComment addComment(TblUser user, TblVideo video, TblComment replyTo_tblcomment, String comment_content) {
		// TODO Auto-generated method stub
		UUID uuid = UUID.randomUUID();
		Timestamp now = new Timestamp(System.currentTimeMillis()); 
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		TblComment comment = new TblComment(uuid.toString(), video , user, replyTo_tblcomment, comment_content, now, null);
		em.persist(comment);
		return comment;
	}
	
	@Override
	public List<TblComment> getCommentListByVideoId(String videoId) {
		// TODO Auto-generated method stub
		String jpql = "select c from TblComment c where c.tblVideo.videoId =:videoId";
		List<TblComment> commentList = em.createQuery(jpql).setParameter("videoId", videoId).getResultList();
		return commentList;
	}

	@Override
	public TblComment getCommentByCommentId(String replyTo_commentId) {
		// TODO Auto-generated method stub
		String jpql = "select c from TblComment c where c.commentId =:replyTo_commentId";
		TblComment replyTo_comment = (TblComment) em.createQuery(jpql).setParameter("replyTo_commentId", replyTo_commentId).getResultList();
		return replyTo_comment;
	}

}
