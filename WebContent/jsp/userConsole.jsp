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
                        <h1>用户监控页</h1>
                    </div>
                    <div class="ng-scope">

                        <div class="panel panel-default">
                            <div class="panel-body">

                                <div class="jumbotron" style="">
                                	<input type="hidden" id="videoId" name="videoId" value="${video.videoId}">
                                    <img src="${video.videoCoverLink}" style="height: 100px; width: 110px; display: inline-block;" >
                                    <h1 style="display: inline-block; vertical-align: middle">${video.videoName}</h1>
                                </div>

                                <div class="form-group row">
                                    <label for="playDatetime" class="col-sm-2 control-label">播放时间</label>
                                    <div class="col-sm-7">
                                        <input type="date" id="video_playDatetimeStart"  name="video_playDatetimeStart" style="float:left"/>
                                        <h3 style="float:left">_</h3>
                                        <input type="date" id="video_playDatetimeEnd" name="video_playDatetimeEnd" style="float:left"/>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" id="videoPlayDatetimeSearchBtn" class="btn btn-primary btn-lg" >查询</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-1"></div>
                                </div>

                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>播放总次数</th>
                                        <th>播放总人数</th>
                                        <th>播放总时长</th>
                                        <th>播放完成度</th>
                                    </tr>
                                    </thead>
                                    <tbody id="videoManage_Tbody">
                                    <tr>
                                        <td colspan="7" style="text-align:center;vertical-align:middle;"> 尚未查询结果 </td>
                                    </tr>
                                    </tbody>
                                </table>
                                
                                <div class="">
                                	<canvas id="videoPlayInfoLineChart" width="200" height="100"></canvas>
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
<script src="js/chart.js"></script>


<script type="text/javascript">

    $(document).ready(function(){

        $("#videoPlayDatetimeSearchBtn").click(function(){
        	alert("sdafsfsaf");
        	var videoId = $("#videoId").val();
            var videoPlayDatetimeStart = $("#video_playDatetimeStart").val() ;
            var videoPlayDatetimeEnd = $("#video_playDatetimeEnd").val();
            
            $.ajax({
                url:"ajax_search_videoConsole_videoPlayInfo",
                data:{
            		videoId : videoId,
            		videoPlayDatetimeStart : videoPlayDatetimeStart,
            		videoPlayDatetimeEnd : videoPlayDatetimeEnd
                },
                type:"GET",
                success:function(jsonString){

                    jsonObject = eval("(" + jsonString + ")");
                    var tableInfoObj = jsonObject[0];
                    var lineChartInfoObj =  jsonObject[1];
                    
                    var concatStr_tableInfo = "";
                    
                	concatStr_tableInfo += 	"<tr>"
					                                + 			"<td>" + tableInfoObj.totalCount_play + "</td>"
					                                + 			"<td>" + tableInfoObj.totalCount_playProple + "</td>"
					                                + 			"<td>0</td>"
					                                + 			"<td>" + tableInfoObj.totalPercent_play + "</td>"
					                                +		 "</tr>";

                    $("#videoManage_Tbody").html("");
                    $("#videoManage_Tbody").html(concatStr_tableInfo);
                    
                    /******************初始化提权监控模块的折线图******************/
                    var ctx = $("#videoPlayInfoLineChart");
                    var labels_value_list = new Array();
                    var data_value_list = new Array();
                    var index = 0;
                    for( var item in lineChartInfoObj)
                    {
                    	labels_value_list[index] = item;
                    	data_value_list[index] = lineChartInfoObj[item];
                    	index++;
                    }
                    
                    var data4videoPlayInfoLineChart = {
                        labels: labels_value_list,
                        datasets: [
                            {
                                label:"该视频当月播放次数",
                                data: data_value_list,
                                fill: false,
                                lineTension: 0.1,
                                backgroundColor: "rgba(54, 162, 235, 0.2)",
                                borderColor: "rgba(54, 162, 235, 1)",
                                borderCapStyle: 'butt',
                                borderDash: [],
                                borderDashOffset: 0.0,
                                borderJoinStyle: 'miter',
                                pointBorderColor: "rgba(54, 162, 235,1)",
                                pointBackgroundColor: "#fff",
                                pointBorderWidth: 1,
                                pointHoverRadius: 5,
                                pointHoverBackgroundColor: "rgba(54, 162, 235,1)",
                                pointHoverBorderColor: "rgba(220,220,220,1)",
                                pointHoverBorderWidth: 2,
                                pointRadius: 1,
                                pointHitRadius: 10
                            }
                        ]
                    };
                    var myDoughnutChart = new Chart(ctx, {
                        type: 'line',
                        data: data4videoPlayInfoLineChart
                    });
                    /************************************************************/
                    

                }
            })

        });


    });


</script>


</div>
</body>
</html>