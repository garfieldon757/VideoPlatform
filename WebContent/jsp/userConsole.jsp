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
                        <h1>用户监控页</h1>
                    </div>
                    <div class="ng-scope">

                        <div class="panel panel-default">
                            <div class="panel-body">

                                <div class="jumbotron" style="">
                                	<input type="hidden" id="user_console_id" name="user_console_id" value="${user_console.userId}">
                                    <img src="${user_console.userAvatarImgLink}" style="height: 100px; width: 110px; display: inline-block;" >
                                    <h1 style="display: inline-block; vertical-align: middle">${user_console.userNickName}</h1>
                                </div>
                                
                                <div class="panel panel-default">
                                	<div class="panel-heading">查询区</div>
	                                <div class="panel-body">

		                                <div class="form-group row">
		                                    <label for="userOperationTime" class="col-sm-2 control-label">操作时间</label>
		                                    <div class="col-sm-7">
		                                        <input type="date" id="userOperationDatetimeStart"  name="userOperationStart" style="float:left"/>
		                                        <h3 style="float:left">_</h3>
		                                        <input type="date" id="userOperationDatetimeEnd" name="userOperationEnd" style="float:left"/>
		                                    </div>
		                                    <div class="col-md-2">
		                                        <div class="form-group">
		                                            <div class="col-sm-offset-2 col-sm-10">
		                                                <button type="submit" id="operateTimeSearchBtn" class="btn btn-primary btn-lg" >查询</button>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-1"></div>
		                                </div>
	                                
	                                </div>
	                             </div>
                                
	                             <div class="panel panel-default">
	                             	<div class="panel-heading">用户视频交互信息折线图</div>
		                             <div class="panel-body">
		                             	<div class="">
			                            	<canvas id="userOperationInfoLineChart" width="200" height="100"></canvas>
			                            </div>
		                             </div>
	                            </div>
	                            
	                            <div class="panel panel-default">
	                             	<div class="panel-heading">用户视频交互信息详情</div>
		                             <div class="panel-body">
		                             
				                             <div class="ng-scope">
					                            <ul id="myTab" class="nav nav-tabs" role="tablist">
					                                <li role="presentation" class="active">
					                                    <a href="#playInfo" id="playInfo-tab" name="playInfo-tab" role="tab" data-toggle="tab">播放历史</a>
					                                </li>
					                                <li role="presentation" class="">
					                                    <a href="#collectInfo"  id="collectInfo-tab" name="collectInfo-tab"  role="tab" data-toggle="tab">收藏历史</a>
					                                </li>
					                                <li role="presentation" class="">
					                                    <a href="#commentInfo"  id="commentInfo-tab" name="commentInfo-tab"  role="tab" data-toggle="tab">评论历史</a>
					                                </li>
					                            </ul>
					                            <div id="myTabContent" class="tab-content">
					                            
						                            <div role="tabpanel"  class="tab-pane active in" id="playInfo" name="playInfo">
						                            
						                            <div class="panel panel-default">
							                            <div class="panel-body">
							                              	
							                            	<table class="table table-bordered">
							                                    <thead>
								                                    <tr>
								                                        <th>视频封面</th>
								                                        <th>视频名称</th>
								                                        <th>播放时间</th>
								                                    </tr>
							                                    </thead>
							                                    <tbody id="playInfo_Tbody">
								                                    <tr>
								                                        <td colspan="7" style="text-align:center;vertical-align:middle;"> 尚未查询结果 </td>
								                                    </tr>
							                                    </tbody>
							                                </table>
							                            
							                            </div>
							                          </div>
						                            
							                            
						                            
					                            	</div>
					                            	<div role="tabpanel"  class="tab-pane fade " id="collectInfo" name="collectInfo">
						                            
						                            	<div class="panel panel-default">
						                            	  <div class="panel-body">
						                            	   		
						                            	  		<table class="table table-bordered">
								                                    <thead>
									                                    <tr>
									                                        <th>视频封面</th>
									                                        <th>视频名称</th>
									                                        <th>收藏时间</th>
									                                    </tr>
								                                    </thead>
								                                    <tbody id="collectInfo_Tbody">
									                                    <tr>
									                                        <td colspan="7" style="text-align:center;vertical-align:middle;"> 尚未查询结果 </td>
									                                    </tr>
								                                    </tbody>
								                                </table>
						                            	  
						                            	  </div>
						                            	</div>
							                            	
					                            	</div>
			                            			<div role="tabpanel"  class="tab-pane fade " id="commentInfo" name="commentInfo">
						                            
					                            			<div class="panel panel-default">
					                            			  <div class="panel-body">
					                            			    		
					                            			  		<table class="table table-bordered">
									                                    <thead>
										                                    <tr>
										                                        <th>视频封面</th>
										                                        <th>视频名称</th>
										                                        <th>评论时间</th>
										                                        <th>评论内容</th>
										                                        <th>评论对象用户昵称</th>
										                                    </tr>
									                                    </thead>
									                                    <tbody id="commentInfo_Tbody">
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
                </div>
            </div>

        </div>
    </div>
