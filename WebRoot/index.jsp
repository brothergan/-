<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>在线文档管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
<link rel="stylesheet" href="css/style.css" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
<script src="assets/js/ace-extra.min.js"></script>
<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
<!--[if !IE]> -->
<script src="js/jquery-1.9.1.min.js"></script>
<!-- <![endif]-->
<!--[if IE]>
         <script type="text/javascript">window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");</script>
        <![endif]-->
        <script type="text/javascript">
	if ("ontouchend" in document)
		document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
				+ "<"+"script>");
</script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<script>
	jQuery(document).ready(function(){
		//初始化宽度、高度    
		$("#main-container").height($(window).height() - 76);
		$("#iframe").height($(window).height() - 140);

		$(".sidebar").height($(window).height() - 99);
		var thisHeight = $("#nav_list").height(
				$(window).outerHeight() - 173);
		$(".submenu").height();
		$("#nav_list").children(".submenu").css("height",
				thisHeight);

		//当文档窗口发生改变时 触发  
		$(window).resize(function() {
			$("#main-container").height(
					$(window).height() - 76);
			$("#iframe").height(
					$(window).height() - 140);
			$(".sidebar").height(
					$(window).height() - 99);

			var thisHeight = $("#nav_list").height(
					$(window).outerHeight() - 173);
			$(".submenu").height();
			$("#nav_list").children(".submenu").css(
					"height", thisHeight);
		});
		$(".dropdown-toggle").click(function(){
                var cid = $(this).attr("name");
                $("#iframe").attr("src",cid);	
      	});
      	//时间设置
		 function currentTime(){ 
		    var d=new Date(),str=''; 
		    str+=d.getFullYear()+'年'; 
		    str+=d.getMonth() + 1+'月'; 
		    str+=d.getDate()+'日'; 
		    str+=d.getHours()+'时'; 
		    str+=d.getMinutes()+'分'; 
		    str+= d.getSeconds()+'秒'; 
		    return str; 
		} 
setInterval(function(){$('#time').html(currentTime)},1000); 
	});
