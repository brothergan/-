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
    
    <title>我的文档</title>
    
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
	<script>
		function onPage(_type){
			var pageIndex=parseInt($("#pageIndex").val());
			var pageCount=parseInt($("#pageCount").val());
			if(_type==1){//首页
				if(pageIndex==1){
					alert("当前页已经是首页");
				}else{
					query(1);
				}
			}else if(_type==2){//上一页
				if(pageIndex>1){
					query(pageIndex-1);
				}else{
					alert("当前页已经是首页");
				}
			}else if(_type==3){//下一页
				if(pageIndex<pageCount){
					query(pageIndex+1);
				}else{
					alert("当前页已经是末页");
				}
			}else if(_type==4){//末页
				if(pageIndex==pageCount){
					alert("当前页已经是末页");
				}else{
					query(pageCount);
				}
			}
		}
		$(function(){
			query(1);
		});
		function query(_pageIndex){
				$.ajax({
					url:"annotationList.action",
					data:{pageIndex:_pageIndex},
					type:"post",
					dataType:"json",
					error:function(data){
						alert(data);
					},
					success:function(data){
						$("#labPageIndex").html(data.pageIndex);
						$("#labPageCount").html(data.pageCount);
						$("#labTotalCount").html(data.totalCount);
						$("#labPageSize").html(data.pageSize);
						
						$("#pageIndex").val(data.pageIndex);
						$("#pageCount").val(data.pageCount);
						
						var html=[];
						if(data.list && data.list.length>0){
							var templateTr=$("#template").html();
							$.each(data.list,function(i,ele){
								var _tr=templateTr;
								_tr=_tr.replace(/{annotationId}/g,ele.annotationId);
								_tr=_tr.replace(/{annotationTitle}/g,ele.annotationTitle);
								_tr=_tr.replace(/{annotationDate}/g,ele.annotationDate);
								html.push(_tr);
							});
						}else{
							html.push("<tr><td colspan='3'>没有找到数据</td></tr>");
						}
						$("#tbody").html(html.join(""));
					}
				});
			}
	</script>
  </head>
  
  <body>
  	<div class="page-content clearfix">
  		<div id="brand_style">
  			<div class="sort_list">
  				<table id="Document_table" class="table table-striped table-bordered table-hover">
			   		<thead>
			   			<tr>
			   				<th>公告编号</th>
			   				<th>公告标题</th>
			   				<th>公告发布日期</th>
			   			</tr>
			   		</thead>
			   		<tbody id="tbody">
			   		</tbody>
			   		<tfoot id="template" style="display:none">
			   			<tr>
			   				<td>{annotationId}</td>
			   				<td>
			   				<a href="javascript:annotationInfo({annotationId})">
			   					{annotationTitle}
			   				</a>
			   				</td>
			   				<td>{annotationDate}</td>
			   			</tr>
			   		</tfoot>
			   	</table>
			   	<div>
			    	<input type="hidden" id="pageIndex" value="" />
			    	<input type="hidden" id="pageCount" value="" />
					<a href="javascript:onPage(1);" class="btn btn-xs btn-success">首页</a>
					<a href="javascript:onPage(2);" class="btn btn-xs btn-success">上一页</a>
			
					<a href="javascript:onPage(3);" class="btn btn-xs btn-success">下一页</a>
					<a href="javascript:onPage(4);" class="btn btn-xs btn-success">末页</a> 
			
			    	当前<label id="labPageIndex"></label>/
			    	<label id="labPageCount"></label>页，
			    	总记录数<label id="labTotalCount"></label>条记录，
			    	每页显示<label id="labPageSize"></label>条
			    </div>
  			</div>
  		</div>
  	</div>
  </body>
</html>
<script type="text/javascript">
	function annotationInfo(_annId){
		$.ajax({
			url:'loadAnnotation.action',
			data:{annotationId:_annId},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.status==1){
					/* location.href="AnnotationInfo.jsp"; */
					layer_show("公告细节","AnnotationInfo.jsp",'410','510');
				}else{
					alert(data.msg);
				}
			}
		});
	}
</script>