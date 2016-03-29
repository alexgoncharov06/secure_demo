<%@page import="com.goncharov.secure.entity.UserRoleEnum"%>
<%@page import="com.goncharov.secure.entity.interfaces.BaseID"%>
<%@page import="com.goncharov.secure.dao.Factory"%>
<%@page import="com.goncharov.secure.dao.BaseIdDao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>


<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>



 
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
 
    <title>Spring Security</title>
 
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/pages/css/bootstrap.css" />" rel="stylesheet">
 
    <!-- Custom styles for this template -->
    <link href="<c:url value="/pages/css/signin.css" />" rel="stylesheet">
    
    <link href="<c:url value="/pages/css/main.css" />" rel="stylesheet">
 
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
 
<body>
<%@include file="./header.jsp" %>
<sec:authorize access="!isAuthenticated()">
            <p><a class="btn btn-lg btn-success" href="<c:url value="/login" />" role="button">Войти</a></p>
</sec:authorize>

 <sec:authorize access="isAuthenticated()">
 
<div class="container" style="width: 500px;">
    
    <form  method="post" action="./add" >
        <h2 class="form-signin-heading">Добавить нового пользователя</h2>
        <input type="text" class="form-control" name="login" placeholder="Login" required autofocus style="width: 400px;"> 
        <input type="password" class="form-control"   name="password" placeholder="Password" required style="width: 400px;">
        <select  class="form-control" name="role" style="width: 400px;">
        <% 
        String roles [] = {"ADMIN","DISPATCHER","USER"};
        // int lengthEnum = UserRoleEnum.values().length;
        
        
        for(int i = 0; i < roles.length; i++){
            %>
            <option value="<%= roles[i] %>" 
            <% if (roles[i].equals("USER")) { %> 
                selected="selected" 
                <%}%>
                >
                <%=roles[i]  %></option>
            <% 
        }
        %>
        </select>
       
       
       <input type="text" class="form-control" name="company" placeholder="Company" required  style="width: 400px;"> 
        
         
        <button class="btn btn-lg btn-success btn-block" type="submit" style="width: 400px;">Сохранить</button>
    </form>
    
    
    
    
</div>
</sec:authorize>
 
</body>
</html>