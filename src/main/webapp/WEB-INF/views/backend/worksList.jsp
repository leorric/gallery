<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println(path);
String imageBasePath = basePath + "/images/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
   
  <head>
	  <title>后台管理</title>
	  <!-- 这里href使用了绝对路径! -->
	  
	  <link rel="StyleSheet" type="text/css" href="<%=basePath%>/styles/common.css" />
	  <link rel="stylesheet" type="text/css" media="screen" href="<%=basePath%>/styles/themes/redmond/jquery-ui-1.8.2.custom.css" />
	  <link rel="StyleSheet" type="text/css" href="<%=basePath%>/styles/themes/ui.jqgrid.css" />
	 
	  <script type="text/javascript" src="<%=basePath%>/script/jquery-1.8.3.min.js"></script>
	  
	  <script type="text/javascript" src="<%=basePath%>/script/jquery.jqGrid.js"></script>
	  <script type="text/javascript" src="<%=basePath%>/script/grid.celledit.js"></script>
	  <script type="text/javascript" src="<%=basePath%>/script/i18n/grid.locale-cn.js"></script>
	  
	  <!-- 若写成下列形式，无效果，why? -->
	  <!-- <script type="text/javascript" src="<%=basePath%>/script/i18n/grid.locale-cn.js"/>  -->
	  
	  
 	  <style>
	
		.worksTable {
			width:75%;
			//text-align:center;
			margin-left: auto;
			margin-right: auto;
		}
	 </style>
	 
	<script type="text/javascript">
	 $(document).ready(function(){
	 		var lastSel;  
		 	$("#list").jqGrid({
		        url:"works/listWorks.action",
		       
		        datatype:"json", //数据来源，本地数据
		        mtype:"POST",//提交方式
		        height:420,//高度，表格高度。可为数值、百分比或'auto'
		        //width:1000,//这个宽度不能为百分比
		        autowidth:true,//自动宽
		       // cellEdit:true ,
		        colNames:['标题', '描述', 'URL','操作'],
		        editurl: 'works/editWorks.action',
		       
		        colModel:[
		           // {name:'id',index:'id', width:'10%', align:'center' },                                
		            {name:'title',index:'title', width:'20%',align:'center',editable:true,edittype:'text'},
		            {name:'description',index:'description', width:'15%',align:'center',editable:true},
		            {name:'imageurl',index:'imageurl', width:'20%', align:"center"},
		           //{name:'createdatetime',index:'createdatetime', width:'35%', align:"center", sortable:false}
		            {name:'del',index:'del', width:'10%',align:"center", sortable:false}
		        ],
		        rownumbers:true,//添加左侧行号
		        //altRows:true,//设置为交替行表格,默认为false
		        //sortname:'createDate',
		        //sortorder:'asc',
		        viewrecords: true,//是否在浏览导航栏显示记录总数
		        rowNum:15,//每页显示记录数
		        rowList:[15,20,25],//用于改变显示行数的下拉列表框的元素数组。
		        jsonReader:{
		            //id: "blackId",//设置返回参数中，表格ID的名字为blackId
		           repeatitems : false,
		           root: "list" 
		           //total: "total",
		           //page : "page"
		        },
		       pager:$('#gridPager'),
		       caption: "My Works",//表格名称
		       serializeEditData: 'true',
               
		       loadComplete: function(){
		       		var re_records = $("#list").getGridParam('records');
		       },
		       error:function(e){ 
		       	   alert('err');
		       },
		       onSelectRow: function(id){   
				 
				  if(id && id!==lastSel){   
				         // jQuery('#gridid').restoreRow(lastSel);   
				          lastSel=id;   
				  }   
				
				   //jQuery('#gridid').editRow(id, true);   
				
				}
	   		 });
	   		 
	   		 jQuery("#ed1").click( function() {
				jQuery("#list").jqGrid('editRow',"1");
				this.disabled = 'true';
				jQuery("#sved1").attr("disabled",false);
			});
			
			 jQuery("#sved1").click( function() {
				jQuery("#list").jqGrid('saveRow',"1");
				//this.disabled = 'true';
				//jQuery("#sved1,#cned1").attr("disabled",false);
			});
			
			jQuery("#list").jqGrid('navGrid',"#gridPager",{edit:false,add:false,del:false});
			jQuery("#list").jqGrid('inlineNav',"#gridPager");
	   		
	 });
	 
	 
   </script>
	   
	  
  </head>
 
  <body>
  	  <%@ include file="../common/header.jsp"%>
  	  <div class="center">

		<!-- jqGrid table list4 -->
		<div class="worksTable">
			<table id="list"></table>
			<!-- jqGrid 分页 div gridPager -->
			<div id="gridPager"></div>
		</div>
  	  	<!--  
		<input type="button" id="ed1" value="Edit row 1" />
		<input type="button" id="sved1" disabled='true' value="Save row 1" />
		-->
  	  </div>
  </body>
</html>