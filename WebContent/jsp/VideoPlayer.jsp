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

			<div class="ng-scope">
				<div class="navbar navbar-static-top ng-scope">
				    <div class="container">
				        <div class="navbar-header">
				            <a class="navbar-brand" href="#/"></a>
				        </div>
				        <ul class="nav navbar-nav pull-right ng-scope">
				            <li  class="ng-scope" style="">
					            <a href="videoSearchInit?videoCategoryID=1&page=1" class="icon-settings">视频库主页</a>
					        </li>
					        <li id="dropdown_index" class="dropdown">
				                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">个人设置<span class="caret"></span></a>
				                <ul class="dropdown-menu" role="menu" >
				                    <li>
				                        <a href="edit_personalProfile_load">个人信息编辑</a>
				                    </li>
				                    <li>
				                        <a href="authSettings_load">个人权限申请</a>
				                    </li>
				                    <li>
				                        <a href="authProcess_load">角色申请处理</a>
				                    </li>
				                </ul>
				            </li>
				        </ul>
				    </div>
				</div>
			</div>
			
			<div  class="ng-scope">
				<div class="horizontal-header ng-scope" ng-if="currentUser &amp;&amp; currentUser.isConsumer">
				    <div class="container ">
				    	<img class="pic-thumb pull-left" src="img/logo.jpg">
				        <h4 id="userName_label" class="ng-binding" value="${user.userNickName}">${user.userNickName}</h4>
				        <input type="hidden" id="userId" name="userId" value="${user.userId}"> 
				        <a href="logout"><button type="button" class="btn btn-default pull-right">退出</button></a>
				    </div>
				</div>
			</div>

<div id="main">

    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-5">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="page-header">
                        <h2>${video.videoName} <small>${video.tblDatadictionary.dataDictionaryName}</small></h2>
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
                                <dd>${video.tblUser.userNickName} (ID: ${video.tblUser.userId} )</dd>
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
			                            <textarea id="comment_content" name="comment_content" style="height: 60px; padding: 10px;"></textarea>
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
	                
	                <ul id="comment_list" class="post-list np-comment-list">
	                	<li id="comment_list_first" class="np-title-hot">热门评论</li>
	                	
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
				                	        <a id="replyTo_userNickName" class="np-user popClick ">回复给->${c.tblComment.tblUser.userNickName}</a>
				                	      </span>
			                	      </c:if>
			                	      <span id="reply_datetime" class="np-time">${c.commentCommentTimestamps}</span>
		                	        </div>
			                	    <div class="np-post-content" data-height="5">
			                	      <p id="replyContent">${c.commentContent}</p>
			                	    </div>
			                	    <div class="np-post-footer">
			                	      <a id="reply_link" class="np-btn np-btn-reply reply">回复</a>
			                	    </div>
			                	  </div>
			                	  
			                	  <ul class="children">
			                	  		<div id="public_reply" class="pop_reply np-reply-box np-reply-box-inline" style="display:none">
		
					                      <div class="textarea np-reply-box-content">
					                          <textarea name="reply_content_${c.commentId}" id="reply_content_${c.commentId}"></textarea>
					                      </div>
					                          
					                      <div class="commtSub" id="p_login_btn">
					                          <div class="np-reply-box-footer">
					                          		<a id="reply_btn_${c.commentId}" class="submit np-btn np-btn-submit" onclick="reply(${c.commentId}, reply_content_${c.commentId})" >回复</a>
					                          </div>
					                      </div>
					                      
					                  </div>
					               </ul>
			                	  
			                	</li>
		                	</c:foreach>
	                	
	                </ul>
	                
	            </div>
	        </div>
            
        </div>
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="page-header">
                        <h2>相关视频推荐</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>

</div>

<footer>
    <div class="container">
        <ul class="nav">
            <li><a href="/contact" target="_blank">Contact Us</a></li>
            <li><a href="/terms-caremarketplace" target="_blank">Terms - Care Marketplace</a></li>
            <li><a href="/faq-caremarketplace" target="_blank">FAQs - Care Marketplace</a></li>
        </ul>
    </div>
</footer>


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
		
		$("#reply_link").click(function(e) {
			var display = $("#public_reply").css('display');
			if( display == "block" ){
				$("#public_reply").hide();
			}else{
				$("#public_reply").show();
			}
		});
	
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
												+		 "<a id='reply_link' class='np-btn np-btn-reply reply'>回复</a>"
											+		 "</div>"
										+		 "</div> "
										+		 "</li>";
						
	                    $("#comment_list_first").after(concatStr);	
		            	
		            }
		        })
	    	
	    });
	
	})
	
	
	function replay( var commentId , var reply_textarea_id)
	{
			var comment_videoId = $("#videoId").val();
	    	var comment_userId = $('#userId').val();
	    	var replyTo_commentId = commentId;
			var comment_content = $('#reply_textarea_id').val();
		
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
							  
				   alert("yesjjjjjjj");
	            	
	            }
	        })
	}

</script>

</div>
</body>
</html>