</script>
  </head>
  
  <body>
  	<div class="navbar navbar-default" id="navbar">
  		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand">
					<h1>
						<i class="icon-leaf green"></i>
						<span class="white">在线文档管理系统</span>
					</h1>
					<h4 class="white">Document Manage System</h4>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->
			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <span class="time"><em
								id="time"></em></span><span class="user-info"><small>欢迎光临,</small>
							<s:if test="#session.loginAdmin==null"></s:if>
						    <s:else>${loginAdmin.adminId }</s:else>
						    <s:if test="#session.loginUser==null"></s:if>
						    <s:else>${loginUser.userLoginName }</s:else>
						</span> <i class="icon-caret-down"></i>
					</a>
						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li class="divider"></li>
							<li><a href="quit.action" id="Exit_system"><i
									class="icon-off"></i>退出</a></li>
						</ul></li>
				</ul>
				<!-- <div class="right_info">
                 
                   <div class="get_time" ><span id="time" class="time"></span>欢迎光临,管理员</span></div>
					<ul class="nav ace-nav">	
						<li><a href="javascript:ovid(0)" class="change_Password">修改密码</a></li>
                        <li><a href="javascript:ovid(0)" id="Exit_system">退出系统</a></li>
                       
					</ul>
				</div>-->
			</div>
		</div>
  	</div>
  	<div class="main-container" id="main-container">
  		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>
			<div class="sidebar" id="sidebar" style="height:583px;">
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'fixed')
					} catch (e) {
					}
				</script>
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						在线文档管理系统</div>
					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>
						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>
				<ul class="nav nav-list" id="nav_list">
					<c:if test="${not empty menus }">
				  		<c:forEach items="${menus }" var="menu1" >
				  			<c:if test="${menu1.parentMenu.menuId==1 }" >
				  				<li><a href="javascript:void(0)" class="dropdown-toggle" name="${menu1.menuUrl }" title="${menu1.menuName }"><span
											class="menu-text">${menu1.menuName }</span></a></li>
				  				<c:if test="${menu1.childMenus.size()>0 }">
				  					<ul class="nav nav-list" id="nav_list">
				  						<c:forEach items="${menus }" var="menu2">
				  							<c:if test="${menu2.parentMenu.menuId==menu1.menuId }">
				  								<li><a href="javascript:void(0)" class="dropdown-toggle" name="${menu2.menuUrl }" title="${menu2.menuName }"><i
														class="icon-double-angle-right"></i><span
											class="menu-text">${menu2.menuName }</span></a></li>
				  							</c:if>
				  						</c:forEach>
				  					</ul>
				  				</c:if>
				  			</c:if>
				  		</c:forEach>
				  	</c:if>
				</ul>
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed')
					} catch (e) {
					}
				</script>
			</div>
			<div class="main-content">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <a href="index.jsp">首页</a>
						</li>
						<li class="active"><span class="Current_page iframeurl"></span></li>
						<li class="active" id="parentIframe"><span
							class="parentIframe iframeurl"></span></li>
						<li class="active" id="parentIfour"><span
							class="parentIfour iframeurl"></span></li>
					</ul>
				</div>
				<s:if test="#session.loginAdmin==null"></s:if>
				<s:else><iframe id="iframe"
					style="border:0; width:100%; background-color:#FFF;" name="iframe"
					frameborder="0" src="updatePassword-Admin.jsp"> </iframe></s:else>
				<s:if test="#session.loginUser==null"></s:if>
				<s:else><iframe id="iframe"
					style="border:0; width:100%; background-color:#FFF;" name="iframe"
					frameborder="0" src="myDocument.jsp"> </iframe></s:else>
			</div>
			<div class="ace-settings-container" id="ace-settings-container">
				<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
					id="ace-settings-btn">
					<i class="icon-cog bigger-150"></i>
				</div>

				<div class="ace-settings-box" id="ace-settings-box">
					<div>
						<div class="pull-left">
							<select id="skin-colorpicker" class="hide">
								<option data-skin="default" value="#438EB9">#438EB9</option>
								<option data-skin="skin-1" value="#222A2D">#222A2D</option>
								<option data-skin="skin-2" value="#C6487E">#C6487E</option>
								<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
							</select>
						</div>
						<span>&nbsp; 选择皮肤</span>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-sidebar" /> <label class="lbl"
							for="ace-settings-sidebar"> 固定滑动条</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-rtl" /> <label class="lbl"
							for="ace-settings-rtl">切换到左边</label>
					</div>

					<div>
						<input type="checkbox" class="ace ace-checkbox-2"
							id="ace-settings-add-container" /> <label class="lbl"
							for="ace-settings-add-container"> 切换窄屏 <b></b>
						</label>
					</div>
				</div>
			</div>
		</div>
  	</div>
  	<div class="footer_style" id="footerstyle">
		<p class="l_f">版权所有：广东外语外贸大学 王怡健 所有</p>
		<p class="r_f">地址：广东外语外贸大学 邮编：510006 技术支持：java</p>
	</div>
    <%-- 欢迎
    <s:if test="#session.loginAdmin==null"></s:if>
    <s:else>${loginAdmin.adminId }</s:else>
    <s:if test="#session.loginUser==null"></s:if>
    <s:else>${loginUser.userLoginName }</s:else>
  登陆。 <br>
	  <ul>
	  	<s:if test="#session.menus!=null">
		  	<s:iterator value="#session.menus">
			  	<s:if test="parentMenu.menuId==1">
			  		<li><s:property value="menuName"/>
			  		<s:if test="childMenus.size()>0">
			  			<ul>
			  				<s:iterator value="childMenus">
			  					<li><s:property value="menuName"/></li>
			  				</s:iterator>
			  			</ul>
			  		</s:if>
			  	</s:if>
		  	</s:iterator>
	  	</s:if>
	  	<c:if test="${not empty menus }">
	  		<c:forEach items="${menus }" var="menu1" >
	  			<c:if test="${menu1.parentMenu.menuId==1 }" >
	  				<li><a href="${menu1.menuUrl }">${menu1.menuName }</a></li>
	  				<c:if test="${menu1.childMenus.size()>0 }">
	  					<ul>
	  						<c:forEach items="${menus }" var="menu2">
	  							<c:if test="${menu2.parentMenu.menuId==menu1.menuId }">
	  								<li><a href="${menu2.menuUrl }">${menu2.menuName }</a></li>
	  							</c:if>
	  						</c:forEach>
	  					</ul>
	  				</c:if>
	  			</c:if>
	  		</c:forEach>
	  	</c:if>
	  </ul>   --%>
  </body>
</html>
