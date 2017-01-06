<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" class="" data-desktopbrowser="true"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>AdVideoManagement</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <link rel="stylesheet" type="text/css" href="css/material.custom.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="css/hometouch.css">
  <link rel="stylesheet" type="text/css" href="css/carer-badges.css">
  <style type="text/css">
	  #passStrength{height:6px;width:120px;border:1px solid #ccc;padding:2px;}
	  .strengthLv1{background:red;height:6px;width:40px;}
	  .strengthLv2{background:orange;height:6px;width:80px;}
	  .strengthLv3{background:green;height:6px;width:120px;}
  </style>



</head>
<body>

<div class="">


  <section>
    <div class="ht-app ht-app--register">
      <div ui-view="" class="ng-scope"><div class="ht-app__wrapper ng-scope">
      <a class="ht-app__return js-return" href="backToMainPage" >
      	<span class="glyphicon glyphicon-hand-left"></span>
        返回首页
      </a>

      <div class="ht-app__header">
        <div class="ht-app__header-content">
          <h1 class="ht-app__header-title ng-binding">
            注册
          </h1>
        </div>
      </div>


      <form  class="ht-app__form" action="signUp" name="form">
        
        <div id="div_userNickName" class="ht-app__field-wrapper" >
          <input id="userNickName" name="userNickName" class="ht-app__form-input" type="text" placeholder="昵称">
          <div id="checkDiv_userNickName" >
            <br id="br_userNickName" style="display: block">
            <p id="error_userNickName" style="display:none; color:red">该输入不符合要求</p>
            <p id="success_userNickName" style="display:none; color:green">该输入符合要求</p>
          </div>
          <input type="hidden" id="userNickName_checked" value="0">
        </div>

        <div class="ht-app__field-wrapper" >
        	<div class="row">
        		<div class="col-md-3">
        			<label for="sex"><strong>性别:</strong></label>
        		</div>
        		<div class="col-md-2">
	        		<label class="radio-inline">
				        <input type="radio" id="sex" name="sex" value="男"> 男
				      </label>
        		</div>
        		<div class="col-md-2">
	        		 <label class="radio-inline">
				        <input type="radio" id="sex" name="sex" value="女"> 女
				      </label>
        		</div>
        		<div class="col-md-5"></div>
        	</div>
        	<input type="hidden" id="userSex_checked" value="0">
	      </div>

        <div class="ht-app__field-wrapper">
	        <input id="password" name="password" class="ht-app__form-input" type="password" placeholder="密码">
	        <div id="checkDiv_password" >
	          <br id="br_password" style="display: block">
	          <p id="error_password" style="display:none; color:red">该输入不符合要求</p>
	          <p id="success_password"><img src="" /></p>
	        </div>
	        <div id="div_passStrength" class="pass-wrap" style="display:none">
		        <em>密码强度：</em>
		        <div id="passStrength"></div>
		    </div>
		    <input type="hidden" id="userPassword_checked" value="0">
	      </div>

        <div class="ht-app__field-wrapper" >
          <input id="passwordConfirm" name="passwordConfirm" class="ht-app__form-input" type="password" placeholder="密码确认">
          <div id="checkDiv_passwordConfirm" >
            <br id="br_passwordConfirm" style="display: block">
            <p id="error_passwordConfirm" style="display:none; color:red">密码确认与密码不一致，请重新输入</p>
          </div>
          <input type="hidden" id="userPasswordConfirm_checked" value="0">
        </div>

        <div class="ht-app__field-wrapper" >
	        <input id="email" name="email" class="ht-app__form-input" type="email" placeholder="电子邮箱">
	        <div id="checkDiv_email" >
	          <br id="br_email" style="display: block">
	          <p id="error_email" style="display:none; color:red">该输入不符合Email格式</p>
	        </div>
	        <input type="hidden" id="userEmail_checked" value="0">
	      </div>
        
      </form>


        <div class="ht-app__form-submit-wrapper">
          <div>
            <button id="sign_up_form_button" class="ht-app__form-submit" type="submit" >注册</button>

            <div class="ht-app__additional">
              <span class="margin-right-10">已注册过账户？</span>
              <a class="btn ht-btn -btn-blue" href="login_page">登陆</a>
            </div>
          </div>
        </div>
      
    </div>
    </div>
    </div>
  </section>

</div>




<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/passwordStrength.js"></script>

<script type="text/javascript">


$(document).ready(function(){
	
	$("#userNickName").blur(function () {

        var userNickNameValue = $('#userNickName').val();
        $.ajax({
            url: "ajax_userNameValidation",
            data: { userNickName : userNickNameValue},
            type: "GET",
            success: function (validation_result) {
                
                //返回"available"表示userName可用，“unavailable“表示不可用
                if( validation_result == "available"){
                    $("#success_userNickName").css('display', 'block');
                    $("#error_userNickName").css('display', 'none');
                    $("#userNickName_checked").val(1);
                }else if( validation_result == "unavailable" ){
                    $("#success_userNickName").css('display', 'none');
                    $("#error_userNickName").css('display', 'block');
                }
                
            }
        });
        
    });

    $("#password").blur(function () {
    	$("#div_passStrength").show();
    	new PasswordStrength('password','passStrength');
    	 $("#userPassword_checked").val(1);
    });
    
    $("#passwordConfirm").blur(function () {
    	var password_val = $("#password").val();
    	var passwordConfirm_val = $("#passwordConfirm").val();
    	if( password_val == passwordConfirm_val )
    	{
            $("#error_passwordConfirm").css('display', 'none');
            $("#userPasswordConfirm_checked").val(1);
    	}else{
            $("#error_passwordConfirm").css('display', 'block');
    	}
    });

    $("#email").blur(function () {
        var reg =  /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/ ;
        var email_val = $('#email').val();
        reg_result = reg.test(email_val);

        if(reg_result){
        	 $("#error_email").css('display', 'none');
        	 $("#userEmail_checked").val(1);
        }else {
        	 $("#error_email").css('display', 'block');
        }

    });
    
    
    $("#sign_up_form_button").click(function(){
    	
    	var userNickName_checked_value = $("#userNickName_checked").val();
    	var userPassword_checked_value = $("#userPassword_checked").val();
    	var userPasswordConfirm_checked_value = $("#userPasswordConfirm_checked").val();
    	var userEmail_checked_value = $("#userEmail_checked").val();
    	var checked_list = (userNickName_checked_value && userPassword_checked_value && userPasswordConfirm_checked_value && userEmail_checked_value) ;

    	if( checked_list == 1 ){
    		$("#form").submit();
    	}else{
    		
    	}
    	
    });
    
})


</script>


</body>
</html>