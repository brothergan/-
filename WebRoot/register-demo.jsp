<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
	<!--[if IE 7]>
	  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
	<![endif]-->
	<link rel="stylesheet" href="assets/css/ace.min.css" />
	<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
	<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
       <link rel="stylesheet" href="css/style.css"/>
	<!--[if lte IE 8]>
	  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
	<![endif]-->
	<script src="assets/js/ace-extra.min.js"></script>
	<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="assets/layer/layer.js" type="text/javascript"></script>
	<script src="js/jquery.easyui.min.js" type="text/javascript"></script>
	<script>
		function loginValidate(){
			var pwdval=$("#password").val();
			var reval=$("#rePassword").val();
			if($("#userLoginName").val()==""){
				alert("登陆名不能为空");
				return false;
			}
			if($("#password").val()==""){
				alert("密码不能为空");
				return false;
			}else if(reval!=pwdval){
				alert("确认密码和密码不一致");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body class="login-layout">
  	<div class="loginbody">
  		<div class="login-container">
  			<div class="center">
				<h1>
					<i class="icon-leaf green"></i>
					<span class="white">在线文档管理系统</span>
				</h1>
				<h4 class="white">Document Manage System</h4>
			</div>
			<div class="space-6"></div>
			<div class="position-relative">
				<div id="login-box" class="login-box widget-box no-border visible" >
					<div class="widget-body">
						<div class="widget-main">
							<h4 class="header blue lighter bigger">
								<i class="icon-coffee green"></i>
								注册
							</h4>
							<div class="login_icon"><img src="images/login.png" /></div>
							<form id="register_form">
								<fieldset>
									<label class="block clearfix">
										<span class="block input-icon input-icon-right">
											<input type="text" name="userloginName" id="userLoginName" class="form-control" placeholder="登录名"/>
											<i class="icon-user"></i>
										</span>
									</label>
									<label class="block clearfix">
						    			<span class="block input-icon input-icon-right">
						    				<input type="password" name="password" id="password" class="form-control" placeholder="密码" />
						    				<i class="icon-lock"></i>
						    			</span>
						    		</label>
						    		<label class="block clearfix">
						    			<span class="block input-icon input-icon-right">
						    				<input type="password" name="rePassword" id="rePassword" class="form-control" placeholder="确认密码" />
						    				<i class="icon-lock"></i>
						    			</span>
						    		</label>
						    		<label class="block clearfix">
						    			<span class="block input-icon input-icon-right">
						    				性别：
						    				<input type="radio" checked="checked" name="Sex" id="rePassword"  value="1" />男
						    				<input type="radio" name="Sex" id="rePassword"  value="0" />女
						    			</span>
						    		</label>
						    		<div class="space"></div>
						    		<div class="clearfix">
						    			<button type="button" class="width-35 pull-right btn btn-sm btn-primary" id="btn_register">
											<i class="icon-key"></i>
											注册
										</button>
						    		</div>
						    		<div class="space-4"></div>
								</fieldset>
							</form>
							<div class="social-or-login center">
								<span class="bigger-110">通知</span>
							</div>
							<div class="social-login center">
								本网站系统不再对IE8以下浏览器支持，请见谅。
							</div>
						</div>
						<div class="toolbar clearfix">
						</div>
					</div>
				</div>
			</div>
  		</div>
  	</div>
  	<div class="loginbm">版权所有  2017  <a href="">广东外语外贸大学</a> </div><strong></strong>
    <!-- <form id="register_form">
    	登陆名：<input type="text" id="userLoginName" /><br>
    	密码：<input type="password" id="password" /><br>
    	确认密码：<input type="password" id="rePassword" /><br>
    	性别:<input type="radio" checked="checked" name="Sex" value="1" />男
    		 <input type="radio" name="Sex" value="0" />女<br>
    	<input type="button" value="注册" id="btn_register" />
    </form> -->
  </body>
</html>
<script type="text/javascript">
	$("#btn_register").click(function(){
		$.ajax({
			url:'register.action',
			data:{
				userLoginName:$("#userLoginName").val(),
				password:$("#password").val(),
				rePassword:$("#rePassword").val(),
				sex:$("input:radio:checked").val()
			},
			type:'post',
			dataType:"json",
			beforeSend:function(xhr){
				return loginValidate();
			},
			success:function(data){
				alert(data.msg);
			}
		});
	});
</script>