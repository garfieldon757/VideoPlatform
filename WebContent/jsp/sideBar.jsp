<%@ page pageEncoding="UTF-8" %>


<div class="ng-scope" style="">
                    <div class="page-header">
                        <h2>设置</h2>
                    </div>
                    <hr style="margin-top: 0;">
                    <ul class="nav nav-stacked side-nav">

		                    <c:if test="${ personalCenter_menu == 1 }">
			                    <li id="personalCenter_menu" class=" disabled">
			                        <a href="??"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;个人中心首页</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ personalInfoEdit_menu == 1 }">
			                    <li id="personalInfoEdit_menu" disabled="disabled">
			                        <a href="edit_personalProfile_load?tab=baseProfile"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;个人信息编辑</a>
			                    </li>
			                    <li class=" disabled" >
			                        <a href="edit_personalProfile_load?tab=baseProfile">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;基本信息</a>
			                    </li>
			                    <li class=" disabled">
			                        <a href="edit_personalProfile_load?tab=baseAvatar">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;上传头像</a>
			                    </li>
			                    <li class=" disabled">
			                        <a href="edit_personalProfile_load?tab=security">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;安全设置</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ personalVideoManage_menu == 1 }">
			                    <li id="personalVideoManage_menu">
			                        <a href="edit_personalVideoManagement_load?tab=videos"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;个人视频管理</a>
			                    </li>
			                    <li class=" disabled">
			                        <a href="edit_personalVideoManagement_load?tab=videos">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;我的上传</a>
			                    </li>
			                    <li class=" disabled">
			                        <a href="edit_personalVideoManagement_load?tab=favorite">&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;我的收藏</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ uploadVideo_menu == 1 }">
			                    <li id="uploadVideo_menu">
			                      <a href="videoUpload_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;上传视频</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ watchRecord_menu == 1 }">
			                    <li id="watchRecord_menu">
			                      <a href="watchRecord_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;我的历史纪录</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ msg_menu == 1 }">
			                    <li id="msg_menu" >
			                        <a href="msg_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;我的消息</a>
			                    </li>
			                  </c:if>

			                  <c:if test="${ userManage_menu == 1 }">
			                    <li id="userManage_menu" >
			                      <a href="userManage_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;用户管理</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ videoManage_menu == 1 }">
			                    <li id="videoManage_menu">
			                      <a href="videoManage_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;视频管理</a>
			                    </li>
			                  </c:if>
			                  <c:if test="${ permissionManage_menu == 1 }">
			                    <li id="permissionManage_menu" class="disabled" disabled="disabled">
			                        <a href="permissionManage_load"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;权限管理</a>
			                    </li>
			                  </c:if>

                    </ul>
                </div>