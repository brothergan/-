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
    
    <title>修改文档</title>
    
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
	<script>
		$(function(){
			$("#btnReset").click(function(){
				$(this).parent().html('<input type="file" name="documentRsc" id="documentRsc" /><br>');
			});
		});
	</script>
  </head>
  
  <body>
  	<div class="type_style">
  		<div class="type_content">
  			<form id="uploadForm" class="form form-horizontal">
  				<input type="hidden" id="documentId" value="${doc.documentId }" />
  				<div class="Operate_cont clearfix">
  					<label class="form-label">文档名称：</label>
  					<div class="formControls ">
  						<input type="text" class="input-text" name="doc.documentName" id="documentName" value="${doc.documentName }"/>
  					</div>
  				</div>
  				<div class="Operate_cont clearfix">
  					<label class="form-label">文档类型：</label>
  					<div class="formControls " >
  						<select style="margin-left:9px;" name="doc.documentType" id="documentType" class="select">
		    				<option value="text">text</option>
		    				<option value="image">image</option>
		    				<option value="video">video</option>
		    				<option value="music">music</option>
		    				<option value="code">code</option>
		    			</select>
  					</div>
  				</div>
  				<div class="Operate_cont clearfix">
  					<label class="form-label">文档描述：</label>
  					<div class="formControls ">
  						<textarea class="textarea" name="doc.documentDesc" id="documentDesc">${doc.documentDesc }</textarea>
  					</div>
  				</div>
  				<div class="Operate_cont clearfix">
  					<label class="form-label">允许下载:</label>
  					<div class="formControls ">
  						<input  style="margin-left:9px;" type="radio" checked="checked" name="doc.downloadStatus" value="1" />允许
    					<input type="radio" name="doc.downloadStatus" value="0" />不允许
  					</div>
  				</div>
  				<div class="Operate_cont clearfix">
  					<label class="form-label">上传附件：</label>
  					<div class="formControls">
  						<div>文档附件:${doc.documentRsc }<input type="button" value="重新上传" id="btnReset" class="btn btn-primary radius"/><br>
    		 				<b>每次更新文档信息，都需要将原文件或者新文件再次上传</b></div>
  					</div>
  				</div>
  				<div class="">
  					<div class="" style=" text-align:center">
  						<input class="btn btn-primary radius" type="button" value="更新文件" id="btn_upload" onclick="uploadDocument()"/>
  					</div>
  				</div>
  			</form>
  		</div>
  	</div>
  </body>
</html>
<script>
	function uploadDocument(){
		var formData=new FormData();
		formData.append("documentRsc",$("#documentRsc")[0].files[0]);
		formData.append("documentId",$("#documentId").val());
		formData.append("documentName",$("#documentName").val());
		formData.append("documentType",$("#documentType option:selected").val());
		formData.append("documentDesc",$("#documentDesc").val());
		formData.append("downloadStatus",$("input:radio:checked").val());
		$.ajax({
			url:'updateDocument.action',
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
				history.back();
			}
		});
	}
	function loginValidate(){
			if($("#documentName").val()==""){
				alert("文档名称不能为空");
				return false;
			}
			return true;
		}
</script>