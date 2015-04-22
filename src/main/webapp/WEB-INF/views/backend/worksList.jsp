<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath(); // path=/gallery
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	  <script type="text/javascript" src="<%=basePath%>/script/ajaxfileupload.js"></script>
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
		       
		        datatype:"json", //从服务器返回的数据格式。
		        mtype:"POST",//提交方式
		        height:420,//高度，表格高度。可为数值、百分比或'auto'
		        //width:1000,//这个宽度不能为百分比
		        autowidth:true,//自动宽
		       // cellEdit:true ,
		        colNames:['标题', '描述', '图片名','图片'],
		        editurl: 'works/editWorks.action',
		       datastr: "jsonstring",
		        colModel:[
		           // {name:'id',index:'id', width:'10%', align:'center' },                                
		            {name:'title',index:'title', width:'20%',align:'center',editable:true,edittype:'text'},
		            {name:'description',index:'description', width:'65%',align:'center',editable:true,edittype:'textarea'},
		            {name:'imageurl',index:'imageurl', width:'10%', editable: true},
		           //{name:'createdatetime',index:'createdatetime', width:'35%', align:"center", sortable:false},
		            {name:'img_url',index: 'img_url', editoptions: {enctype: "multipart/form-data"},edittype:'file',width: 50,align: "left",editable: true,formatter:showPicture}
		        ],
		        rownumbers:true,//添加左侧行号
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
		       },
		       onSelectRow: function(id){   
				 
				  if(id && id!==lastSel){   
				         // jQuery('#gridid').restoreRow(lastSel);   
				          lastSel=id;   
				  }   
				
				   //jQuery('#gridid').editRow(id, true);   
				
				}
	   		 });
	   		
	   		 
	   		/**
			jQuery("#del").click( function() {
				var gr = jQuery("#list").jqGrid('getGridParam','selrow');
				if(gr != null)
					jQuery("#list").jqGrid('delGridRow',gr);
				else
					alert("请选择要删除的列");
			});
			*/
			//jQuery("#list").jqGrid('navGrid',"#gridPager");
			
	   		
	   		jQuery("#list").jqGrid('navGrid','#gridPager',  
	   			{edit:true,add:true,del:true,search:true,refresh:true,view:true,addtext:'添加',edittext:' 修改',deltext:'删除',viewtext:'放大'},
	   			{height:380,reloadAfterSubmit:true,url:'works/editWorks.action', afterSubmit: UploadImage,closeAfterEdit:true}, //编辑 		
	    		{height:380,reloadAfterSubmit:true,
	        		url:'works/editWorks.action',afterSubmit: UploadImage,
	        		closeAfterAdd:true}   //添加  		
    	    );
    	  //  jQuery("#list").jqGrid('inlineNav',"#gridPager");
			
	 });
	 
	 function UploadImage(response, postdata) {

	    var data = $.parseJSON(response.responseText);
	    if (data.success == true) {
	        if ($("#img_url").val() != "") {
	            ajaxFileUpload(data.id);
	        }
	      
   		 }  

   		 return [data.success, data.message, data.id];
  		
	}
	 
	function ajaxFileUpload(id) {
	    $("#loading")
	    .ajaxStart(function () {
	        $(this).show();
	    })
	    .ajaxComplete(function () {
	        $(this).hide();
	    });

	    $.ajaxFileUpload
	    (
	        {
	            url: 'works/upload.action',
	            secureuri: false,
	            fileElementId: 'img_url',
	            dataType: 'json',
	            data: { id: '[id]='+id},
	            success: function (data, status) {
	                if (typeof (data.success) != 'undefined') {
	                    if (data.success == true) {
	                        return;
	                    } else {
	                        alert(data.message);
	                    }
	                }
	                else {
	                    return alert('Failed to upload logo!');
	                }
	            },
	            error: function (data, status, e) {
	            	//alert('re:'+data.success);
	                alert(data);
	                alert(status);
	                alert(e);
	                return alert('未知错误');
	            }
	        }
	    )          
    
    }   
    
    
	 function showPicture(cellvalue, options, rowObject){
		return "<img src='http://127.0.0.1:8080/gallery/upload/" +  rowObject.imageurl  + "' height='50' width='50' />";
	 }
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
			<div style="text-align:left">
			<!--  <input type="button" id="del" value="Delete" /> -->
			</div>
		</div>
  	  	<!--  
		<input type="button" id="ed1" value="Edit row 1" />
		-->
		
		
  	  </div>
  </body>
</html>