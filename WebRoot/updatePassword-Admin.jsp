<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
    
	<meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>       
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
        <link href="Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
	    <script src="js/jquery-1.9.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
  </head>
  
  <body>
  <div class="type_style">
  		<div class="type_title">修改密码</div>
  		<div class="type_content">
  			<form id="editUserInfo" class="form form-horizontal">
  				<input type="hidden" value="${loginAdmin.adminId }" id="adminId"/>
  				<div class="Operate_cont clearfix">
  					<label class="form-label"> 原密码：</label>
  					<div class="formControls ">
  						<input type="password" value="${loginAdmin.password }" id="userLoginName" class="input-text"/>
  					</div>
  				</div>
  				<div class="Operate_cont clearfix">
  					<label class="form-label"> 新密码：</label>
  					<div class="formControls ">
  						<input type="password" id="newPassword" class="input-text"/>
  					</div>
  				</div>
  				<div class="Operate_cont clearfix">
  					<label class="form-label"> 确认密码：</label>
  					<div class="formControls ">
  						<input type="text" id="configPassword" class="input-text"/>
  					</div>
  				</div>
  				<div class="">
     				<div class="" style=" text-align:center">
      					<input class="btn btn-primary radius" type="button" value="修改密码" id="update_password" onclick="editUserInfo()" />
      				</div>
    			</div>
  			</form>
  		</div>
  	</div>
  </body>
</html>
<script type="text/javascript">
	$("#update_password").click(function(){
		$.ajax({
			url:"updateAdminPassword.action",
			data:{
				adminId:$("#adminId").val(),
				newPassword:$("#newPassword").val(),
				configPassword:$("#configPassword").val()
			},
			type:"post",
			dataType:"json",
			beforeSend:function(xhr){
				return loginValidate();			
			},
			success:function(data){
				alert(data.msg);
				location.reload();
			}
		});
	});
	function loginValidate(){
			var pwdval=$("#newPassword").val();
			var reval=$("#configPassword").val();
			if(pwdval==""){
				alert("新密码不能为空");
				return false;
			}else if(reval!=pwdval){
				alert("确认密码和新密码不一致");
				return false;
			}
			return true;
		}
</script>