<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>

<html>
  <head>
	  <title>登陆</title>
	  <link rel="StyleSheet"  type="text/css" href="styles/common.css" />
  </head>
  <body>
  	  <%@ include file="common/header.jsp"%>
  	  <div class="center">
  	  	
  	    <form method="POST">
 		 用户名: <input type="text" name="account"/> <br/><br/>
 		 密码: &nbsp; <input type="password" name="password"/> <br/><br/>
 		
  		<input type="submit" value="登陆" />
  	  </form>
  	  </div>
  </body>
</html>