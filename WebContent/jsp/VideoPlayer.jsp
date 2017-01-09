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
                                <button id="userName" value="${video.tblUser.userNickName}" style="display:none"></button>
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
			                            <textarea tabindex="1" autocomplete="off" name="content" accesskey="u" id="top_textarea" style="height: 60px; padding: 10px;"></textarea>
			                        </div>
			                        
			                        <div class="commtSub np-reply-box-footer" style="position:relative;display:block;height:40px" id="p_login_btn">
				                        <div class="submitBtn">
				                            <span class="subline">
												<a href="javascript:void(0)" class="np-btn np-btn-submit" id="top_post_btn" hidefocus="true">发表评论</a>
											</span>
				                        </div>
				                    </div>
				                    
			                    </div>
			                </div>
			            </div>
	                </div>
	                
	                <ul class="post-list np-comment-list">
	                	<li class="np-title-hot">热门评论</li>
	                	<li class="np-post   topAll  " id="">

	                	  <img class="np-avatar popClick" src="" alt="头像">

	                	  <div class="np-post-body">
	                	    <div class="np-post-header">
	                	      <span class="">
	                	        <a href="" class="np-user popClick ">用户昵称</a>
	                	      </span>
	                	      <span class="np-time" data="1483915021">回复时间</span></div>
	                	    <div class="np-post-content" data-height="5">
	                	      <p>回复内容</p>
	                	    </div>
	                	    <div class="np-post-footer">
	                	      <a href="javascript:void(0)" class="np-btn np-btn-reply reply">回复</a>
	                	    </div>
	                	  </div>
	                	  
	                	  <ul class="children"><div class="pop_reply np-reply-box np-reply-box-inline" id="public_reply">

			                      <div class="textarea np-reply-box-content">
			                          <textarea name="content" id=""></textarea>
			                      </div>
			                          
			                      <div class="commtSub" id="p_login_btn">
			                          <div class="np-reply-box-footer">
			                              <div class="np-reply-box-info" style="display: block;">
			                                  <span class="tips"></span>
			                              </div>
			                              <a href="" class="submit np-btn np-btn-submit" id="" hidefocus="true">回复</a>
			                          </div>
			                      </div>
			                      
			                  </div>
			               </ul>
	                	  
	                	</li>
	                	
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
	

	$(document).ready(function(){
	
	    $('#downloadBtn').click(function(e) {
	    		
		    	var urlStr_value = $('#downloadBtn').val();
	    		var userName_value = $('#userName').val();
	    	
	    		$.ajax({
		            url: "downloadVideo" ,
		            data: {        urlStr : encodeURI(encodeURI(urlStr_value)) ,
	    					  userName : encodeURI(encodeURI(userName_value))
	    							  },
		            type: "GET",
		            success: function (response) {
		                
		                 alert(response);
		            	
		            }
		        })
	    	
	    })
	    
	
	})

</script>

</div>
</body>
</html>