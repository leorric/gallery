<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println(path);
String imageBasePath = basePath + "/images/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'fakeSmith.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	
		.title {
			text-align:center;
			font-weight:bold;
			font-size:26;
			font-family:arial;
			margin-bottom:30px
		}
		
		.center {
			text-align:center;
			margin-bottom:65px
		}
		
	
		ul li {
			list-style:none;	
			border-right: 1px solid #808080 ;
			padding: 2px 60px 2px 60px; 
			font-weight:bold;
			font-size:12;
			font-family:arial;
			display:inline;
		
		}

		A:link {
		 color: #568444;
		}
		
		A:hover {
		 COLOR: #fff;
		 background-color: #44A500;
		}
		
		.leftBody {
			float:left;
			width:50%;	
			padding-left:130px;
		}
		
		.rightBody {
			float:right;
			width:30%;
			padding-right:100px;
		}
		
		.leftBody .article {
			
			border:2px solid #808080 ;
			margin-bottom:30px;
		}
		
		.leftBody .article .photo {
			text-align:left;
			padding: 10px 10px 10px 10px; 
		}
		
		.leftBody .article .description {
			text-align:left;
			font-size:16;
			font-family:arial;
			margin-bottom:15px;
			padding-left:10px;
		}
		
		.rightBody .post {
			border-top: 5px solid  ;
			margin-top: 10px;
		}
		
		.category {
				font-family:arial;
				font-size:16;
		}
	</style>
  </head>
  
  <body>
  	<div class="title">
  		蛙say作品站22
  	</div>
  	
  	<div class="center" >
    <ul>
    	<li><a href="#">HOME</a></li>
    	<li><a href="#">MY WORK</a></li>
    	<li><a href="#">ABOUT ME</a></li>
    	<li><a href="#">CONTACT ME</a></li>
    </ul>
    </div>
    
    <div class="leftBody">
    	<c:forEach items="${worksList}" var="works">
    	
	    <div class="article">
	    	<div class="description"> <c:out value="${works.title}"/> </div>
	    	<div class="photo">
	  	  		<img src="<%=imageBasePath%>${works.imageurl}" />
	  	  	</div>
	  	  	<div class="description"><c:out value="${works.description}"/></div>
	    </div>
	    </c:forEach>
	     
    </div>
    <div class="rightBody">
	    <div class="category">
	    	Featured Posts
	    </div>
	    <div class="post">
	    	<img src="<%=imageBasePath%>mybatis.jpg"/>
	    	anything here..
	    	<img src="<%=imageBasePath%>mybatis.jpg"/>
	    	anything here..
	    </div>
    </div>
  </body>
</html>
