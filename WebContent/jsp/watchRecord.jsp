<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html  >
<head>
    <style type="text/css">@charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide:not(.ng-hide-animate){display:none !important;}ng\:form{display:block;}.ng-animate-shim{visibility:hidden;}.ng-anchor{position:absolute;}</style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ad</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    <link rel="shortcut icon" href="/public/images/favicons/favicon.ico">

    <link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/app.css" rel="stylesheet" type="text/css">
<body class="ng-scope">

<%@include file="header.jsp"%>

<div id="main">
    <div class="container">
        <div class="row">
            <div class="col-xs-3 ng-scope" >
                <%@include file="sideBar.jsp"%>
            </div>
            <div class="col-xs-9 col-xs-9-remove">
                <div class="ng-scope">
                    <div class="page-header ng-scope">
                        <h1>视频观看历史纪录</h1>
                    </div>
                    <div class="ng-scope">
                    
                    	<div class="row">
                    		<div class="col-md-1"></div>
                    		<div class="col-md-11">
                    		
		                    		<c:forEach items="${tblUservideorelationList_watchRecord}" var="tm">
		                        	
			                    		<div class="row">
			                    	
						                    	<div class="page-header">
							                        <h3>${tm.key}</h3>
							                    </div>
					                    	
							                    <c:forEach items="${tm.value}" var="uvr" varStatus="status">
							                    
								                    <c:choose>
						                    			<c:when test="${status.index % 4 == 0}">
						                    				
							                                <div class="row">
							                                  
							                                    <div class="col-md-3">
							                                        <div class="thumbnail">
							                                            <img data-src="holder.js/300x300" style="width: 240px; height: 140px;" class="img-responsive" src="${uvr.tblVideo.videoCoverLink}">
							                                            <div class="caption">
							                                                <h3 style="overflow:hidden;white-space:nowrap">${uvr.tblVideo.videoName}</h3>
							                                            </div>
							                                        </div>
							                                    </div>
						                                    
					                                	</c:when>
							                    		<c:when test="${status.index % 4 == 1 || status.index % 4 ==2 }">
							                    				
									                    		<div class="col-md-3">
								                                    <div class="thumbnail">
								                                        <img data-src="holder.js/300x300" style="width: 240px; height: 140px;" class="img-responsive" src="${uvr.tblVideo.videoCoverLink}">
								                                        <div class="caption">
								                                            <h3 style="overflow:hidden;white-space:nowrap">${uvr.tblVideo.videoName}</h3>
								                                        </div>
								                                    </div>
								                                </div>
							                    		
							                    		</c:when>
							                    		<c:when test="${status.index % 4 == 3}">
							                    		
								                    		<div class="col-md-3">
							                                    <div class="thumbnail">
							                                        <img data-src="holder.js/300x300" style="width: 240px; height: 140px;" class="img-responsive" src="${uvr.tblVideo.videoCoverLink}">
							                                        <div class="caption">
							                                            <h3 style="overflow:hidden;white-space:nowrap">${uvr.tblVideo.videoName}</h3>
							                                        </div>
							                                    </div>
							                                </div>
							                                
							                             </div>
						                             </c:when>
							                    	</c:choose>
						                        </c:forEach>
						                    
						                   </div>
			                    		
			                    	</c:forEach>
                    		
                    		</div>
                    	</div>
                    
                    	
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<script type="text/javascript">

    function formValidation_check(videoName, operateDateStart, operateDateEnd){
        if(operateDateStart == "" || operateDateEnd == "" )
        {
            alert("日期信息未填写完整！");
            return false;
        }
        if(operateDateStart > operateDateEnd){
            alert("起始日期不可在终止日期之后！");
            return false;
        }

        return true;
    }

    $(document).ready(function(){

        $("#personalVideoManage_menu").attr("class" , "active");

        $("#videosSearchBtn").click(function(){

            var videoName = $("#videos_videoName").val() ;
            var uploadDateStart = $("#videos_uploadDateStart").val() ;
            var uploadDateEnd = $("#videos_uploadDateEnd").val() ;

            var check_result = formValidation_check(videoName, uploadDateStart, uploadDateEnd);
            if( ckeck_result ){

                $.ajax({
                    url:"ajax_search_personalVideoManagement_videos",
                    data:{
                        videoName : videoName,
                        uploadDateStart:uploadDateStart,
                        uploadDateEnd:uploadDateEnd
                    },
                    type:"GET",
                    success:function(jsonString){

                        jsonObject = eval("(" + jsonString + ")");
                        jsonObjectLength = jsonObject.length;
                        var concatStr = "";
                        var concatStr_pagination = "";
                        for(var i = 0 ; i < jsonObjectLength ; i++)
                        {
                            concatStr += 	"<tr>"
                                    + 			"<td>" + "<img class='img-rounded' src='" + jsonObject[i].video.videoCoverLink + "' data-holder-rendered='true' style='width: 50px; height: 50px;'>" + "</td>"
                                    + 			"<td>" + jsonObject[i].video.videoName + "</td>"
                                    + 			"<td>" + jsonObject[i].opeatation_dateTime + "</td>"
                                    + 			"<td>" + jsonObject[i].numOfPlay + "</td>"
                                    + 			"<td>" + jsonObject[i].numOfComment + "</td>"
                                    + 			"<td><a href=''>编辑</a>/<a href=''>删除</a></td>"
                                    +		 "</tr>";

                            concatStr_pagination += "<li><a >1</a></li>";
                        }

                        if( jsonObjectLength == 0 )
                        {
                            concatStr += 	"<tr>"
                                    +     		"<td colspan=\"7\" style=\"text-align:center;vertical-align:middle;\"> 无符合条件的查询结果 </td>"
                                    +  	"</tr>";

                        }
                        $("#myVideos_Tbody").html("");
                        $("#myVideos_Tbody").html(concatStr);
                        $("#pagination_upload").html("");
                        $("#pagination_upload").html(concatStr_pagination);

                    }
                })

            }else{

            }


        });


        $("#favoriteSearchBtn").click(function(){

            var videoName = $("#favorite_videoName").val() ;
            var uploadDateStart = $("#favorite_uploadDateStart").val() ;
            var uploadDateEnd = $("#favorite_uploadDateEnd").val() ;

            var check_result = formValidation_check(videoName, uploadDateStart, uploadDateEnd);
            if( ckeck_result ){

                $.ajax({
                    url:"ajax_search_personalVideoManagement_favorite",
                    data:{
                        videoName : videoName,
                        uploadDateStart:uploadDateStart,
                        uploadDateEnd:uploadDateEnd
                    },
                    type:"GET",
                    success:function(jsonString){

                        jsonObject = eval("(" + jsonString + ")");
                        jsonObjectLength = jsonObject.length;
                        var concatStr = "";
                        var concatStr_pagination = "";
                        for(var i = 0 ; i < jsonObjectLength ; i++)
                        {
                            concatStr += 	"<tr>"
                                    + 			"<td>" + "<img class='img-rounded' src='" + jsonObject[i].video.videoCoverLink + "' data-holder-rendered='true' style='width: 50px; height: 50px;'>" + "</td>"
                                    + 			"<td>" + jsonObject[i].video.videoName + "</td>"
                                    + 			"<td>" + jsonObject[i].opeatation_dateTime + "</td>"
                                    + 			"<td>" + jsonObject[i].numOfPlay + "</td>"
                                    + 			"<td>" + jsonObject[i].numOfComment + "</td>"
                                    + 			"<td>" + jsonObject[i].video.tblUser.userNickName + "</td>"
                                    + 			"<td><a href=''>编辑</a></td>"
                                    +		 "</tr>";
                            concatStr_pagination += "<li><a >1</a></li>";
                        }

                        if( jsonObjectLength == 0 )
                        {
                            concatStr += 	"<tr>"
                                    +     		"<td colspan=\"7\" style=\"text-align:center;vertical-align:middle;\"> 无符合条件的查询结果 </td>"
                                    +  	"</tr>";
                        }
                        $("#favorite_Tbody").html("");
                        $("#favorite_Tbody").html(concatStr);

                        $("#pagination_favorite").html("");
                        $("#pagination_favorite").html(concatStr_pagination);

                    }
                })

            }else{

            }

        });


    });


</script>


</div>
</body>
</html>