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

<div class="ng-scope">
    <div class="navbar navbar-static-top ng-scope">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#/"></a>
            </div>
            <ul class="nav navbar-nav pull-right ng-scope">
                <li  class="ng-scope" style="">
                    <c:if test="${ videoLibMainPageLink == 1 }">
                        <a href="videoSearchInit?videoCategoryID=1&page=1" class="icon-settings">视频库主页</a>
                    </c:if>
                </li>
                <li id="dropdown_index" class="dropdown">
                    <c:if test="${ personalProfileDropDownList == 1 }">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">个人设置<span class="caret"></span></a>
                    </c:if>
                    <ul class="dropdown-menu" role="menu" >
                        <li>
                            <c:if test="${ personalProfileEditLink == 1 }">
                                <a href="edit_personalProfile_load">个人信息编辑</a>
                            </c:if>
                        </li>
                        <li>
                        	<c:if test="${ user.tblRole.roleId == 1 or user.tblRole.roleId == 2 and authSettingsLink == 1 }">
                                <a href="authSettings_load">个人权限申请</a>
                            </c:if> 
                        </li>
                        <li>
                            <c:if test="${ authProcessLink == 1 }">
                                <a href="authProcess_load">角色申请处理</a>
                            </c:if>
                        </li>
                        <li>
                            <c:if test="${ monitorLink == 1 }">
                                <a href="monitor_load">后台运行监控台</a>
                            </c:if>
                        </li>
                        <li>
                            <c:if test="${ logMonitorLink == 1 }">
                                <a href="logSearch_load">日志检索</a>
                            </c:if>
                        </li>

                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<div ng-include="'/public/app/templates/horizontal-header.html'" class="ng-scope"><!-- ngIf: currentUser && currentUser.isConsumer -->
    <div class="horizontal-header ng-scope" ng-if="currentUser &amp;&amp; currentUser.isConsumer">
        <div class="container ">
            <img class="pic-thumb pull-left" src="img/logo.jpg">
            <h4 id="userName" class="ng-binding" value="${user.userNickName}">${user.userNickName}</h4>
            <button type="button" class="btn btn-default pull-right" class="logout" ><a href="logout">退出</a></button>
        </div>
    </div>
</div>

<div id="main">
    <div class="container">
        <div class="row">
            <div class="col-xs-3 ng-scope" >
                <div ng-show="isActive('/settings')" class="ng-scope" style="">
                    <div class="page-header">
                        <h2>设置</h2>
                    </div>
                    <hr style="margin-top: 0;">
                    <ul class="nav nav-stacked side-nav">

                        <c:if test="${ personalProfileEditLink == 1 }">
                            <li  class="active">
                                <a href="edit_personalProfile_load">个人信息编辑</a>
                            </li>
                        </c:if>
                        <c:if test="${ user.tblRole.roleId == 1 or user.tblRole.roleId == 2 and authSettingsLink == 1 }">
                            <li >
                                <a href="authSettings_load">个人权限申请</a>
                            </li>
                        </c:if>
                        <c:if test="${ user.tblRole.roleId == 3 and authProcessLink == 1 }">
                            <li >
                                <a href="authProcess_load">角色申请处理</a>
                            </li>
                        </c:if>
                        <c:if test="${ monitorLink == 1 }">
                            <li >
                                <a href="monitor_load">后台运行监控台</a>
                            </li>
                        </c:if>
                        <c:if test="${ logMonitorLink == 1 }">
                            <li >
                                <a href="logSearch_load">日志检索</a>
                            </li>
                        </c:if>

                    </ul>
                </div>
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

    	$("#videosSearchBtn").click(function(){
    		
    		var videoName = $("#videos_videoName").val() ;
	    	var uploadDateStart = $("#videos_uploadDateStart").val() ;
	    	var uploadDateEnd = $("#videos_uploadDateEnd").val() ;
	    	
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
					}
					
					$("#myVideos_Tbody").html("");
					$("#myVideos_Tbody").html(concatStr);
					
			}
			})
    		
    	});
    	
    	
    	$("#favoriteSearchBtn").click(function(){
    		
    		var videoName = $("#favorite_videoName").val() ;
	    	var uploadDateStart = $("#favorite_uploadDateStart").val() ;
	    	var uploadDateEnd = $("#favorite_uploadDateEnd").val() ;
	    	
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
					}
					
					$("#favorite_Tbody").html("");
					$("#favorite_Tbody").html(concatStr);
					
			}
			})
    		
    	});
    	
    	
    });
    

</script>


</div>
</body>
</html>