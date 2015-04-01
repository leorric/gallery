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
	  
	  <script type="text/javascript" src="<%=basePath%>/script/jquery.jqGrid.min.js"></script>
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
	 		
		 	$("#list").jqGrid({
		        url:"works/listWorks.action",
		        datatype:"json", //数据来源，本地数据
		        mtype:"POST",//提交方式
		        height:420,//高度，表格高度。可为数值、百分比或'auto'
		        //width:1000,//这个宽度不能为百分比
		        autowidth:true,//自动宽
		        colNames:['标题', '描述', 'URL','操作'],
		        colModel:[
		           // {name:'id',index:'id', width:'10%', align:'center' },
		            {name:'title',index:'title', width:'20%',align:'center'},
		            {name:'description',index:'description', width:'15%',align:'center'},
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
		       loadComplete: function(){
		       		var re_records = $("#list").getGridParam('records');
		       },
		       error:function(e){ 
		       	   alert('err');
		       }
	   		 });
	   		 
	   		 var mydata = [  
                {id:"1",title:"AA",description:"bb",imageurl:"/a/b",createdatetime:"2007-10-01"}
              
           
            ];  
            for(var i=0;i<=mydata.length;i++){  
                jQuery("#list").jqGrid('addRowData',i+1,mydata[i]);  
            }  
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
  	  	
  	  </div>
  </body>
</html>