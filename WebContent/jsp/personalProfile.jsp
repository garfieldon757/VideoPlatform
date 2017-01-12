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
    <!-- build:css(.) /public/css/app.min.css -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/app.css" rel="stylesheet" type="text/css">
    <!-- endbuild -->
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
                        <h1>个人信息编辑</h1>
                    </div>
                    <div class="ng-scope">
                        <ul id="myTab" class="nav nav-tabs" role="tablist">
                            <li role="presentation"  
                    		<c:choose>
	                			<c:when test="${defualt_tab == 'baseProfile' }"> class="active" </c:when>
	                		</c:choose>
	                		>
                                <a href="#baseProfile" id="baseProfile-tab" name="baseProfile-tab" role="tab" data-toggle="tab">基本信息</a>
                            </li>
                            <li role="presentation" 
                    		<c:choose>
	                			<c:when test="${defualt_tab == 'baseAvatar' }"> class="active" </c:when>
	                		</c:choose>
	                		>
                                <a href="#baseAvatar"  id="baseAvatar-tab" name="baseAvatar-tab"  role="tab" data-toggle="tab">上传头像</a>
                            </li>
                            <li role="presentation" 
                    		<c:choose>
	                			<c:when test="${defualt_tab == 'security' }"> class="active" </c:when>
	                		</c:choose>
	                		>
                                <a href="#security"  id="security-tab" name="security-tab"  role="tab" data-toggle="tab">安全设置</a>
                            </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div role="tabpanel"  
                    		<c:choose>
                    			<c:when test="${defualt_tab == 'baseProfile' }"> class="tab-pane active in" </c:when>
                    			<c:otherwise> class="tab-pane fade " </c:otherwise>
                    		</c:choose>
                           id="baseProfile" name="baseProfile">
                                <div class="panel panel-default">
                                    <div class="panel-body">

                                        <form id="form_baseProfile" action="edit_personalProfile_baseProfile">

                                            <div class="ng-scope">
                                                <div class="panel ng-scope">
                                                    <div class="panel-body">
                                                        <div id="userName_div" class="form-group" >
                                                            <div class="form-inline">
                                                                <label for="userName" class="form-inline">昵称</label>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                                <input id="userName" class="form-control" type="text" name="userNickName" value="${user.userNickName}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="form-inline">
                                                                <label for="sex" class="form-inline">性别</label>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                                		<c:if test="${user.userSex == '男' }">
                                                                男：<input type="radio" checked="checked" name="userSex" value="男" />
                                                                女：<input type="radio" name="userSex" value="女" />
                                                                		</c:if>
                                                                		<c:if test="${user.userSex == '女' }">
                                                                		  男：<input type="radio"  name="userSex" value="男" />
                                                                女：<input type="radio" checked="checked" name="userSex" value="女" />
                                                                		</c:if>
                                                            </div>
                                                        </div>
                                                        <div class="form-group" >
                                                            <div class="form-inline">
                                                                <label for="birthDate" class="form-inline">生日</label>
                                                                &nbsp;&nbsp;
                                                                <input type="date"  name="userBirthDate" value="${user.userBirthDate}" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group" >
                                                            <div class="form-inline">
                                                                <label for="birthPlace" class="form-inline">出生地</label>
                                                                &nbsp;&nbsp;
                                                                <input type="text" id="birthPlace" name="userBirthPlace"  value="${user.userBirthPlace}" >
                                                            </div>
                                                        </div>
                                                        <div class="form-group" >
                                                            <div class="form-inline">
                                                                <label for="roleName">验证码</label>
                                                                &nbsp;&nbsp;
                                                                <input id="roleName" class="form-control" type="text" name="roleName"  value="xxx" disabled="true">
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>

                                        </form>
                                        <button class="btn btn-primary" onclick="before_submit_baseProfile()">保存</button>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" 
                    		<c:choose>
	                			<c:when test="${defualt_tab == 'baseAvatar' }"> class="tab-pane active in" </c:when>
	                			<c:otherwise> class="tab-pane fade " </c:otherwise>
	                		</c:choose>
                        	id="baseAvatar" name="baseAvatar">
                                <div class="panel panel-default">
                                    <div class="panel-body">

	                                    <form id="uploadAvatarForm" action="uploadAvatar" method="post" enctype="multipart/form-data">
			                                	<input type="file" id="imgFile" name="imgFile" accept="image/jpeg,image/jpg,image/png"/><br> 
			                                	<img src="${user.userAvatarImgLink}" id="imgPreview" style="width:200px; height:200px" ><br>
			                                	<div class="progress">
				                                    <div id="progress_bar" class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
				                                        60%
				                                    </div>
				                                </div>
				                                <input id="submit-btn" type="submit" value="上传" />
		                                </form>
		                              
                                    </div>
                                </div>
                            </div>
                            
                            <div role="tabpanel" id="xx" name="xx">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                    	<form id="uploadVideoForm" method="post" action="uploadVideoFile" enctype="multipart/form-data">
		                                	<input type="file" id="uploadVideoFile" name="uploadVideoFile" /><br> 
		                                	<div class="progress">
			                                    <div id="ajax_uploadVideoFile_progress_bar" class="progress-bar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
			                                        60%
			                                    </div>
			                                </div>
			                                <input type="submit"  id="ajax_uploadVideoFile_submit_btn" value="上传视频文件" />
	                                	</form>
		                              
                                    </div>
                                </div>
                            </div>
                            
                            <div role="tabpanel" 
                    		<c:choose>
	                			<c:when test="${defualt_tab == 'security' }"> class="tab-pane active in" </c:when>
	                			<c:otherwise> class="tab-pane fade " </c:otherwise>
	                		</c:choose>
                            id="security" name="security">
                                <div class="panel panel-default">
                                    <div class="panel-body">

                                        <form id="form_security" action="edit_personalProfile_security">

                                            <div class="ng-scope">
                                                <div class="panel ng-scope">
                                                    <div class="panel-body">
                                                        <div id="email_div" class="form-group" >
                                                            <div class="form-inline">
                                                                <label for="email" class="form-inline">绑定邮箱</label>
                                                                &nbsp;&nbsp;
                                                                <input id="email" class="form-control" type="text" name="userEmail" value="${user.userEmail}">
                                                            </div>
                                                        </div>
                                                        <div id="phoneNumber_div" class="form-group" >
                                                            <div class="form-inline">
                                                                <label for="phoneNumber" class="form-inline">绑定手机</label>
                                                                &nbsp;&nbsp;
                                                                <input id="phoneNumber" class="form-control" type="text" name="userPhoneNumber" value="${user.userPhoneNumber}">
                                                            </div>
                                                        </div>
                                                        <div id="password_div" class="form-group" >
                                                            <div class="form-inline">
                                                                <label for="userName" class="form-inline">登陆密码</label>
                                                                &nbsp;&nbsp;
                                                                <input id="password" class="form-control" type="text" name="userPassword" value="${user.userPassword}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>

                                        </form>
                                        <button class="btn btn-primary" onclick="before_submit_security()">保存</button>

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
<script src="js/jqueryForm.js" type="text/javascript"></script>


