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
    <link href="css/fileinput.min.css" rel="stylesheet" type="text/css">
    <link href="css/app.css" rel="stylesheet" type="text/css">
<body class="">

<%@include file="header.jsp"%>		

<div id="main">
    <div class="container">
        <div class="row">
            <div class="col-xs-3" >
            		<%@include file="sideBar.jsp"%>		
            </div>
            <div class="col-xs-9 col-xs-9-remove">
                <div class=>
                    <div class="page-header">
                        <h1>上传视频</h1>
                    </div>
                    <div class=>



                            <div class="panel">
                                <div class="panel-body">

                                        <div class="panel panel-default">
                                            <div class="panel-heading">第一步-选择视频文件</div>
                                            <div class="panel-body">


                                                <div id="uploadVideoFile_div_step1" class="form-inline" >
                                                    <form id="uploadVideoFileForm" action="uploadVideoFile" method="post" enctype="multipart/form-data">
                                                            
                                                    		<input type="file" id="uploadVideoFile_loadVideoPath_btn" name="uploadVideoFile_loadVideoPath_btn" class="file center-block form-group" value="视频文件选择">
                                                    		<input type="submit" id="uploadVideoFile_confirmUpload_btn" name="uploadVideoFile_confirmUpload_btn" class="file center-block form-group" value="确认上传">
                                                    		<br />
                                                    		<div class="progress">
	            			                                    <div id="ajax_uploadVideoFile_progress_bar" class="progress-bar"aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
	            			                                        0.00%
	            			                                    </div>
	            			                                </div>
                                                            
                                                    </form>
                                                </div>


                                            </div>
                                        </div>



                                        <div class="panel panel-default">
                                            <div class="panel-heading">第二步-填写视频基本信息</div>
                                            <div class="panel-body">

                                                <form id="form_VideoProfile" action="videoInfoEdit" method="POST">

                                                    <div id="hidden_div" class="form-group" hidden>
                                                        <input id="videoId" name="videoId" class="form-group" type="text"  value="${video.videoId}">
                                                    </div>
                                                    <div id="videoCover_div" class="form-group" >
                                                        <div class="form-inline">
                                                            <label for="videoCover" class="form-group">视频封面</label>
                                                            <input type="file" id="uploadVideoFile" name="uploadVideoFile" class="file center-block" value="上传视频" />
                                                            /*<img id="videoCover" src="${video.videoCoverLink}" class="img-responsive"  class="form-group" alt="Responsive image">*/
                                                        </div>
                                                    </div>
                                                    <div id="videoName_div" class="form-group" >
                                                        <div class="form-inline">
                                                            <label for="videoName" class="form-group">标题</label>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <input id="videoName" name="videoName" class="form-group" type="text"  value="${video.videoName}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="form-inline">
                                                            <label for="introduction" class="form-group">简介</label>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <textarea class="form-group" id="videoDescription" name="videoDescription"  rows="3" value="${video.videoDescription}">${video.videoDescription}</textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-inline">
                                                        <label for="videoCategory" class="form-group">分类</label>
                                                        &nbsp;&nbsp;
                                                        <select class="form-group" id="videoCategory" name="videoCategory">
                                                            <option>${video.tblDatadictionary.dataDictionaryName}</option>
                                                            <c:forEach items="${videoCategoryList}" var="vcl">
                                                                <c:if test="${ vcl.dataDictionaryName != video.tblDatadictionary.dataDictionaryName }">
                                                                    <option>${vcl.dataDictionaryName}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group" >
                                                        <div>
                                                            <label for="tag" class="form-inline">标签</label>
                                                            &nbsp;&nbsp;
                                                            <input id="tag" name="tag" class="form-group" type="text">(多个标签用空格分隔)
                                                            <div class="form-inline">
                                                                <span class="form-group">常用的标签</span>
                                                                <div class="bs-example form-group">
                                                                    <c:forEach items="${videoTagList}" var="vtl" varStatus="status">
                                                                        <span class="label label-default">${vtl.tblTag.tagName}</span>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <button class="btn btn-primary center-block" id="updateVideoProfileBtn">确认上传</button>
                                                </form>
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

		var uploadCheck = false;
		var uploadComplete = false;
			
			
		 $(document).ready(function(){
			 
			 $("#uploadVideo_menu").attr("class" , "active");
			 
			$("#uploadVideoFile_confirmUpload_btn").click(function(){
				
				//设置图片上传标志
		        uploadCheck = true;
		        $("#progress_bar_div").show();
				
			});
			
			var getProgress = setInterval(function(){
		        if(uploadCheck){
		        
		            $.ajax({
		                type: "get",
		                dataType: "json",
		                url: "progress.json",
		                success: function(json) {
		            		var str="Hello world!";
		            		var percentString = JSON.stringify(json);
		        			var percentString_sub = percentString.substring(0,5);
		        			var percentString_temp = ( parseFloat( percentString_sub ) * 100).toString(); ;
		        			var percentString = percentString_temp.substring(0,4) + "%" ;
		                   /* if(data == "100%"){
		                        $("#ajax_uploadVideoFile_progress_bar").width(data);
		                        $("#ajax_uploadVideoFile_progress_bar").text(data);
		                        clearInterval(getProgress);
		                        uploadComplete = true;
		                        return true;
		                    }else{*/
		                        $("#ajax_uploadVideoFile_progress_bar").width(percentString);
		                        $("#ajax_uploadVideoFile_progress_bar").text(percentString);
		                        return false;
		                   /* }*/
		                },
		                error: function(err) {
		                    $("#ajax_uploadVideoFile_progress_bar").text("Error");
		                    alert("错误:"+err);
		                }
		            })
		        	
		        }
		    } , 100 );
		    
		})


</script>


</div>
</body>
</html>