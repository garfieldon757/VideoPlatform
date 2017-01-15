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
 
</head>
<body class="ng-scope">

<%@include file="header.jsp"%>	

        <div id="main">

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-2">
                    <div class="ng-scope">
                        <div class="page-header">
                            <h2>广告视频库分类</h2>
                        </div>
                        <hr style="margin-top: 0;">
                        <ul class="nav nav-stacked side-nav">
                            <c:forEach items="${videoCategoryList}" var="vc">
                            	<c:if test="${ vc.videoCategoryId == videoCategoryID }">
                                	<li  class="active">
                                </c:if>
                                <c:if test="${ vc.videoCategoryId != videoCategoryID }">
	                            	<li  class="">
	                            </c:if>
	                                    <a href="${vc.videoCategoryName}">${vc.videoCategoryName}</a>
	                                </li>
                           </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            search
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-body">
                        
		                    <c:forEach items="${videoList}" var="v" varStatus="status" begin="1" end="12"> 
		                    
			                    	<c:choose>
				                    		<c:when test="${status.index % 4 == 1}">
				                    		
				                    		<div class="row">
				                    		
					                    		<div class="col-md-3">
					                                <div class="thumbnail">
					                                    <img data-src="holder.js/300x300" style="width: 240px; height: 140px;" class="img-responsive" src="${v.videoCoverLink}">
					                                    <div class="caption">
					                                        <h3 style="overflow:hidden;white-space:nowrap">${v.videoName}</h3>
					                                        <p>
					                                            <a href="videoPlay?videoID=${v.videoId}" class="btn btn-primary">视频播放</a>
					                                            <a href="loadImageProcess4Trial_frameSegmentation?videoID=${v.videoId}" class="btn btn-default">视频分析</a>
					                                        </p>
					                                    </div>
					                                </div>
					                            </div>
				                    		
				                    		</c:when>
				                    		
				                    		<c:when test="${status.index % 4 == 2 || status.index % 4 ==3 }">
				                    		
						                    		<div class="col-md-3">
						                                <div class="thumbnail">
						                                    <img data-src="holder.js/300x300" style="width: 240px; height: 140px;" class="img-responsive" src="${v.videoCoverLink}">
						                                    <div class="caption">
						                                        <h3 style="overflow:hidden;white-space:nowrap">${v.videoName}</h3>
						                                        <p>
						                                            <a href="videoPlay?videoID=${v.videoId}" class="btn btn-primary">视频播放</a>
						                                            <a href="loadImageProcess4Trial_keyFrameSegmentation?videoID=${v.videoId}" class="btn btn-default">视频分析</a>
						                                        </p>
						                                    </div>
						                                </div>
						                            </div>
				                    		
				                    		</c:when>
				                    		
				                    		<c:when test="${status.index % 4 == 0}">
				                    		
						                    		<div class="col-md-3">
						                                <div class="thumbnail">
						                                    <img data-src="holder.js/300x300" style="width: 240px; height: 140px;" class="img-responsive" src="${v.videoCoverLink}">
						                                    <div class="caption">
						                                        <h3 style="overflow:hidden;white-space:nowrap">${v.videoName}</h3>
						                                        <p>
						                                            <a href="videoPlay?videoID=${v.videoId}" class="btn btn-primary">视频播放</a>
						                                            <a href="loadImageProcess4Trial_keyFrameSegmentation?videoID=${v.videoId}" class="btn btn-default">视频分析</a>
						                                        </p>
						                                    </div>
						                                </div>
						                            </div>
				                    		
					                    		</div>
				                    		
				                    		</c:when>
			                    	</c:choose>
	                    	
		                    	</c:forEach>
	                   

                        </div>
                    </div>
                    
                    <div style="text-align: center">
	                    <nav>
		                    <ul class="pagination">
		                    
		                    	<fmt:formatNumber value="${ videoListSize / 16}" pattern="0" var="totalPageNum"></fmt:formatNumber>
		                    	<%@include file="pagination.jsp"%>	
		                        
		                    </ul>
		                </nav>
		             </div>
                    
                </div>
                <div class="col-md-1"></div>
            </div>

        </div>

        <%@include file="footer.jsp"%>	

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

</body>
</html>