<script type="text/javascript">


	var uploadCheck = false;
	var uploadComplete = false;
	
	//建立一個可存取到該file的url
	function getObjectURL(file) {
		var url = null ; 
		if (window.createObjectURL!=undefined) { // basic
			url = window.createObjectURL(file) ;
		} else if (window.URL!=undefined) { // mozilla(firefox)
			url = window.URL.createObjectURL(file) ;
		} else if (window.webkitURL!=undefined) { // webkit or chrome
			url = window.webkitURL.createObjectURL(file) ;
		}
		return url ;
	}
	
	

    $(document).ready(function(){


//    	$("#uploadVideoFile").change(function(){
//    		var objUrl = getObjectURL(this.files[0]) ;
//    		console.log("objUrl = "+objUrl) ;
////    		if (objUrl) {
////    			$("#imgPreview").attr("src", objUrl) ;
////    		}
//    		
//    		//设置图片上传标志
//    	      uploadCheck = true;
//    	      
//    	      
//    	      
////    	       var $this =  $(this);
////    	       $this.uploadFile("uploadAvatar",function(data){
////    	    	   $.ajaxSetup({async: false});
////    	    	   jQuery.ajax({
////    	    		   beforeSend: function() {
//////    	    		   		//图片格式监测
//////    	    		   		if(data.Abort){
//////    	    		   			$.box(data.typeError);
//////    	    		   			return false;
//////    	    		   		}
//////    	    		   		//图片大小监测
//////    	    		   		if(data.isOverLimit){
//////    	    		   			$.box(data.SizeLimit);
//////    	    		   			return false;
//////    	    		   		}
////    	    		   		alert("dsafasfsfsfafsfds");
////    	    		   		status.empty();
////    	    		   		var percentVal = "0%";
////    	    		   		percent.html(percentVal);
////    	    		   		$("progress_bar").width(percentVal);
////    	    	   		},
////    	    		   success: function() {
//////    	    	   			$("progress_bar").text("");
//////    	    	   			var $inpCont = $(".inpCont");
//////    	    	   			$inpCont.append("<p><span id='pic"+picIndex+"' title='' class='picUrl'></span><a  class='png' href='javascript:void(0);' itle='移除'></a></p>");
//////    	    	   			$inpCont.find("p span#pic"+picIndex).html(data.fileName).attr("title",data.url);
//////    	    	   			picIndex++;
////    	    	   			alert("success!");
////    	    	   		},
////    	    		   complete: function(xhr) {
//////	    	   				status.html(xhr.responseText);
////    	    	   			alert("complete!");
////    	    	   		}
////    	    	   })
////    	       });
//    		
//    	}) ;
    	
    	$("#ajax_uploadVideoFile_submit_btn").click(function(){
    		
    		//设置图片上传标志
            uploadCheck = true;
    		
//    		$("#uploadVideoForm").ajaxSubmit({
//														type: "POST",
//														url:"uploadVideoFile",
//														dataType: "json",
//													    success: function(data){
//													     	alert("return");
//														}
//    		})
    	})
    	
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
            			var percentString = ( parseFloat( percentString_sub ) * 100) + "%" ;
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
        } , 10 );
    	

    	
    	
