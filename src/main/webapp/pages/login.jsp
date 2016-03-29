<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
 
    <title>Login to Dispatcher</title>
    <script
  src="./pages/js/jquery.js"></script>

     <script src="./pages/js/jquery.js"></script>
    <script>window.jQuery || document.write('<script src="./pages/js/jquery.js"><\/script>')</script>
<script
  src="./pages/js/jquery-ui.min.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 
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
 
<div class="container jumbotron center" style="width: 350px;">
<div id="logo">

<!-- <img alt="Brand"  style= "width: 65%; background-size: contain;"src="<c:url value="/pages/img/logo.png" />"> -->

<img alt="Brand"   class="img-responsive" src="<c:url value="/pages/img/logo.png" />">
<h2> Dispatcher
</h2>
</div>
<c:if test="${param.error != null}">
    <div class="alert alert-warning alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Внимание!</strong> Возникла ошибка при авторизации в систему. <br><br>Проверьте Ваш логин/пароль и повторите попытку. В случае повторных ошибок обратитесь к нам.
</div>
</c:if>

    <c:url value="/j_spring_security_check" var="loginUrl" />
    <form action="${loginUrl}" method="post">
        <!-- <h3 class="form-signin-heading">Вход</h3> -->
        <input type="text" class="form-control" name="j_username" placeholder="Login" required autofocus>
        <input type="password" class="form-control" name="j_password" placeholder="Password" required>
        <br/>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
    </form>
</div>
 
</body>
</html>