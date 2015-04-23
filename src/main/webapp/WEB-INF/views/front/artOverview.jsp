<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String imageUploadPath = basePath + "upload/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'artOverview.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="StyleSheet" type="text/css" href="<%=basePath%>/styles/common.css" />


  </head>
  
  <body>
  	 <%@ include file="../common/header.jsp"%>
    This is my JSP page. <br>
    <MARQUEE behavior="scroll" direction="left" onMouseOut="this.start()"  onMouseOver="this.stop()" scrollamount="3" width="100">
    <c:forEach items="${worksList}" var="works">
    	<img src="<%=imageUploadPath%>${works.imageurl}" width="50" height="50"/>
    </c:forEach>
    </MARQUEE>

  </body>
</html>
