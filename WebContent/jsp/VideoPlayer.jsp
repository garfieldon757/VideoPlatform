<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ad</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    <link rel="shortcut icon" href="/public/images/favicons/favicon.ico">

    <link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/app.css" rel="stylesheet" type="text/css">
    <link href="css/carer-badges.css" rel="stylesheet" type="text/css">
    <link href="css/comment.css" rel="stylesheet" type="text/css">
</head>
<body class="ng-scope">

<%@include file="header.jsp"%>		

<div id="main">

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-5">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="page-header">
                        <h2>${video.videoName} <small>${video.tblVideocategory.videoCategoryName}</small></h2>
                    </div>

                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="500" height="400">
                        <param name="movie" value="util/flvplayer.swf" />
                        <param name="quality" value="high" />
                        <param name="allowFullScreen" value="true" />
                        <embed src="util/flvplayer.swf"
                               allowfullscreen="true"
                               flashvars="vcastr_file=${video.videoSourceLink}&IsAutoPlay=1"
                               quality="high"
                               pluginspage="http://www.macromedia.com/go/getflashplayer"
                               type="application/x-shockwave-flash"
                               width="100%" height="500">
                        </embed>
                    </object>

                    <div id="video-block-footer" class="row">
                        <br />
                        <div class="col-md-6">
                        	<br/>
                            <dl class="dl-horizontal">
                                <dt>品牌：</dt>
                                <dd>${video.videoBrand}</dd>
                            </dl>
                            <dl class="dl-horizontal">
                                <dt>国家：</dt>
                                <dd>${video.videoCountry}</dd>
                            </dl>
                            <dl class="dl-horizontal">
                                <dt>语言：</dt>
                                <dd>${video.videoLanguage}</dd>
                            </dl>
                            <dl class="dl-horizontal">
                                <dt>发布年份：</dt>
                                <dd>${video.videoPublishYear}</dd>
                            </dl>
                            <dl class="dl-horizontal">
                                <dt>发布者信息：</dt>
                                <dd>${video.tblUser.userNickName}</dd>
                                <input type="hidden" id="videoId" name="videoId" value="${video.videoId}"> 
                                <button id="video_userName" value="${video.tblUser.userNickName}" style="display:none"></button>
                            </dl>
                            
                        </div>
                        <div class="col-md-5">
                            <div class="">
                                <button type="button" id="downloadBtn" value="${video.videoSourceLink}" class="btn btn-primary btn-lg btn-block">下载视频</button>
                                <a href="loadImageProcess4Trial_frameSegmentation?videoID=${video.videoId}"><button type="button" class="btn btn-default btn-lg btn-block">分析视频</button></a>
                            </div>
                        </div>
                        <div class="col-md-1">
                        </div>

                    </div>

                </div>
            </div>
            
            <div class="panel panel-default">
	            <div class="panel-body">
	            
	                <div class="page-header">
	                	<h2>发布评论</h2>
	                </div>
	                
	                <div id="video-block-footer" class="row">
		                <div id="top_reply">
			                <div id="commentArea" class="out">
			                    <div class="np-reply-box blueLight np-reply-box-active" id="np-reply-box" style="">
			                    
			                        <div class="np-reply-box-content textarea">
			                            <textarea id="comment_content" name="comment_content" style="height: 60px; padding: 10px;" placeholder="输入评论..."></textarea>
			                        </div>
			                        
			                        <div class="commtSub np-reply-box-footer" style="position:relative;display:block;height:40px" id="p_login_btn">
				                        <div class="submitBtn">
				                            <span class="subline">
												<a id="comment_btn" class="np-btn np-btn-submit" id="top_post_btn">发表评论</a>
											</span>
				                        </div>
				                    </div>
				                    
			                    </div>
			                </div>
			            </div>
	                </div>
	                
	                <br />
	                <ul id="comment_list" class="post-list np-comment-list">
	                	<li id="comment_list_first" class="np-title-hot">相关评论</li>
	                	
	                	<c:forEach items="${commentList}" var="c">
			                	<li class="np-post   topAll  " id="">
		
			                	  <img class="np-avatar popClick" src="${c.tblUser.userAvatarImgLink}" alt="头像">
		
			                	  <div class="np-post-body">
			                	    <div class="np-post-header">
			                	      <span class="">
			                	        <a id="userNickName" class="np-user popClick ">${c.tblUser.userNickName}</a>
			                	      </span>
			                	      <c:if test="${c.tblComment != null}">
				                	      <span class="">
				                	        <a id="replyTo_userNickName" class="np-btn np-btn-reply reply">  ${c.tblComment.tblUser.userNickName}</a>
				                	      </span>
			                	      </c:if>
			                	      <span id="reply_datetime" class="np-time"><fmt:formatDate value="${c.commentCommentTimestamps}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
		                	        </div>
			                	    <div class="np-post-content" data-height="5">
			                	      <p id="replyContent">${c.commentContent}</p>
			                	    </div>
			                	    <div class="np-post-footer">
			                	      <a id="reply_link_${c.commentId}" class="np-btn np-btn-reply reply" onclick="replyBox_open('public_reply_${c.commentId}')" >回复</a>
			                	    </div>
			                	  </div>
			                	  
			                	  <ul class="children">
			                	  		<div id="public_reply_${c.commentId}" class="pop_reply np-reply-box np-reply-box-inline" style="display:none">
		
					                      <div class="textarea np-reply-box-content">
					                          <textarea name="reply_content_${c.commentId}" id="reply_content_${c.commentId}"></textarea>
					                      </div>
					                          
					                      <div class="commtSub" id="p_login_btn">
					                          <div class="np-reply-box-footer">
					                          		<a id="reply_btn_${c.commentId}" class="submit np-btn np-btn-submit" onclick="reply('${c.commentId}', $('#reply_content_${c.commentId}').val() )" >回复</a>
					                          </div>
					                      </div>
					                      
					                  </div>
					               </ul>
			                	  
			                	</li>
		                	</c:forEach>
		                	
		                	<div id="loadMore" class="np-load-more" style="display: block;">

			                    <span style="display: none;">暂无评论</span>
			                    <em style="display: none;" class="np-load-more-loading">没有更多了</em>
	
			                </div>
	                	
	                </ul>
	                
	            </div>
	        </div>
            
        </div>
        <div class="col-md-3">
        
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="page-header">
                        <h2>该视频常用标签</h2>
                    </div>
                    
            		<div class="bs-example">
            			<div class="row" >
            				<table>
            					<tr>
		            				<c:forEach items="${tblVideotagrelationList}" var="vtr" varStatus="status">
		            					<c:choose>
			            					<c:when test="${status.index % 4 == 0 }">
			            						<tr>
					            					<td>
						            					<h3 class=" col-md-2" style="height:30px;"><span class="label label-default" style="height:30px;">${vtr.tblTag.tagName}</span></h3>            				
						            				</td>
			            					</c:when>
			            					<c:when test="${status.index % 4 == 1 || status.index % 4 == 2 }">
				            					<td>
					            					<h3 class=" col-md-2" style="height:30px;"><span class="label label-default" style="height:30px;">${vtr.tblTag.tagName}</span></h3>            				
					            				</td>
				            				</c:when>
				            				<c:when test="${status.index % 4 == 3 }">
						            				<td>
						            					<h3 class=" col-md-2" style="height:30px;"><span class="label label-default" style="height:30px;">${vtr.tblTag.tagName}</span></h3>            				
						            				</td>
					            				</tr>
			            					</c:when>
		            					</c:choose>
		            				</c:forEach>
	            				</tr>
            				<table>
        				</div>
            	   </div>
                    
                </div>
            </div>
            
            <div class="panel panel-default">
	            <div class="panel-body">
	                <div class="page-header">
	                    <h2>相关视频推荐</h2>
	                </div>
	                <div>
		                <a href="#" class="thumbnail">
			                <img data-src="holder.js/100%x180" alt="100%x180" src="http://v.cnad.cn/vf3/qqgg1/2016.03.16/微软产品展示_20160317083847.JPG" style="height: 180px; width: 100%; display: block;">
			              </a>
			              <a href="#" class="thumbnail">
			                <img data-src="holder.js/100%x180" alt="100%x180" src="http://v.cnad.cn/vf3/qqgg1/2016.03.10/联想 Lenovo - U300S - 本色篇 杨丽萍_20160311085811.JPG" style="height: 180px; width: 100%; display: block;">
			              </a>
			              <a href="#" class="thumbnail">
			                <img data-src="holder.js/100%x180" alt="100%x180" src="http://v.cnad.cn/vf3/qqgg1/2016.03.09/【苹果】Apple 苹果创意广告_20160310083706.JPG" style="height: 180px; width: 100%; display: block;">
			              </a>
			              <a href="#" class="thumbnail">
			                <img data-src="holder.js/100%x180" alt="100%x180" src="http://v.cnad.cn/vf3/qqgg1/2016.03.07/【锤子手机】Smartisan T1 炫酷广告_20160308084521.JPG" style="height: 180px; width: 100%; display: block;">
			              </a>
	                </div>
	            </div>
	        </div>
	        
	        <div class="panel panel-default">
	            <div class="panel-body">
	                <div class="page-header">
	                    <h2>谁在看这部广告视频</h2>
	                </div>
	                
	                <ul class="media-list">
	                
			                <li class="media">
			                  <a class="media-left" href="#">
			                  		<img data-src="holder.js/64x64" alt="64x64" src="" data-holder-rendered="true" style="width: 64px; height: 64px;">
			                  </a>
			                  <div class="media-body">
			                    <h4 class="media-heading">Media heading</h4>
				                     <div class="media-body">
						                <h4 class="media-heading">徐周兴</h4>
						                <p>22分钟前</p>
						              </div>
			                  </div>
			              </li>
		              
			              <li class="media">
			                  <a class="media-left" href="#">
			                  		<img data-src="holder.js/64x64" alt="64x64" src="http://v.cnad.cn/vf3/qqgg1/2016.03.16/微软产品展示_20160317083847.JPG" data-holder-rendered="true" style="width: 64px; height: 64px;">
			                  </a>
			                  <div class="media-body">
			                    <h4 class="media-heading">Media heading</h4>
				                     <div class="media-body">
						                <h4 class="media-heading">李飞飞</h4>
						                <p>22分钟前</p>
						              </div>
			                  </div>
			              </li>
	              
			              <li class="media">
			                  <a class="media-left" href="#">
			                  		<img data-src="holder.js/64x64" alt="64x64" src="http://v.cnad.cn/vf3/qqgg1/2016.03.16/索尼相机在韩国地区的广告_20160317083840.JPG" data-holder-rendered="true" style="width: 64px; height: 64px;">
			                  </a>
			                  <div class="media-body">
			                    <h4 class="media-heading">Media heading</h4>
				                     <div class="media-body">
						                <h4 class="media-heading">马克扎克伯格</h4>
						                <p>22分钟前</p>
						              </div>
			                  </div>
			              </li>
		                
	               </ul>
	               
	                
	            </div>
	        </div>
	        
        </div>
        <div class="col-md-2"></div>
    </div>