</div>
</div>

<%@include file="footer.jsp"%>	


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/chart.js"></script>


<script type="text/javascript">

	function timeConverter(UNIX_timestamp){
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
    	
    	$("#userManage_menu").attr("class" , "active");

    	/******************初始化提权监控模块的折线图******************/
        var ctx = $("#userOperationInfoLineChart");
        
        var data4userOperationInfoLineChart = {
            labels:[0,0,0,0,0,0,0,0,0,0,0,0],
            datasets: [
                {
                    label:"用户视频操作次数",
                    data: [0,0,0,0,0,0,0,0,0,0,0,0],
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
            data: data4userOperationInfoLineChart
        });
        /************************************************************/
    	
    	$("#operateTimeSearchBtn").click(function(){
        	
        	var user_console_id = $("#user_console_id").val();
            var userOperationDatetimeStart = $("#userOperationDatetimeStart").val() ;
            var userOperationDatetimeEnd = $("#userOperationDatetimeEnd").val();
            
            $.ajax({
                url:"ajax_search_userConsole_operationInfo",
                data:{
            		user_console_id : user_console_id,
            		userOperationDatetimeStart : userOperationDatetimeStart,
            		userOperationDatetimeEnd : userOperationDatetimeEnd
                },
                type:"GET",
                success:function(jsonString){

                    jsonObject = eval("(" + jsonString + ")");
                    var lineChartInfo_play_Obj = jsonObject[0];
                    var lineChartInfo_collect_Obj = jsonObject[1];
                    var lineChartInfo_comment_Obj = jsonObject[2];
                    var tableInfo_play_Obj =  jsonObject[3];
                    var tableInfo_collect_Obj = jsonObject[4];
                    var tableInfo_comment_Obj = jsonObject[5];
                    
                    var concatStr_tableInfo_play = "";
                    if(tableInfo_play_Obj.length == 0){
                    	
                    	concatStr_tableInfo_play += 	"<tr>"
								                                + 			"<td colspan=\"3\" style=\"text-align:center;vertical-align:middle;\"> 尚未查询结果 </td>"
								                                +		 "</tr>";
                   	
	                   }else{
	                	   
		                    for(var i=0; i<tableInfo_play_Obj.length; i++)
		                    {
		                    	concatStr_tableInfo_play += 	"<tr>"
										                                + 			"<td><img class='img-rounded' src='" + tableInfo_play_Obj[i].tblVideo.videoCoverLink + "' data-holder-rendered='true' style='width: 50px; height: 50px;'></td>"
										                                + 			"<td>" + tableInfo_play_Obj[i].tblVideo.videoName + "</td>"
										                                + 			"<td>" + timeConverter( tableInfo_play_Obj[i].userVideoRelationOperationTimestamps ) + "</td>"
										                                +		 "</tr>";
		                    }
		                    
	                   }
                	$("#playInfo_Tbody").html("");
                    $("#playInfo_Tbody").html(concatStr_tableInfo_play);
                    
                	var concatStr_tableInfo_collect = "";
                	 if(tableInfo_collect_Obj.length == 0){
                     	
                		 concatStr_tableInfo_play += 	"<tr>"
					    		                                + 			"<td colspan=\"3\" style=\"text-align:center;vertical-align:middle;\"> 尚未查询结果 </td>"
					    		                                +		 "</tr>";
                       	
                       }else{
                    	   
		                	for(var i=0; i<tableInfo_collect_Obj.length; i++)
		                    {
		                		concatStr_tableInfo_collect += 	"<tr>"
			                			+ 			"<td><img class='img-rounded' src='" + tableInfo_collect_Obj[i].tblVideo.videoCoverLink + "' data-holder-rendered='true' style='width: 50px; height: 50px;'></td>"
			                            + 			"<td>" + tableInfo_collect_Obj[i].tblVideo.videoName + "</td>"
			                            + 			"<td>" + tableInfo_collect_Obj[i].userVideoRelationOperationTimestamps + "</td>"
		                            	+		 "</tr>";
		                    }
		                	
                       }
                	$("#collectInfo_Tbody").html("");
                    $("#collectInfo_Tbody").html(concatStr_tableInfo_collect);
                	
            		var concatStr_tableInfo_comment = "";
            		 if(tableInfo_comment_Obj.length == 0){
                     	
            			 concatStr_tableInfo_play += 	"<tr>"
					    		                                + 			"<td colspan=\"5\" style=\"text-align:center;vertical-align:middle;\"> 尚未查询结果 </td>"
					    		                                +		 "</tr>";
                       	
                       }else{
                    	   
		            		for(var i=0; i<tableInfo_comment_Obj.length; i++)
		                    {
		            			concatStr_tableInfo_comment += 	"<tr>"
													            				+ 			"<td><img class='img-rounded' src='" + tableInfo_comment_Obj[i].tblVideo.videoCoverLink + "' data-holder-rendered='true' style='width: 50px; height: 50px;'></td>"
													                            + 			"<td>" + tableInfo_comment_Obj[i].tblVideo.videoName + "</td>"
													                            + 			"<td>" + tableInfo_comment_Obj[i].commentCommentTimestamps + "</td>"
													                            + 			"<td>" + tableInfo_comment_Obj[i].commentContent + "</td>"
													                            + 			"<td>" + tableInfo_comment_Obj[i].tblComment.tblUser.userNickName + "</td>"
												                                +		 "</tr>";
		                    }
		            		
                       }
            		$("#commentInfo_Tbody").html("");
                    $("#commentInfo_Tbody").html(concatStr_tableInfo_comment);
                    
                    
                    /******************初始化提权监控模块的折线图******************/
                    var ctx = $("#userOperationInfoLineChart");
                    var labels_value_list = new Array();
                    var data_value_list_for_play = new Array();
                    var data_value_list_for_collect = new Array();
                    var data_value_list_for_comment = new Array();
                    var index_for_play = 0;
                    for( var item in lineChartInfo_play_Obj)
                    {
                    	labels_value_list[index_for_play] = item;
                    	data_value_list_for_play[index_for_play] = lineChartInfo_play_Obj[item];
                    	index_for_play++;
                    }
                    var index_for_collect = 0;
                    for( var item in tableInfo_collect_Obj)
                    {
                    	labels_value_list[index_for_collect] = item;
                    	data_value_list_for_collect[index_for_collect] = tableInfo_collect_Obj[item];
                    	index_for_collect++;
                    }
                    var index_for_comment = 0;
                    for( var item in tableInfo_comment_Obj)
                    {
                    	labels_value_list[index_for_comment] = item;
                    	data_value_list_for_comment[index_for_comment] = tableInfo_comment_Obj[item];
                    	index_for_comment++;
                    }
                    
                    var data4videoPlayInfoLineChart = {
                        labels: labels_value_list,
                        datasets: [
                            {
                                label:"该用户当月播放视频次数",
                                data: data_value_list_for_play,
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
                            },
                            {
                                label:"该用户当月收藏视频次数",
                                data: data_value_list_for_collect,
                                fill: false,
                                lineTension: 0.1,
                                backgroundColor: "rgba(75,192,192,0.2)",
                                borderColor: "rgba(75,192,192,1)",
                                borderCapStyle: 'butt',
                                borderDash: [],
                                borderDashOffset: 0.0,
                                borderJoinStyle: 'miter',
                                pointBorderColor: "rgba(75,192,192,1)",
                                pointBackgroundColor: "#fff",
                                pointBorderWidth: 1,
                                pointHoverRadius: 5,
                                pointHoverBackgroundColor: "rgba(75,192,192,1)",
                                pointHoverBorderColor: "rgba(220,220,220,1)",
                                pointHoverBorderWidth: 2,
                                pointRadius: 1,
                                pointHitRadius: 10
                            },
                            {
                                label:"该用户当月评论视频次数",
                                data: data_value_list_for_comment,
                                fill: false,
                                lineTension: 0.1,
                                backgroundColor: "rgba(155, 199, 32, 0.2)",
                                borderColor: "rgba(255, 99, 132, 1)",
                                borderCapStyle: 'butt',
                                borderDash: [],
                                borderDashOffset: 0.0,
                                borderJoinStyle: 'miter',
                                pointBorderColor: "rgba(255, 99, 132, 1)",
                                pointBackgroundColor: "#fff",
                                pointBorderWidth: 1,
                                pointHoverRadius: 5,
                                pointHoverBackgroundColor: "rgba(255, 99, 132, 1)",
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
    	})

    });


</script>


</div>
</body>
</html>