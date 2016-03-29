<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link
        href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300'
        rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.green-red.min.css" />
<!--<link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-red.min.css" />
<link rel="stylesheet" href="https://storage.googleapis.com/code.getmdl.io/1.0.4/material.indigo-pink.min.css">-->
<!-- Bootstrap core CSS -->
<link href="<c:url value="/pages/css/bootstrap.css" />" rel="stylesheet">


<!-- Custom styles for this template -->
<!--   <link href="https://getbootstrap.com/examples/navbar-fixed-top/navbar-fixed-top.css" rel="stylesheet"> -->


<!-- Custom styles for this template -->
<link href="./pages/js/bootstrap.js" rel="text/javascript">





<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script
        src="./pages/js/jquery.js"></script>

<script src="./pages/js/jquery.js"></script>
<script>window.jQuery || document.write('<script src="./pages/js/jquery.js"><\/script>')</script>
<script
        src="./pages/js/jquery-ui.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>



<sec:authentication var="user" property="principal" />

<script
        src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<link rel="stylesheet"
      href="https://fonts.googleapis.com/icon?family=Material+Icons">

<nav class ="navbar navbar-fixed-top navbar-default" >
    <!-- <div class="header" style="heigth:75px"> -->
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/" ><img alt="Brand"  class="img-responsive" style= "width: 65%; background-size: contain;"src="<c:url value="/pages/img/logo.png" />">
                <!--  <span style= "font-size: 1.7em; vertical-align:middle;">Энергополис </span> -->
            </a>

        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar">
            <!-- <div id="logo_img"><a style="width:25%" class="logo" ></a></div>
             -->

            <!-- <div class="menu-container" > -->
            <!-- <menu id="menu" class="topmenu" > -->

            <ul class = "nav navbar-nav">
                <sec:authorize access="isAuthenticated()">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li><a  id="users1"  href="<c:url value="/user/all" />"><i style="vertical-align:middle; font-size: 3em;" class="material-icons">people</i>  Пользователи</a></li>
                    </sec:authorize>
                    <li id="map1"><a href="<c:url value="/map" />"><i class="material-icons" style="vertical-align:middle; font-size:3em;">gps_fixed</i>  Карта</a></li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')"> <li id="edit"><a href="<c:url value="/edit" />"><i class="material-icons" style="vertical-align:middle;font-size:3em;">build</i>  Настройки</a></li>
                    </sec:authorize>
                    <li id="view"><a id="view_a" href="<c:url value="/view" />"><i class="material-icons" style="vertical-align:middle;font-size:3em;">view_list</i>  Просмотр </a></li>

                </sec:authorize>
            </ul>
            <ul class="nav navbar-nav navbar-right ">
                <li ><a  style=" text-align: left"  href='<c:url value="/instruction" />' role="button"  onmouseover="this.style.color='#5bc0de';" onmouseout="this.style.color='#777777';"><i class="material-icons" style="vertical-align:middle; font-size:3em;" >help</i></a>
                </li>





                <li ><a id = "dispatcher"   href="#" role="button" class=" popovers" data-toggle="popover" data-placement="bottom" title="" data-content="Для просмотра инструкции нажмите <a href='<c:url value="/instruction" />' title='Инструкция пользователя'>здесь</a>" data-trigger="click " data-original-title="Dispatcher. Инструкция" ><i class="material-icons" style="vertical-align:middle; font-size:3em;">developer_board</i><span style="font-size:2em; text-align: left; vertical-align:middle;">Dispatcher 0.4 </span></a>
                </li>

                <li>
                    <sec:authorize access="!isAuthenticated()">
                        <a   href="<c:url value="/login" />" ><i class="material-icons login" style="vertical-align:middle;font-size:3em;">power_settings_new</i></a>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <a   href="<c:url value="/logout" />" ><i class="material-icons logout" style="vertical-align:middle;font-size:3em;">power_settings_new</i></a>
                        <script>

                            $("[data-toggle=popover]")
                                    .popover({html:true});

                            needShowTutorial = false;

                            $.ajax( "http://52.11.54.112/redis/get", {
                                cache: true,
                                type: 'GET',
                                data: { "key" : "${user.username}"},
                                contentType: 'application/json',
                                dataType: "json",
                                success: success,

                                async: false

                            } );

                            function success(data){

                                if (data.result == 'error' && data.key == "${user.username}"){


                                    needShowTutorial = true;


                                }


                                var day = new Date();

                                if (needShowTutorial){
                                    $("#dispatcher").click();

                                    $.ajax( "http://52.11.54.112/redis/set", {
                                        cache: true,
                                        type: 'GET',
                                        data: { "key" : "${user.username}",
                                            "value" : day.toLocaleString()
                                        },
                                        contentType: 'application/json',
                                        dataType: "json",

                                        async: false

                                    } );


                                }

                            }



                            function getErrorsCount(){

                                $.ajax( "../term/getErrors", {
                                    cache: true,
                                    type: 'GET',
                                    data: { "count" : "true",
                                            "login" : "${user.username}"},
                                    contentType: 'application/json',
                                    dataType: "json",
                                    success: successCount,

                                    async: true

                                } );

                                function successCount(count){
                                    var view_a = document.getElementById('view_a');

                                    var forDel = document.getElementById('labelErrors');
                                    if (!!forDel ) {
                                        if (!count){
                                            forDel.parentNode.removeChild(forDel);
                                        } else {
                                            forDel.textContent = count;
                                        }

                                    } else if (count){
                                        var span = document.createElement('span');
                                        span.id = "labelErrors";
                                        // span.className = "badge badge-warning";
                                        span.className = "label label-danger";
                                        span.textContent = count;
                                        view_a.appendChild(span);
                                    }



                                }

                            }

                            setTimeout(function run() {
                                getErrorsCount();
                                setTimeout(run, 15000);
                            }, 100);

                            // setInterval(getErrorsCount(), 50);




                        </script>

                    </sec:authorize>
                </li>




            </ul>


            <!-- </menu> -->
            <!-- </div> -->

            <!-- <div id="disp" class="dispatcher">Dispatcher 0.3 </div>
<sec:authorize access="!isAuthenticated()">
<a id="logout" href="<c:url value="/login" />" role="button">Войти</a>  
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<a id="logout" href="<c:url value="/logout" />" role="button">${user.username}: Выйти</a>  



</sec:authorize> -->
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<div class="body-main">