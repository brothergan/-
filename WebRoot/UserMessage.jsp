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
    
    <title>用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
        <script src="assets/js/typeahead-bs2.min.js"></script>
       
		<!-- page specific plugin scripts -->
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="js/H-ui.js"></script> 
        <script type="text/javascript" src="js/H-ui.admin.js"></script> 
        <script src="assets/layer/layer.js" type="text/javascript" ></script>
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
         <script src="assets/dist/echarts.js"></script>
         <script src="js/lrtk.js" type="text/javascript"></script>
  </head>
  
  <body>
  	<div class="clearfix">
  		<div class="admin_info_style">
  			<div class="admin_modify_style" id="Personal">
				<div class="type_title">用户信息 </div>
				<div class="xinxi">
					<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">用户名： </label>
  						<div class="col-sm-9">
  							<input type="text" name="用户名" id="website-title" value="${user.userLoginName }" class="col-xs-7 text_info" disabled="disabled" />
  						</div>
  					</div>
  					<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">性别： </label>
  						<div class="col-sm-9">
  							<span class="sex">
  								<c:choose>
							    	<c:when test="${detail.sex==1 }">男</c:when>
							    	<c:otherwise>女</c:otherwise>
							    </c:choose>
  							</span>
  						</div>
  					</div>
  					<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">电话号码： </label>
  						<div class="col-sm-9">
  							<input type="text" name="用户名" id="website-title" value="${detail.telephone }" class="col-xs-7 text_info" disabled="disabled" />
  						</div>
  					</div>
  					<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">邮箱： </label>
  						<div class="col-sm-9">
  							<input type="text" name="用户名" id="website-title" value="${detail.mail }" class="col-xs-7 text_info" disabled="disabled" />
  						</div>
  					</div>
  					<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">用户签名： </label>
  						<div class="col-sm-9">
  							<input type="text" name="用户名" id="website-title" value="${detail.sign }" class="col-xs-7 text_info" disabled="disabled" />
  						</div>
  					</div>
				
					<div class="Button_operation clearfix">
  						<c:if test='${not empty buttons }'>
		   					<c:forEach items='${buttons }' var='btn'>
								<c:if test='${btn.menu.menuId==3&&btn.buttonId==17 }'>
		   							<button type='button' id='inform_user' onclick="informUser(${user.userId })" class="btn btn-danger radius">${btn.buttonName }</button>
		   						</c:if>
		   						<c:if test='${btn.menu.menuId==10&&btn.buttonId==12 }'>
		   							<c:if test="${user.userStatus==1 }">
		   								<button type='button' id='suspend_user' onclick="suspendUser(${user.userId})" class="btn btn-danger radius">${btn.buttonName }</button>
		   							</c:if>
		   						</c:if>
		   						<c:if test='${btn.menu.menuId==10&&btn.buttonId==13 }'>
									<c:if test="${user.userStatus==0 }">
										<button type='button' id='active_user' onclick="activeUser(${user.userId})" class="btn btn-danger radius">${btn.buttonName }</button>
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
<script type="text/javascript">
	function informUser(_userId){
		location.href="informUser.jsp";
	}
	function suspendUser(_id){
		$.ajax({
			url:'suspendUser.action',
			data:{userId:_id},
			type:"post",
			dataType:"json",
			beforeSend:function(xhr){
				return confirm("确认要禁用吗？");
			},
			success:function(data){
				alert(data.msg);
				location.reload();
			}
		});
	}
	function activeUser(_id){
		$.ajax({
			url:'activeUser.action',
			data:{userId:_id},
			type:"post",
			dataType:"json",
			beforeSend:function(xhr){
				return confirm("确认要激活吗？");
			},
			success:function(data){
				alert(data.msg);
				location.reload();
			}
		});
	}
</script>