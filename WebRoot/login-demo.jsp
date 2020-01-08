<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆</title>
    
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
			if($("#userLoginName").val()==""){
				alert("登陆名不能为空");
				return false;
			}
			if($("#password").val()==""){
				alert("密码不能为空");
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
				<div id="login-box" class="login-box widget-box no-border visible" style="height:335.067px;">
					<div class="widget-body">
						<div class="widget-main">
							<h4 class="header blue lighter bigger">
								<i class="icon-coffee green"></i>
								登陆
							</h4>
							<div class="login_icon"><img src="images/login.png" /></div>
						    <form id="loginForm">
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
						    		<div class="space"></div>
						    		<div class="clearfix">
						    			<label class="inline" style="margin:-20px 10px 0px 10px;">
						    				<span class="lbl"><a href="register-demo.jsp">注册用户</a></span>
						    			</label>
						    			<label class="inline" style="margin:-20px 10px 0px 50px;" >
						    				<span class="lbl">身份：</span>
						    				<select id="identity" name="identity"><option value="admin">管理员</option><option value="user">用户</option></select>
						    			</label> 
						    			<button type="button" class="width-35 pull-right btn btn-sm btn-primary" id="btn_login">
											<i class="icon-key"></i>
											登陆
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
  </body>
</html>
<script type="text/javascript">
	$("#btn_login").click(function(){
		$.ajax({
			url:'login.action',
			data:{
				userLoginName:$("#userLoginName").val(),
				password:$("#password").val(),
				identity:$("#identity").val()
			},
			type:'post',
			dataType:"json",
			beforeSend:function(xhr){
				return loginValidate();
			},
			success:function(data){
				if(data.status==0){
					alert(data.msg);
				}else{
					location.href="index.jsp";
				}
			}
		});
	});
</script>