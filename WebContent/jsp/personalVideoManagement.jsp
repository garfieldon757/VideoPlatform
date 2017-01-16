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
                        <h1>个人视频管理</h1>
                    </div>
                    <div class="ng-scope">
                        <ul id="myTab" class="nav nav-tabs" role="tablist">
                            <li role="presentation"  
                    		<c:choose>
	                			<c:when test="${defualt_tab == 'videos' }"> class="active" </c:when>
	                		</c:choose>
	                		>
                                <a href="#videos" id="videos-tab" name="videos-tab" role="tab" data-toggle="tab">我上传的</a>
                            </li>
                            <li role="presentation" 
                    		<c:choose>
	                			<c:when test="${defualt_tab == 'favorite' }"> class="active" </c:when>
	                		</c:choose>
	                		>
                                <a href="#favorite"  id="favorite-tab" name="favorite-tab"  role="tab" data-toggle="tab">我收藏的</a>
                            </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div role="tabpanel"  
                    		<c:choose>
                    			<c:when test="${defualt_tab == 'videos' }"> class="tab-pane active in" </c:when>
                    			<c:otherwise> class="tab-pane fade " </c:otherwise>
                    		</c:choose>
                           id="videos" name="videos">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                    
	                                	<div class="row">
	                                		<div class="col-md-8">
	                                		
	                                			<div class="form-group row">
	                                              <label for="videoName" class="col-sm-2 control-label">视频名称</label>
	                                              <div class="col-sm-8">
	                                                <input type="text" class="form-control" id="videos_videoName" name="videos_videoName" placeholder="输入视频名称">
	                                              </div>
	                                            </div>
	                                            <div class="form-group row">
	                                              <label for="uploadDate" class="col-sm-2 control-label">上传时间</label>
	                                              <div class="col-sm-10">
	                                              	<input type="date" id="videos_uploadDateStart"  name="videos_uploadDateStart" style="float:left"/>
	                                              	<h3 style="float:left">_</h3>
	                                              	<input type="date" id="videos_uploadDateEnd" name="videos_uploadDateEnd" style="float:left"/>
	                                              </div>
	                                            </div>
	                                          </div>
	                                         <div class="col-md-4">
	                                         		<div class="form-group">
	                                                  <div class="col-sm-offset-2 col-sm-10">
	                                                    <button type="submit" id="videosSearchBtn" class="btn btn-primary btn-lg" >查询</button>
	                                                  </div>
	                                                </div>
	                                         </div>
	                                         
	                                	</div>

                                    <table class="table table-striped">
                                    <thead>
                                      <tr>
	                                      <th>视频封面</th>
	                                      <th>名称</th>
	                                      <th>上传时间</th>
	                                      <th>播放数</th>
	                                      <th>评论数</th>
	                                      <th>操作</th>
                                      </tr>
                                    </thead>
                                    <tbody id="myVideos_Tbody">
                                      <tr>
                                      	<td colspan="6" style="text-align:center;vertical-align:middle;"> 尚未查询结果 </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  
                                  <div style="text-align: center">
	          	                    <nav>
	          		                    <ul class="pagination" id="pagination_upload">
	          		                    
	          		                    	
	          		                        
	          		                    </ul>
	          		                </nav>
	          		             </div>
                                  
                                  <br />
                                  <div class="row">
	                            		<a href="edit_personalVideoManagement_load?tab=videos"><button id="upLoadVideoBtn" class="btn btn-primary btn-lg center-block" >上传新视频</button></a>
	                            </div>
                                        
                                    </div>
                                </div>
                            </div>
                            
                            <div role="tabpanel" 
                    		<c:choose>
	                			<c:when test="${defualt_tab == 'favorite' }"> class="tab-pane active in" </c:when>
	                			<c:otherwise> class="tab-pane fade " </c:otherwise>
	                		</c:choose>
                            id="favorite" name="favorite">
                                <div class="panel panel-default">
                                    <div class="panel-body">

	                                	<div class="row">
	                                		<div class="col-md-8">
	                                		
	                                			<div class="form-group row">
	                                              <label for="videoName" class="col-sm-2 control-label">视频名称</label>
	                                              <div class="col-sm-8">
	                                                <input type="text" class="form-control" id="favorite_videoName" name="favorite_videoName" placeholder="输入视频名称">
	                                              </div>
	                                            </div>
	                                            <div class="form-group row">
	                                              <label for="uploadDate" class="col-sm-2 control-label">上传时间</label>
	                                              <div class="col-sm-10">
	                                              	<input type="date" id="favorite_uploadDateStart"  name="favorite_uploadDateStart" style="float:left"/>
	                                              	<h3 style="float:left">_</h3>
	                                              	<input type="date" id="favorite_uploadDateEnd" name="favorite_uploadDateEnd" style="float:left"/>
	                                              </div>
	                                            </div>
	                                          </div>
	                                         <div class="col-md-4">
	                                         		<div class="form-group">
	                                                  <div class="col-sm-offset-2 col-sm-10">
	                                                    <button type="submit" id="favoriteSearchBtn" class="btn btn-primary btn-lg" >查询</button>
	                                                  </div>
	                                                </div>
	                                         </div>
	                                         
	                                	</div>
                                    
                                    <table class="table table-striped">
                                    <thead>
                                      <tr>
                                        <th>视频封面</th>
                                        <th>名称</th>
                                        <th>收藏时间</th>
                                        <th>播放数</th>
                                        <th>评论数</th>
                                        <th>上传者</th>
                                        <th>操作</th>
                                      </tr>
                                    </thead>
                                    <tbody id="favorite_Tbody">
                                      <tr>
                                        <td colspan="7" style="text-align:center;vertical-align:middle;"> 尚未查询结果 </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  
                                  <div style="text-align: center">
	          	                    <nav>
	          		                    <ul class="pagination" id="pagination_favorite">
	          		                    
	          		                    	
	          		                        
	          		                    </ul>
	          		                </nav>
	          		             </div>
                                        
                                    </div>
                                </div>
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
	    	
	    	if(check_result ){
	    		
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
	    	
	    	if(  check_result ){
	    		
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