</div>




<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	function timeConverter(UNIX_timestamp)
	{
		  var a = new Date(UNIX_timestamp);
		  var months = ['01','02','03','04','05','06','07','08','09','10','11','12'];
		  var day = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'];
		  var hour = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','55','53','54','55','56','57','58','59','60'];
		  var min = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','55','53','54','55','56','57','58','59','60'];
		  var sec = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','55','53','54','55','56','57','58','59','60'];
		  var year = a.getFullYear();
		  var month = months[a.getMonth()];
		  var day = day[a.getDate()];
		  var hour = hour[a.getHours()];
		  var min = min[a.getMinutes()];
		  var sec = sec[a.getSeconds()];
		  var time = year + '-' + month + '-' + day + ' ' + hour + ':' + min + ':' + sec ;
		  return time;
	}

	$(document).ready(function(){
	
	    $('#comment_btn').click(function(e) {
	    	
	    		var comment_videoId = $("#videoId").val();
		    	var comment_userId = $('#userId').val();
	    		var comment_content = $('#comment_content').val();
	    	
	    		$.ajax({
		            url: "ajax_add_videoPlayer_commentPublish" ,
		            data: {        
	    						comment_videoId : comment_videoId ,
	    						comment_userId : comment_userId,
	    						comment_content : encodeURI(encodeURI(comment_content))
							  },
		            type: "GET",
		            success: function (jsonString) {
								  
					    jsonObject = eval("(" + jsonString + ")");
					    var userAvatarLink = jsonObject.tblUser.userAvatarImgLink ;
					    var userNickName = jsonObject.tblUser.userNickName ;
					    var commentId = jsonObject.commentId;
					    var userCommentDatetime = timeConverter(jsonObject.commentCommentTimestamps) ;
					    var commentContent =jsonObject.commentContent ;
					    
						concatStr = "";
						concatStr += "<li class='np-post topAll' id=''>"
										+		 "<img class='np-avatar popClick' src='" + userAvatarLink + "' alt='头像'>"
										+		 "<div class='np-post-body'>"
											+		 "<div class='np-post-header'>"
												+		  "<span class=''>"
												+		  "<a id='userNickName' class='np-user popClick '>"  + userNickName + "</a>"
												+		 "</span>"
												+		 "<span id='reply_datetime' class='np-time'>"+ userCommentDatetime +"</span>"
											+		 "</div>"
											+		 "<div class='np-post-content' data-height='5'>"
												+		  "<p id='replyContent'>"+ commentContent +"</p>"
											+		 "</div>"
											+		 "<div class='np-post-footer'>"
												+		 "<a id='reply_link' class='np-btn np-btn-reply reply' onclick=\"replyBox_open( 'public_reply_"+ commentId +"')\">回复</a>"
											+		 "</div>"
										+		 "</div> "
												 +"<ul class='children'>"
						                	  		+"<div id='public_reply_"+ commentId +"' class='pop_reply np-reply-box np-reply-box-inline' style='display:none'>"
									                      +"<div class='textarea np-reply-box-content'>"
									                       +"<textarea name='reply_content_"+ commentId +"' id='reply_content_"+ commentId +"'></textarea>"
									                      +"</div>"
									                      +"<div class='commtSub' id='p_login_btn'>"
									                        +"<div class='np-reply-box-footer'>"
									                          +"<a id='reply_btn_"+ commentId +"' class='submit np-btn np-btn-submit' onclick=\"reply('"+ commentId +"', $('#reply_content_"+ commentId +"').val())\" >回复</a>"
									                         +"</div>"
									                      +"</div>"
								                  +"</div>"
								               +"</ul>"
										+		 "</li>";
						
	                    $("#comment_list_first").after(concatStr);	
		            	
		            }
		        })
	    	
	    });
	
	});
	
	
	function reply( commentId, reply_textarea_id)
	{
			var comment_videoId = $("#videoId").val();
	    	var comment_userId = $('#userId').val();
	    	var replyTo_commentId = commentId;
			var comment_content = reply_textarea_id;
		
			$.ajax({
	            url: "ajax_add_videoPlayer_replyPublish" ,
	            data: {        
							comment_videoId : comment_videoId ,
							comment_userId : comment_userId,
							replyTo_commentId : replyTo_commentId,
							comment_content : encodeURI(encodeURI(comment_content))
						  },
	            type: "GET",
	            success: function (jsonString) {
							  
							  	jsonObject = eval("(" + jsonString + ")");
							    var userAvatarLink = jsonObject.tblUser.userAvatarImgLink ;
							    var userNickName = jsonObject.tblUser.userNickName ;
							    var commentId = jsonObject.commentId;
							    var userCommentDatetime = timeConverter(jsonObject.commentCommentTimestamps) ;
							    var commentContent =jsonObject.commentContent ;
							    var replyTo_userNickName = jsonObject.tblComment.tblUser.userNickName ; 
							    
								concatStr = "";
								concatStr += "<li class='np-post topAll' id=''>"
												+		 "<img class='np-avatar popClick' src='" + userAvatarLink + "' alt='头像'>"
												+		 "<div class='np-post-body'>"
													+		 "<div class='np-post-header'>"
														+		  "<span class=''>"
														+		  "<a id='userNickName' class='np-user popClick '>"  + userNickName + "</a>"
														+		  "<a id='' class='np-btn np-btn-reply reply'></a>"
														+		  "<a id='userNickName' class='np-user popClick '>"  + replyTo_userNickName + "</a>"
														+		 "</span>"
														+		 "<span id='reply_datetime' class='np-time'>"+ userCommentDatetime +"</span>"
													+		 "</div>"
													+		 "<div class='np-post-content' data-height='5'>"
														+		  "<p id='replyContent'>"+ commentContent +"</p>"
													+		 "</div>"
													+		 "<div class='np-post-footer'>"
														+		 "<a id='reply_link' class='np-btn np-btn-reply reply' onclick=\"replyBox_open( 'public_reply_"+ commentId +"')\">回复</a>"
													+		 "</div>"
												+		 "</div> "
														 +"<ul class='children'>"
								                	  		+"<div id='public_reply_"+ commentId +"' class='pop_reply np-reply-box np-reply-box-inline' style='display:none'>"
											                      +"<div class='textarea np-reply-box-content'>"
											                       +"<textarea name='reply_content_"+ commentId +"' id='reply_content_"+ commentId +"'></textarea>"
											                      +"</div>"
											                      +"<div class='commtSub' id='p_login_btn'>"
											                        +"<div class='np-reply-box-footer'>"
											                          +"<a id='reply_btn_"+ commentId +"' class='submit np-btn np-btn-submit' onclick=\"reply('"+ commentId +"', $('#reply_content_"+ commentId +"').val())\" >回复</a>"
											                         +"</div>"
											                      +"</div>"
										                  +"</div>"
										               +"</ul>"
												+		 "</li>";
								
			                    $("#comment_list_first").after(concatStr);	
	            	
	            }
	        })
	}
	
	function replyBox_open( public_reply_div_id )
	{
		var display = $("#" + public_reply_div_id ).css('display');
		if( display == "block" ){
			$("#" + public_reply_div_id ).hide();
		}else{
			$("#" + public_reply_div_id ).show();
		}
	}

</script>

</div>
</body>
</html>