<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>修改用户信息</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
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
	<script src="assets/layer/layer.js" type="text/javascript"></script>
	<script src="js/jquery.easyui.min.js" type="text/javascript"></script>
  </head>
  
  <body>
  	<div class="type_style">
  		<div class="type_title">修改用户信息</div>
  		<div class="type_content">
  			<form id="editUserInfo" class="form form-horizontal">
  				<div class="Operate_cont clearfix">
  					<label class="form-label"><span class="c-red">*</span> 用户名：</label>
  					<div class="formControls ">
  						<input type="text" value="${loginUser.userLoginName }" id="userLoginName" class="input-text"/>
  					</div>
  				</div>
  				<div class="Operate_cont clearfix">
  					<label class="form-label"> 电话号码：</label>
  					<div class="formControls ">
  						<input type="text" value="${userDetail.telephone }" id="telephone" class="input-text"/>
  					</div>
  				</div>
  				<div class="Operate_cont clearfix">
  					<label class="form-label"> 邮箱：</label>
  					<div class="formControls ">
  						<input type="text" value="${userDetail.mail }" id="mail" class="input-text"/>
  					</div>
  				</div>
  				<div class="Operate_cont clearfix">
  					<label class="form-label"> 签名：</label>
  					<div class="formControls ">
  						<textarea id="sign" class="textarea">${userDetail.sign }</textarea>
  					</div>
  				</div>
  				<div class="">
     				<div class="" style=" text-align:center">
      					<input class="btn btn-primary radius" type="button" value="提交修改" id="btn_edit" onclick="editUserInfo()" />
      				</div>
    			</div>
  			</form>
  		</div>
  	</div>
 </body>
</html>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:'getUserDetail.action',
			type:"post",
			dataType:"json"
		});
	});
	function editUserInfo(){
		var formData=new FormData();
		formData.append("userLoginName",$("#userLoginName").val());
		formData.append("telephone",$("#telephone").val());
		formData.append("mail",$("#mail").val());
		formData.append("sign",$("#sign").val());
		$.ajax({
			url:'updateUserInfo.action',
			contentType: false,  
          	processData: false, 
          	type:"post",
          	data:formData,
          	dataType:"json",
          	beforeSend:function(xhr){
          		return loginValidate();
          	},
          	success:function(data){
          		alert(data.msg);
          		location.reload();
          	}
		});
	}
	function loginValidate(){
			if($("#userLoginName").val()==""){
				alert("用户名称不能为空");
				return false;
			}
			return true;
		}
</script>