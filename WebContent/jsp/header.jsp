<%@ page pageEncoding="UTF-8" %>




<div class="ng-scope">
    <div class="navbar navbar-static-top ng-scope">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#/"></a>
            </div>
            	
				<ul class="nav navbar-nav pull-right ng-scope">
				
					<li  class="ng-scope" style="">
					        <a href="videoSearchInit?videoCategoryID=11379899-6D4F-CD42-30DF-958A62867C36&page=1" class="icon-settings">视频库主页</a>
					</li>
					<li id="dropdown_index" class="dropdown">
					        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">个人设置<span class="caret"></span></a>
					    <ul class="dropdown-menu" role="menu" >
					        
							    <c:if test="${ personalCenter_menu == 1 }">
			                    <li id="settings_personalCenter_menu" class=" disabled" disabled="disabled">
			                        <a href="??"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;个人中心首页</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ personalInfoEdit_menu == 1 }">
			                    <li id="settings_personalInfoEdit_menu" >
			                        <a href="edit_personalProfile_load?tab=baseProfile"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;个人信息编辑</a>
			                    </li>
			                    <li >
			                        <a href="edit_personalProfile_load?tab=baseProfile">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-tag disabled"></span>&nbsp;&nbsp;基本信息</a>
			                    </li>
			                    <li >
			                        <a href="edit_personalProfile_load?tab=baseAvatar">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-tag disabled"></span>&nbsp;&nbsp;上传头像</a>
			                    </li>
			                    <li >
			                        <a href="edit_personalProfile_load?tab=security">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-tag disabled"></span>&nbsp;&nbsp;安全设置</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ personalVideoManage_menu == 1 }">
			                    <li id="settings_personalVideoManage_menu">
			                        <a href="edit_personalVideoManagement_load?tab=videos"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;个人视频管理</a>
			                    </li>
			                    <li >
			                        <a href="edit_personalVideoManagement_load?tab=videos">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-tag disabled"></span>&nbsp;&nbsp;我的上传</a>
			                    </li>
			                    <li >
			                        <a href="edit_personalVideoManagement_load?tab=favorite">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-tag disabled"></span>&nbsp;&nbsp;我的收藏</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ uploadVideo_menu == 1 }">
			                    <li id="settings_uploadVideo_menu">
			                      <a href="videoUpload_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;上传视频</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ watchRecord_menu == 1 }">
			                    <li id="settings_watchRecord_menu">
			                      <a href="watchRecord_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;我的历史纪录</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ msg_menu == 1 }">
			                    <li id="settings_msg_menu" >
			                        <a href="msg_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;我的消息</a>
			                    </li>
			                  </c:if>
		
			                  <c:if test="${ userManage_menu == 1 }">
			                    <li id="settings_userManage_menu">
			                      <a href="userManage_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;用户管理</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ videoManage_menu == 1 }">
			                    <li id="settings_videoManage_menu">
			                      <a href="videoManage_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;视频管理</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ permissionManage_menu == 1 }">
			                    <li id="settings_permissionManage_menu" class=" disabled" disabled="disabled">
			                        <a href="permissionManage_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;权限管理</a>
			                    </li>
			                  </c:if>
						
						</ul>
						
					</li>
					
				</ul>
        </div>
    </div>
</div>
<div class="ng-scope">
    <div class="horizontal-header ng-scope" ng-if="currentUser &amp;&amp; currentUser.isConsumer">
        <div class="container ">
            <img class="pic-thumb pull-left" src="img/logo.jpg">
            <input type="hidden" id="userId" value="${user.userId}">
            <h4 id="userName" class="ng-binding" value="${user.userNickName}">${user.userNickName}</h4>
            <button type="button" class="btn btn-default pull-right" class="logout" ><a href="logout">退出</a></button>
        </div>
    </div>
</div>