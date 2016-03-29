<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
      <title>Редактирование данных по объектам</title>
<%@include file="./header.jsp" %>
	 <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">


    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
   
	<link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>

	<link type="text/css" rel="stylesheet" href="./pages/css/main.css">

    <!-- Latest compiled and minified JavaScript -->
   
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

    <!---<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
	
	
    <!-- <link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.indigo-pink.min.css"> -->
    <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">



<script type="text/javascript" src="./pages/js/editJs.js"></script>
</head>
<body onload = "createTableSelectBaseId()">

  <sec:authorize access="!isAuthenticated()">
  
<br>
<br>
<br>
            <p><a class="btn btn-lg btn-success" href="<c:url value="/login" />" role="button">Войти</a></p>
        </sec:authorize>
         <sec:authorize access="isAuthenticated()">
       


<div class="container otstup">
<div  role="alert" id="message"></div>

<H2 class="text-center">Редактирование данных по объектам</H2>
<div id="buttonBack"></div>



<div id="forecast"></div>
<form name = "data">
    <div id="table_sensors_data"></div>
</form>

<br>

</div>






<div class="footer">
<!-- Colored mini FAB button -->
	<div id="button_panel" style="padding-bottom: 10px;">
	    </div>

</sec:authorize>

<div class="footer">&copy; AlexWolfGoncharov, 2015</div>
</div>
</body>
</html>
