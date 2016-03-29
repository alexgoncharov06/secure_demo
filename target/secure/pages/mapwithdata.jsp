<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.String" %>
<%@ page import="com.goncharov.secure.entity.User" %>
<%@ page import="com.goncharov.secure.entity.interfaces.BaseID" %>
<!DOCTYPE html>
<html lang="en">
<head>


    <meta charset="UTF-8">
    <title>Мониторинг показаний датчиков</title>
    <%@include file="./header.jsp" %>

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<link type="text/css" rel="stylesheet" href="./pages/css/main.css">
	

	
	
	
	
	<link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>
 
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 

	<script type="text/javascript" src="./pages/js/mapWithdata.js"></script>
    <!--<link rel="import" href="./menu.html">-->
 <!-- <sec:authentication var="user" property="principal" /> -->

<script >
 
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


   



  
</head>
<body onload="onLoad()">

<sec:authorize access="!isAuthenticated()">
            <p><a class="btn btn-lg btn-success" href="<c:url value="/login" />" role="button">Войти</a></p>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">




<div id="type_of_map_text" class="select_table">
    
                <select id="typeMap" onchange="showAllChange()">
                    <option disabled>Выберите тип карты</option>
                    <option value="all">Все записи</option>
                    <option value="errors">Только ошибки</option>
                </select>
           


</div>
<div class="main">
</div>


<div id="map" class="map"></div>


</sec:authorize>
<div class="footer" style="background-color: whitesmoke;  padding: 3px;">&copy; AlexWolfGoncharov, 2015</div>

</body>
</html>