//    	$("#ajax_uploadVideoFile_submit-btn").click(function(){
////    		var ajax_uploadVideoFile_fileElement = $("#ajax_uploadVideoFile_submit");
////    		ajax_uploadVideoFile_fileElement.uploadFile("uploadVideoFile" , function(data){
////    			$.ajaxSetup({async: false});
////    			$.ajax({
////    				
////    				 success: function() {
////			                alert("ajax_upload_success!");
////			            }
////    				
////    			})
////    		});
//    		
//    		//设置图片上传标志
//  	      uploadCheck = true;
//    		
//    		$.ajaxFileUpload
//            ({
//                    url: 'uploadVideoFile', //用于文件上传的服务器端请求地址
//                    secureuri: false, //是否需要安全协议，一般设置为false
//                    fileElementId: 'uploadVideoFile', //文件上传域的ID
//                    dataType: 'json', //返回值类型 一般设置为json
//                    success: function (data, status)  //服务器成功响应处理函数
//                    {
//                       alert("success!");
//                    },
//                    error: function (data, status, e)//服务器响应失败处理函数
//                    {
//                        alert(e);
//                    }
//            })
//    		
//    	});
        
    })

    function before_submit_baseProfile(){
        //$("#userID").attr("disabled", false);
        //$("#roleName").attr("disabled", false);
        //随后进行提交表单就可以将所有的信息字段封装在request里传给后台
    	$("#form_baseProfile").submit();
    }
    
    function before_submit_security(){
    	$("#form_security").submit();
    }

</script>


</div>
</body>
</html>