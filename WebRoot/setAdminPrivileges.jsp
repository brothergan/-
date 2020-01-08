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
    
    <title>管理员授权</title>
    
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
        <script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>           	
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="js/dragDivResize.js" type="text/javascript"></script>
	<script>
		function selectAll(checkedValue){
    		$("input[type=checkbox][name=resourceIds]").prop("checked", checkedValue);
    	}
    	function doChecked( liID, checkedValue ){
			// 当前点击的checkbox元素所在的li元素
    		var jLi = $("#" + liID);

    		// 选中所有的直属下级。（children()方法是筛选下一级，find()是筛选所有后代）
    		jLi.children("ul").find("input[type=checkbox]").prop("checked", checkedValue);
    		
    		// 选中或取消选中直属上级
    		if( checkedValue ){ // checkedValue是boolean型，表示是否选中了当前复选框
    			// 如果当前是选中，则选中所有的直属上级
				jLi.parents("li").children("input[type=checkbox]").prop("checked", checkedValue);
			}else{
				// 如果当前是取消选中，并且同级中没有被选中的项，则也取消上级的选中状态
				var jCheckedSibingCB = jLi.siblings("li").children("input[type=checkbox]:checked");
				if(jCheckedSibingCB.size() == 0){
					var jCheckboxInput = jLi.parent("ul").prev("input[type=checkbox]");
					jCheckboxInput.prop("checked", checkedValue);
					
					// 递归操作每一层直属上级
					var jParentLi = jCheckboxInput.parent("li");
					if(jParentLi.size() > 0){
						doChecked(jParentLi.prop("id"), checkedValue);
					}
				}
			}
    	} 
	</script>
  </head>
  
  <body>
  	<div class="Competence_add_style clearfix">
  		<div class="left_Competence_add">
  			<div class="title_name">权限设置</div>
  			<div class="Competence_add">
  				<div class="form-group">
  					<div class="col-sm-9">
  						<label class="middle"><input class="ace" type="checkbox" id="cbSelectAll" onclick="selectAll(this.checked)" /><span class="lbl">全选</span></label>
  					</div>
  				</div>
  				<div class="Button_operation">
  					<input type="hidden" id="roleType" value="${roleType }"/><input type="hidden" id="roleId" value="${roleId }"/>
  					<button type="button" id="update_privileges" class="btn btn-secondary  btn-warning" >修改权限</button>
  				</div>
  			</div>
  		</div>
  		<div class="Assign_style">
  			<div class="title_name">权限分配</div>
  			<div class="Select_Competence">
  				<c:if test="${not empty menuList }">
				    <ul>
				    	<c:forEach items="${menuList }" var="m1">
				   			<c:if test="${m1.menuId>=7 }">
				   				<c:if test="${m1.parentMenu.menuId==1 }">
				   					<li id="li_${m1.menuId }"><input type="checkbox" value="menu_${m1.menuId }" id="cb_${m1.menuId }" onclick="doChecked('li_${m1.menuId}',this.checked)" name="resourceIds" ${m1.menuStatus==1?"checked='checked'":"" } />${m1.menuName }
				   						<c:forEach items="${menuList }" var="m2">
				   							<c:if test="${m2.menuId>=7&&m2.parentMenu.menuId==m1.menuId }">
				   								<ul>
					   								<li id="li_${m2.menuId }"><input type="checkbox" value="menu_${m2.menuId }" id="cb_${m2.menuId }" onclick="doChecked('li_${m2.menuId}',this.checked)" name="resourceIds" ${m2.menuStatus==1?"checked='checked'":"" } />${m2.menuName }
					   									<c:if test="${not empty buttonList }">
										  					<ul>
										  						<c:forEach items="${buttonList }" var="b">
										  							<c:if test="${b.menu.menuId==m2.menuId }">
										  								<li id="li_${m2.menuId }_${b.buttonId }"><input type="checkbox" value="button_${b.buttonId }" id="cb_${m2.menuId }_${b.buttonId }" onclick="doChecked('li_${m2.menuId }_${b.buttonId }',this.checked)" name="resourceIds" ${b.buttonStatus==1?"checked='checked'":"" } />${b.buttonName }</li>
										  							</c:if>
										  						</c:forEach>
										  					</ul>
										  				</c:if>
					   								</li>
				   								</ul>
				   							</c:if>
				   						</c:forEach>
					  				</li>
				   				</c:if>
				   			</c:if>
				    	</c:forEach>
				    </ul>
			    </c:if>
  			</div>
  		</div>
  	</div>
  </body>
</html>
<script>
	$(".left_Competence_add,.Competence_add_style").height($(window).height()).val();; 
 $(".Assign_style").width($(window).width()-500).height($(window).height()).val();
 $(".Select_Competence").width($(window).width()-500).height($(window).height()-40).val();
	$("#update_privileges").click(function(){
		var checkedItems="";
		$("input[type=checkbox][name=resourceIds]:checked").each(function(i){
			if(i==0){
				checkedItems+=$(this).val();
			}else{
				checkedItems+=("/"+$(this).val());
			}
		});
		$.ajax({
			url:'updatePrivileges.action',
			data:{
				roleType:$("#roleType").val(),
				roleId:$("#roleId").val(),
				newPrivileges:checkedItems
			},
			type:"post",
			dataType:"json",
			beforeSend:function(xhr){
				alert("修改管理员权限后，下次使用该账号登陆，修改生效");
			},
			success:function(data){
				alert(data.msg);
			}
		});
	});
</script>