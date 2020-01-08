<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>文档信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>       
        <link href="assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="js/jquery-1.9.1.min.js"></script>
		<script src="assets/layer/layer.js" type="text/javascript" ></script>
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>  
        <script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>           	
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>

  </head>
  
  <body>
  	<div class="clearfix">
  		<div class="admin_info_style">
  			<div class="admin_modify_style" id="Personal">
  				<div class="type_title">文档信息 </div>
  				<div class="xinxi">
  					<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">文档名称: </label>
  						<div class="col-sm-9">
  							<input type="text" name="用户名" id="website-title" value="${doc.documentName }" class="col-xs-7 text_info" disabled="disabled" />
  						</div>
  					</div>
  					<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">文档类型: </label>
  						<div class="col-sm-9">
  							<input type="text" name="用户名" id="website-title" value="${doc.documentType }" class="col-xs-7 text_info" disabled="disabled" />
  						</div>
  					</div>
  					<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">文档描述: </label>
  						<div class="col-sm-9">
  							<input type="text" name="用户名" id="website-title" value="${doc.documentDesc }" class="col-xs-7 text_info" disabled="disabled" />
  						</div>
  					</div>
  					<c:if test="${doc.user.userId!=loginUser.userId }" >
  						<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">上传用户： </label>
	  						<div class="col-sm-9">
	  							<a href="javascript:userMessage(${doc.user.userId })">${doc.user.userLoginName }</a>
	  						</div>
	  					</div>
  					</c:if>
  					<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">下载状态: </label>
  						<div class="col-sm-9">
  							<c:if test="${doc.downloadStatus==1 }"><input type="text" name="用户名" id="website-title" value="可以" class="col-xs-7 text_info" disabled="disabled" /></c:if>
  							<c:if test="${doc.downloadStatus==0 }"><input type="text" name="用户名" id="website-title" value="不可以" class="col-xs-7 text_info" disabled="disabled" /></c:if>
  						</div>
  					</div>
  					<div class="Button_operation clearfix">
  						<c:if test='${not empty buttons }'>
		   					<c:forEach items='${buttons }' var='btn'>
		   						<c:if test='${btn.menu.menuId==2&&btn.buttonId==3 }'>
		   							<c:if test="${doc.downloadStatus==1 }">
			   							<div class="form-group">
			   								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">下载链接： </label>
			   								<div class="col-sm-9">
			   									<a href="downloadDocument.action?fileName=${doc.documentRsc }&documentId=${doc.documentId }">${doc.documentRsc }</a>
			   								</div>
			   							</div>
		   							</c:if>
		   						</c:if>
		   						<c:if test="${not empty loginUser }">
		   							<c:choose>
			   							<c:when test='${doc.user.userId==loginUser.userId }' >
			   								<c:if test='${btn.menu.menuId==2&&btn.buttonId==5 }'>
					   							<c:if test="${doc.downloadStatus==1 }">
					   								<button type='button' id='lock_document' onclick="lockDocument(${doc.documentId})" class="btn btn-danger radius">${btn.buttonName }</button>
					   							</c:if>
					   						</c:if>
					   						<c:if test='${btn.menu.menuId==2&&btn.buttonId==6 }'>
					   							<c:if test="${doc.downloadStatus==0 }">
					   								<button type='button' id='unlock_document'  onclick="unlockDocument(${doc.documentId})" class="btn btn-danger radius" >${btn.buttonName }</button>
					   							</c:if>
					   						</c:if>
			   							</c:when>
			   							<c:otherwise>
			   								<c:if test='${btn.menu.menuId==3&&btn.buttonId==16 }'>
			   									<button type='button' id='inform_document' onclick="informDocument(${doc.documentId })" class="btn btn-danger radius">${btn.buttonName }</button>
			   								</c:if>
			   							</c:otherwise>
		   							</c:choose>
		   						</c:if>
								<c:if test='${btn.menu.menuId==12&&btn.buttonId==14 }'>
		   							<c:if test="${doc.downloadStatus==1 }">
		   								<button type='button' id='lock_document' onclick="lockDocument(${doc.documentId})" class="btn btn-danger radius">${btn.buttonName }</button>
		   							</c:if>
		   						</c:if>
		   						<c:if test='${btn.menu.menuId==12&&btn.buttonId==15 }'>
		   							<c:if test="${doc.downloadStatus==0 }">
		   								<button type='button' id='unlock_document' onclick="unlockDocument(${doc.documentId})" class="btn btn-danger radius">${btn.buttonName }</button>
		   							</c:if>
		   						</c:if>
		   					</c:forEach>
		   				</c:if>
  					</div>
  				</div>
  			</div>
  		</div>
  	</div>
  </body>
</html>
<script>
	function userMessage(_userId){
		$.ajax({
			url:'getUserMessage.action',
			data:{userId:_userId},
			type:"post",
			dataType:"json",
			success:function(data){
				location.href="UserMessage.jsp";
			}
		});
	}
	function lockDocument(_docId){
		$.ajax({
			url:'lockDocument.action',
			data:{documentId:_docId},
			type:"post",
			dataType:"json",
			beforeSend:function(xhr){
				return confirm("确认要锁定吗？");
			},
			success:function(data){
				alert(data.msg);
				location.reload();
			}
		});
	}
	function unlockDocument(_docId){
		$.ajax({
			url:'unlockDocument.action',
			data:{documentId:_docId},
			type:"post",
			dataType:"json",
			beforeSend:function(xhr){
				return confirm("确认要解锁吗？");
			},
			success:function(data){
				alert(data.msg);
				location.reload();
			}
		});
	}
	function informDocument(_docId){
		$.ajax({
			url:'loadDocument.action',
			data:{documentId:_docId},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.status==1){
					location.href="informDocument.jsp";
				}else{
					alert(data.msg);
				}
			}
		});
	}
</script>
