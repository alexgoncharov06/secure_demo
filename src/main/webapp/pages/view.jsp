<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.String" %>
<%@ page import="com.goncharov.secure.entity.User" %>
<%@ page import="com.goncharov.secure.entity.interfaces.BaseID" %>

	<%
	String base = (String) request.getParameter("base_Id");
%>
	<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
   <title>Просмотр текущих значений</title>
   <!---<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->

  
    <link type="text/css" rel="stylesheet" href="./pages/css/main.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
	 <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.light_blue-red.min.css" />
    <!--<link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.indigo-pink.min.css">-->
    <script src="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">



	<script type="text/javascript" src="./pages/js/mainViewJS.js"></script>

<script >
   baseId = '<%=base%>';
   var baseList = [];
   <%
   
   User currentUser = (User) request.getAttribute("user");
   List<BaseID> listBase = currentUser.getBaseIdSet();
   String role = (String) currentUser.getRole().toString();
   
   int i = 1;
for (BaseID baseID : listBase){
	   
	   String baseString = baseID.getBaseID();
   	
   %>
   baseList[<%=i%>] = "<%=baseString %>";<%
   i++;
   } %>
   var userRole = "<%=role %>";
   
</script>
<%@include file="./header.jsp" %>
</head>
<body onload="onLoad()">
<sec:authorize access="!isAuthenticated()">
            <p><a class="btn btn-lg btn-success" href="<c:url value="/login" />" role="button">Войти</a></p>
        </sec:authorize>
        
        <sec:authorize access="isAuthenticated()">
<div class="otstup"></div>

<div class="container">
<div id="table_sensors_data" class="block-center">


    </div>
</div>
   
    </sec:authorize>
<div class="footer">&copy; AlexWolfGoncharov, 2015</div>

</body>
</html>
