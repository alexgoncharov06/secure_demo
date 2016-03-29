<%--
  Created by IntelliJ IDEA.
  User: alexwolf
  Date: 26.12.15
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>




<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dispatcher. Инструкция</title>

    <!-- Bootstrap core CSS -->
    <link href="../pages/css/bootstrap.css" rel="stylesheet">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>

    <link type="text/css" rel="stylesheet" href="../pages/css/main.css">

    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->

    <script src="http://code.jquery.com/jquery-2.1.4.js" ></script>

   <!--  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha256-KXn5puMvxCw+dAYznun+drMdG1IFl3agK0p/pqT9KAo= sha512-2e8qq0ETcfWRI4HJBzQiA3UoyFk6tbNyG+qSaIBZLyW9Xf3sWZHN/lxe9fTh1U45DpPf07yj94KsUHHWe4Yk1A==" crossorigin="anonymous"></script>

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body style="min-width: 500px">

<%@include file="../pages/header.jsp" %>
<sec:authorize access="!isAuthenticated()">
    <div class="container otstup text-center">
        <p><a class="btn btn-lg btn-success " href="../login" role="button">Войти</a></p>
    </div>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <div class="container otstup container-fluid">



   <h1>Инструкция по использованию системы <i class="material-icons logout" style="vertical-align:middle;font-size:1.2em;">developer_board</i>Dispatcher</h1>







    <div class="panel-group otstup" id="accordion" role="tablist" aria-multiselectable="true">
    <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
    <h4 class="panel-title">
    <h3 style="margin-top: 0px; margin-bottom:0px"role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
    <i class="material-icons" style="vertical-align:middle;font-size:2em; ">view_list</i>  Просмотр  -  <span>Просмотр данных по объектам</span>
    </h3>
    </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
    <div class="panel-body">


    
    <div class="container">
    <h2>Пример таблицы с текущими данными:</h2>
    <div id="table_sensors_data" class="center-block col-md-10 col-sm-12 ">
    <table id="myTable" class="table table-hover ">
    <caption>
    <h3>Действующие объекты</h3></caption>
    <th>#</th>
    <th>Название</th>
    <th>Адрес</th>
    <th>Кол-во аварий</th>
    <tbody>
    <tr id="table_row_0" class="warning" data-toggle="tooltip" data-placement="top"  data-html="true"  title="По объекту имеются <br><strong style='color: #ffdd99'>не критические ошибки</strong>">
    <td style="text-align: center;">1</td>
    <td>Днепровое</td>
    <td>с. Днепровое, ул. Береговая</td>
    <td style="text-align: center;">1</td>
    </tr>
    <tr id="table_row_1" class="success"  data-toggle="tooltip" data-placement="top"  data-html="true"  title="Объект функционирует <strong style='color: #70db70'>нормально</strong>">
    <td style="text-align: center;">2</td>
    <td>Дом</td>
    <td>г. Днепропетровск, пр. Карла Маркса 8 кв. 32</td>
    <td style="text-align: center;">0</td>
    </tr>
    <tr id="table_row_2" class="danger" data-toggle="tooltip" data-placement="top"  data-html="true"  title="По объекту имеются <br><strong style='color: #ff8080'>критические ошибки</strong>">
    <td style="text-align: center;">3</td>
    <td>АгроОвен</td>
    <td>пгт. Магдалиновка, ул. Щорса, 1/1</td>
    <td style="text-align: center;">8</td>
    </tr>
    <tr id="table_row_3" class="info" data-toggle="tooltip" data-placement="top"  data-html="true" title="Нет данных по объекту <br><strong style='color: #66e0ff'>более 15 минут</strong>">
    <td style="text-align: center;">4</td>
    <td>МФ "Фаворит Плюс"</td>
    <td> Юбилейный, ул. Совхозная, 78</td>
    <td style="text-align: center;">5</td>
    </tr>
    </tbody>
    </table>
    </div>
    

    <br><br>
    <div class="col-md-6 col-xs-12 col-sm-12  center-block">
    <table class="table table-hover ">
    <caption>
    <h4>Соответствее цветов и соостояния объекта</h4></caption>
    
    <th>Состояние</th>
    <tr class="success">
    <td>Объект функционирует нормально</td>
    </tr>
    <tr class="info">
    <td>Нет данных по объекту более 15 минут</td>
    </tr>
     <tr class="warning">
    <td>По объекту имеются <strong>не критические ошибки</strong></td>
    </tr>
    <tr class="danger">
    <td>По объекту имеются <strong> критические ошибки</strong></td>
    </tr>

    

    </table>
    </div>
    </div>
    <br><br>
    <div class="container container-fluid col-xs-12 col-sm-12">
    <h4>Для просмотра детального отчета по объекту необходимо кликнуть на строку с интересующим объектом, после чего на странице отобразится:</h4>
    

              <div class="container-fluid center-block otstup col-xs-10 col-sm-10 col-md-10">
                <table class="container-fluid table ">
                    <tbody >
                        <tr>
                            <td>
                                <div id="name1">Название точки:
                                    <div id="id" hidden=""></div>
                                </div>
                            </td>
                            <td>
                                <div id="name2">МФ "Фаворит Плюс"</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>Адрес точки: </div>
                            </td>
                            <td>
                                <input type="text" name="address" class="col-md-7 col-sm-11" id="address" disabled="" value="Юбилейный, ул. Совхозная, 78">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="loc1">Геопозиция точки:</div>
                            </td>
                            <td>
                                <input type="text" name="location" class="col-md-7 col-sm-11"  id="loc2" disabled="" value="48.535628, 35.060842">
                                <div></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>Работает </div>
                            </td>
                            <td>
                                <input type="checkbox" name="status" disabled="" checked="true">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <div><b>Текущие показания:</b></div>
                                </div>
                            </td>
                            <td>
                                <div>
                                    <label style="margin-right: 40px;" data-toggle="tooltip" data-placement="left" title="Время поступления последних данных по объекту" >21:24:53, 26.12.2015</label>
                                    <button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" data-toggle="tooltip" data-placement="left" title="При нажатии открывает в новой вкладке страницу для просмотра архива данных по объекту с возможностью построения графиков" >Перейти в Архив</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="char;" colspan="2">
                                <div class="col-md-10 col-sm-12">
                                <table id="sensors_table" class="table table-hover " >
                                    <caption></caption>
                                    <tbody>
                                        <tr class="active">
                                            <td id="numSensor">#</td>
                                            <td>Название датчика</td>
                                            <td>Значение</td>
                                            <td>Действующий предел</td>
                                        </tr>
                                        <tr class="success" data-toggle="tooltip" data-placement="top"  data-html="true"  title="Показания датчика <br><strong style='color: #70db70'>в пределах заданных значений</strong>">
                                            <td style="text-align:right;">
                                                <div>1</div>
                                            </td>
                                            <td>
                                                <div> Температура воздуха на входе в П8</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>12.94</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>-10 &lt; ... &gt; 30</div>
                                            </td>
                                        </tr>
                                        <tr class="success" data-toggle="tooltip" data-placement="top" data-html="true"  title="Показания датчика <br><strong style='color: #70db70'>в пределах заданных значений</strong>">
                                            <td style="text-align:right;">
                                                <div>2</div>
                                            </td>
                                            <td>
                                                <div>Температура обработанного приточного воздуха П8</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>25.19</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>25 &lt; ... &gt; 45</div>
                                            </td>
                                        </tr>
                                        <tr class="danger" data-toggle="tooltip" data-placement="top" data-html="true"  title="Показания датчика <strong style='color: #ff8080'>вышли за заданные пределы. </strong><br> Для температурного датчика данный цвет обозначает, что текущая температура <strong style='color: #ff8080'>выше </strong> заданных пределов ">
                                            <td style="text-align:right;">
                                                <div>3</div>
                                            </td>
                                            <td>
                                                <div>Температура воздуха на входе в В9 (средняя температура обслуживаемых помещений)</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>24.25</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>&gt; 24</div>
                                            </td>
                                        </tr>
                                        <tr class="info" data-toggle="tooltip" data-placement="top"  data-html="true" title="Показания датчика <strong style='color: #66e0ff'>вышли за заданные пределы.</strong> <br> Для температурного датчика данный цвет обозначает, что текущая температура <strong style='color: #66e0ff'>ниже </strong>заданных пределов ">
                                            <td style="text-align:right;">
                                                <div>4</div>
                                            </td>
                                            <td>
                                                <div>Температура возврата конденсата П8</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>78.19</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div> &lt; 100</div>
                                            </td>
                                        </tr>
                                        <tr class="success" data-toggle="tooltip" data-placement="top" data-html="true"  title="Показания датчика в норме. <br> Для дискретного датчика данный цвет обозначает, что ошибка  <strong style='color: #70db70'>отсутствует </strong>">
                                            <td style="text-align:right;" >
                                                <div>5</div>
                                            </td>
                                            <td>
                                                <div>Общая авария П6В9</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>✓</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div></div>
                                            </td>
                                        </tr>
                                        <tr class="danger" data-toggle="tooltip" data-placement="top" data-html="true"  title="Датчик передал сообщение об ошибке. <br> Для дискретного датчика данный цвет обозначает, что ошибка  <strong style='color: #ff8080'>критическая </strong>">
                                            <td style="text-align:right;">
                                                <div>6</div>
                                            </td>
                                            <td>
                                                <div>Низкое давление пара П6</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>✘</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div></div>
                                            </td>
                                        </tr>
                                        <tr class="success" data-toggle="tooltip" data-placement="top" data-html="true"  title="Показания датчика в норме. <br> Для дискретного датчика данный цвет обозначает, что ошибка  <strong style='color: #70db70'>отсутствует </strong>">
                                            <td style="text-align:right;">
                                                <div>7</div>
                                            </td>
                                            <td>
                                                <div>Высокое давление пара П6</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>✓</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div></div>
                                            </td>
                                        </tr>
                                        <tr class="success" data-toggle="tooltip" data-placement="top" data-html="true"  title="Показания датчика в норме. <br> Для дискретного датчика данный цвет обозначает, что ошибка  <strong style='color: #70db70'>отсутствует </strong>">
                                            <td style="text-align:right;">
                                                <div>8</div>
                                            </td>
                                            <td>
                                                <div>Нарушение электроснабжения П6В9</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>✓</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div></div>
                                            </td>
                                        </tr>
                                        <tr class="warning" data-toggle="tooltip" data-placement="top" data-html="true"  title="Датчик передал сообщение об ошибке. <br> Для дискретного датчика данный цвет обозначает, что ошибка  <strong style='color: #ffdd99'>не критическая </strong>">
                                            <td style="text-align:right;">
                                                <div>9</div>
                                            </td>
                                            <td>
                                                <div>Засорение фильтра</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div>✘</div>
                                            </td>
                                            <td style="text-align:center;">
                                                <div></div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>


    </div>
    </div>
    </div>
    </div>
    <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
    <h4 class="panel-title">
    <h3  style="margin-top: 0px; margin-bottom:0px" class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
    
    <i class="material-icons" style="vertical-align:middle; font-size:2em;">gps_fixed</i>  Карта - Просмотр Карты с данными
    </h3>
    </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
    <div class="panel-body">


        <div>  
        <h4>На данной вкладке в режиме карты возможно просмотреть информацию по всем объектам и текущих сообщений об ошибках (в случае их наличия).</h4> 

        <p>Существует 4 варианта отображения маркера для объектов:
        </p>


        </div>
    

            <div class="text-center">
                <div class="btn-group " role="group" aria-label="Button group show marckers">
                <!-- Indicates a successful or positive action -->
                    <button type="button" class="btn btn-success" onclick="showAtMapp('green')">Нормальное состояние объекта</button>
                    <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                    <button type="button" class="btn btn-primary" onclick="showAtMapp('blue')">Не передаются данные</button>
                    <!-- Indicates caution should be taken with this action -->
                    <button type="button" class="btn btn-warning" onclick="showAtMapp('orange')">Есть не критические ошибки</button>
                    <!-- Indicates a dangerous or potentially negative action -->
                    <button type="button" class="btn btn-danger" onclick="showAtMapp('red')">Есть критические ошибки</button>
                </div>
            </div>

            <div id="map" class="container ">
            </div>
            <script>

            var map;
                var markers = [];
                var dataBaseIdOld = [];
                var showAll = true;
                        var baseWithExample = {
                            green :  {
                                name : "Днепровое",
                                location : {
                                    lat: 48.246158,
                                    lng: 35.143702
                                },
                                ID : "860719023988417",

                                errorsCount : 0,
                                errors : [],
                                criticalError : false,
                                type : "green"
                            },

                            blue : {
                                name : "Днепровое",
                                location : {
                                    lat: 48.246158,
                                    lng: 35.143702
                                },
                                ID : "860719023988417",

                                errorsCount : "E",
                                errors : ["Не передаются данные"],
                                criticalError : false,
                                type : "dark_blue"
                            },
                            orange : {
                                name : "Днепровое",
                                location : {
                                    lat: 48.246158,
                                    lng: 35.143702
                                },
                                ID : "860719023988417",

                                errorsCount : 3,
                                errors : [ 'Низкое давление пара П6', 'Засорение фильтра', 'Температура датчика "Температура воздуха на входе в В9 (средняя температура обслуживаемых помещений)" больше чем 24°С.'],
                                criticalError : false,
                                type : "yelow"
                            },
                            red : {
                                name : "Днепровое",
                                location : {
                                    lat: 48.246158,
                                    lng: 35.143702
                                },
                                ID : "860719023988417",

                                errorsCount : 5,
                                errors : [ 'Высокий уровень СУГ (более 85%). Газгольдер 1', 'Высокий уровень СУГ (Более 85%). Газгольдер 2', 
                                'Низкое давление газа после РД', 'Низкое давление газа перед испарителем', 'Низкая температура в испарителе'],
                                criticalError : true,
                                type : "red"
                            },

                        }




                function showAtMapp(color){
                    var block = document.getElementById("map");
                    block.innerHTML = "";
                    initMap();

                    addMarkerWithTimeout(baseWithExample[color], 100);

                }


                //        Методы для работы с картой
                function initMap() {



                    var testOp = {
                        zoom: 10,
                        center: {
                            lat: 48.464717,
                            lng: 35.046183
                        }
                    };


                    var block = document.getElementById("map");
                    var centerLatLng = new google.maps.LatLng('48.246158,35.143702');

                    map = new google.maps.Map(block, testOp);




                    var b_width = document.documentElement.clientWidth
                    b_width = b_width - (b_width * 0.3);
                    var b_height = document.documentElement.clientHeight/2;
                    block.style.width = b_width + "px"; // Устанавливаем новую ширину блока
                    block.style.height = b_height + "px"; // Устанавливаем новую высоту блока



                }



                function addMarkerWithTimeout(baseWith, timeout) {
                    // console.log("Добавление маркера по объекту " + baseWith.name);

                    var icon = {};
                    icon.labelOrigin = new google.maps.Point(21, 21);
                    icon.size = new google.maps.Size(42, 72);

                    switch (baseWith.type) {
                        case 'red':

                            icon.url = './pages/img/red.png';

                            break;
                        case 'green':
                            icon.url = './pages/img/green.png';
                            break;
                        case 'yelow':
                            icon.url = './pages/img/yelow.png';
                            break;
                        case 'dark_blue':
                            icon.url = './pages/img/dark_blue.png';
                            break;
                        case 'blue':
                            icon.url = './pages/img/blue.png';
                            break;
                        case 'orange':
                            icon.url = './pages/img/orange.png';
                            break;

                    }

                    window.setTimeout(function() {
                        var marker = new google.maps.Marker({
                            position: baseWith.location,
                            map: map,
                            icon: icon,
                            title: baseWith.name,
                            label: "" + baseWith.errorsCount,
                            //                    animation: google.maps.Animation.DROP,
                            draggable: false

                        });

                        map.panTo(baseWith.location);



                        var Message = document.createElement('div');



                        var textMess = document.createElement('h4');
                        textMess.id = "firstHeading";
                        textMess.class = 'firstHeading';
                        textMess.textContent = baseWith.name;
                        textMess.setAttribute('data-toggle','tooltip');
                        textMess.setAttribute('data-placement','top');
                        textMess.setAttribute('data-html','true');

                        textMess.title='Найменование объекта';

                        Message.appendChild(textMess);

                        if (baseWith.errors.length == 0) {
                            var textMess = document.createElement('div');
                            textMess.textContent = 'Объект работает нормально, аварий нет.';
                            Message.appendChild(textMess);
                        } else {

                            
                            var textMess = document.createElement('b');
                            textMess.textContent = 'Текущие аварии:';
                            Message.appendChild(textMess);

                            for (var i = 0; i < baseWith.errors.length; i++) {
                                var num = i + 1;
                                var textMess = document.createElement('div');
                                textMess.textContent = num + ') ' + baseWith.errors[i];
                                Message.appendChild(textMess);
                            }

                        }




                        var textBr = document.createElement('br');
                        //                textBr.innerText = '<br>';
                        Message.appendChild(textBr);
                        var buttonDiv = document.createElement('div');
                        buttonDiv.id = 'button_center';

                        var buttonOk = document.createElement('button');
                        buttonOk.textContent = 'Просмотреть все данные';
                        //                buttonOk.setAttribute('style','right: 45%');
                        //                buttonOk.id = 'button_center';
                        buttonOk.className = "mdl-button mdl-js-button mdl-js-ripple-effect";

                        buttonOk.addEventListener('click', function() {
                            // window.open("view?base_Id=" + baseWith.ID);
                        });

                         buttonOk.setAttribute('data-toggle','tooltip');
                        buttonOk.setAttribute('data-placement','top');
                        buttonOk.setAttribute('data-html','true');

                        buttonOk.title='При нажатии в новой вкладке откроются данные по этому объекту в режиме просмотр';


                        buttonDiv.appendChild(buttonOk);

                        Message.appendChild(buttonDiv);
                        var otstup = document.createElement('div');
                        otstup.innerHTML = '<br>';
                        //Message.appendChild(otstup);
                        //Message.appendChild(otstup);

                        attachSecretMessage(marker, Message);

                        clearMarker(marker);

                        markers.push(marker);
                    }, timeout);
                        $(function () {$('[data-toggle="tooltip"]').tooltip()})

                }





                //      Метод добавления подсказки к маркеру
                function attachSecretMessage(marker, Message) {
                    var infowindow = new google.maps.InfoWindow({
                        content: Message
                    });

                    marker.addListener('click', function() {
                        infowindow.open(marker.get('map'), marker);
                        suondErrorStop();
                    });
                }





                function showAllChangeMap(){
                    var typeMap = document.getElementById('typeMap');
                    switch (typeMap.value){
                        case 'all':
                            showAll = true;
                            break;
                        case 'errors':
                            showAll = false;
                            break;

                    }


                    for (var i = 0; i < markers.length; i++) {
                        markers[i].setMap(null);

                    }

                    addMarkersWithData();

                    dataBaseIdOld = [];


                }


            </script>



    </div>
    </div>
    </div>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
    <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingFour">
    <h4 class="panel-title">
    <h3 style="margin-top: 0px; margin-bottom:0px" class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
    
    <i class="material-icons" style="vertical-align:middle;font-size:2em;">build</i>  Настройки - Добавление новых объектов и настройка действующих
    
    </h3>
    </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
    <div class="panel-body">
    






        <div>


<div class="container  col-md-10 col-sm-12">
<h4>Для редактирования данных по объекту сначала необходимо выбрать объект из списка всех доступных.</h4><br><h3> Пример страницы выбора объекта:</h3>
<br>

<h3 class="text-center" >Редактирование данных по объектам</h3>

<form name="data">
    <div id="table_sensors_data" class=""><table id="myTable" class="table table-striped table-hover"><caption><h4>Действующие объекты</h4></caption><th>#</th><th>Название</th><th>Адрес</th><th>Base_id</th><tbody><tr id="table_row_0" data-toggle="tooltip" data-placement="bottom" data-html="true"  title="Нажмите на эту строку для перехода к редактированию данного объекта" onclick="document.getElementById('editObject').scrollIntoView();" ><td>1</td><td>Днепровое</td><td>с. Днепровое, ул. Береговая</td><td>860719023988417</td></tr><tr id="table_row_1" data-toggle="tooltip" data-placement="bottom" data-html="true"  title="Нажмите на эту строку для перехода к редактированию данного объекта" onclick="document.getElementById('editObject').scrollIntoView();"><td>2</td><td>Дом</td><td>г. Днепропетровск, пр. Карла Маркса 8 кв. 32</td><td>home</td></tr><tr id="table_row_2" data-toggle="tooltip" data-placement="bottom" data-html="true"  title="Нажмите на эту строку для перехода к редактированию данного объекта" onclick="document.getElementById('editObject').scrollIntoView();"><td>3</td><td>АгроОвен</td><td>пгт. Магдалиновка, ул. Щорса, 1/1</td><td>860719027886393</td></tr><tr id="table_row_3" data-toggle="tooltip" data-placement="bottom" data-html="true"  title="Нажмите на эту строку для перехода к редактированию данного объекта" onclick="document.getElementById('editObject').scrollIntoView();"><td>4</td><td>МФ "Фаворит Плюс"</td><td> Юбилейный, ул. Совхозная, 78</td><td>860719024852885</td></tr></tbody></table></div>
</form>

<br>



    <div id="button_panel"  class="pull-right"> <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"  style="padding: 28px;margin: 15px" id="addNewBase" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите на эту кнопку для добавления нового объекта"><i class="material-icons">add</i></button></div>
<br>
<br><br><br>
        <hr>
<br>
<h3>Пример страницы редактирования данных по объекту или заведения нового объекта:</h3>






<div class="body-main" id="editObject">
   
    <div class="container ">
      
        <h3 class="text-center">Редактирование данных по объектам</h3>
        <div id="buttonBack">
            <button id="back"  class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите на эту кнопку для возврата к таблице выбора объектов" onclick="document.getElementById('collapseFour').scrollIntoView();"><i class="material-icons">keyboard_backspace</i></button>
        </div>
        <div id="forecast"></div>
        <form name="data">
            <div id="table_sensors_data" class="">
                <div>
                    <div>
                        <h4> Заполните данные по объекту:</h4></div>
                    <table id="myTable" class="">
                        <tbody>
                            <tr>
                                <td>
                                    <div id="name1">Название точки:
                                        <div id="id" hidden=""></div>
                                    </div>
                                </td>
                                <td>
                                    <input type="text" name="name" id="name2" value="Днепровое">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>Адрес точки: </div>
                                </td>
                                <td>
                                    <input type="text" name="address" size="50" id="address" value="с. Днепровое, ул. Береговая">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <button id="search" type="button" onclick="getAdress()"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите на эту кнопку для выбора места положения объекта на карте" >Найти на карте</button>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="map"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="loc1">Геопозиция точки:</div>
                                </td>
                                <td>
                                    <input type="text" name="location" size="19" id="loc2" value="48.246158,35.143702"  data-toggle="tooltip" data-placement="top" data-html="true"  title="При необходимости укажите геопозицию самостоятельно" >
                                    <div></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>Район:</div>
                                </td>
                                <td>
                                    <select name="district" id="district">
                                        <option value="0">0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>Работает </div>
                                </td>
                                <td>
                                    <input type="checkbox" name="status" id="status" checked  data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния объекта" >
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>
                                        <div><b>Натройки датчиков:</b></div>
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <br>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="char;" colspan="2">
                                    <table id="sensors_table" class="table">
                                        <caption><b>Температурные датчики</b></caption>
                                        <tbody>
                                            <tr>
                                                <td id="numSensor" style="text-align:right;">#</td>
                                                <td>Название датчика</td>
                                                <td style="text-align:center;">Min</td>
                                                <td style="text-align:center;">Max</td>
                                                <td style="text-align:center;">Задествован</td>
                                                <td style="text-align:center;">Критическая<br> ошибка</td>
                                            </tr>
                                            <tr id="sensor_1">
                                                <td style="text-align:right;">
                                                    <div>1
                                                        <div id="sensor_id1" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_1" id="sensor_name_1" size="50" value="Контур теплоснабжения Calorex Delta 6 (Т1.1)"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика" >
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_1" id="sensor_min_1" size="5" value="35" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика" >
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_1" id="sensor_max_1" size="5" value="85" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" checked data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_2">
                                                <td style="text-align:right;">
                                                    <div>2
                                                        <div id="sensor_id2" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_2" id="sensor_name_2" size="50" value="Контур теплоснабжения напольного отопления  (Т1.2)"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_2" id="sensor_min_2" size="5" value="30" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика"> 
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_2" id="sensor_max_2" size="5" value="43" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_2" id="sensor_on_2" checked data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_3">
                                                <td style="text-align:right;">
                                                    <div>3
                                                        <div id="sensor_id3" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_3" id="sensor_name_3" size="50" value="Контур нагрева ГВС  (Т1.3)"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_3" id="sensor_min_3" size="5" value="35" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_3" id="sensor_max_3" size="5" value="85" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_3" id="sensor_on_3" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_4">
                                                <td style="text-align:right;">
                                                    <div>4
                                                        <div id="sensor_id4" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_4" id="sensor_name_4" size="50" value="Горячая вода на выходе из бойлера (Т3.1)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_4" id="sensor_min_4" size="5" value="40" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_4" id="sensor_max_4" size="5" value="80" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_4" id="sensor_on_4" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_5">
                                                <td style="text-align:right;">
                                                    <div>5
                                                        <div id="sensor_id5" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_5" id="sensor_name_5" size="50" value="Контур теплоснабжения подогрева воды бассейна (Т1.4)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_5" id="sensor_min_5" size="5" value="35" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_5" id="sensor_max_5" size="5" value="85" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_5" id="sensor_on_5"checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_6">
                                                <td style="text-align:right;">
                                                    <div>6
                                                        <div id="sensor_id6" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_6" id="sensor_name_6" size="50" value="Контур теплоснабжения фанкойлов (Т1.5)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_6" id="sensor_min_6" size="5" value="35" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_6" id="sensor_max_6" size="5" value="85" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_6" id="sensor_on_6" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_7">
                                                <td style="text-align:right;">
                                                    <div>7
                                                        <div id="sensor_id7" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_7" id="sensor_name_7" size="50" value="Контур отопления террасы (Т1.6)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_7" id="sensor_min_7" size="5" value="35" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_7" id="sensor_max_7" size="5" value="85" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_7" id="sensor_on_7" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_8">
                                                <td style="text-align:right;">
                                                    <div>8
                                                        <div id="sensor_id8" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_8" id="sensor_name_8" size="50" value="Обратный трубопровод котлового контура (Тк2)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_8" id="sensor_min_8" size="5" value="35" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_8" id="sensor_max_8" size="5" value="75" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_8" id="sensor_on_8" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_9">
                                                <td style="text-align:right;">
                                                    <div>9
                                                        <div id="sensor_id9" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_9" id="sensor_name_9" size="50" value="Контур радиаторного отопления (Т1.7)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_9" id="sensor_min_9" size="5" value="35" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_9" id="sensor_max_9" size="5" value="75" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_9" id="sensor_on_9" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_10">
                                                <td style="text-align:right;">
                                                    <div>10
                                                        <div id="sensor_id10" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_10" id="sensor_name_10" size="50" value="Обратный трубопровод гелиоколлекторного поля (Тс2)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_10" id="sensor_min_10" size="5" value="15" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td> 
                                                    <input type="number" max="200" min="-50" name="sensor_max_10" id="sensor_max_10" size="5" value="100" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_10" id="sensor_on_10" checked="" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_11">
                                                <td style="text-align:right;">
                                                    <div>11
                                                        <div id="sensor_id11" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_11" id="sensor_name_11" size="50" value="Подающий трубопровод гелиоколлекторного поля (Тс1)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_11" id="sensor_min_11" size="5" value="15" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_11" id="sensor_max_11" size="5" value="100" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_11" id="sensor_on_11" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_12">
                                                <td style="text-align:right;">
                                                    <div>12
                                                        <div id="sensor_id12" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_12" id="sensor_name_12" size="50" value="Подающий трубопровод котлового контура (Тк1)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_12" id="sensor_min_12" size="5" value="40" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_12" id="sensor_max_12" size="5" value="85" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_12" id="sensor_on_12" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_13">
                                                <td style="text-align:right;">
                                                    <div>13
                                                        <div id="sensor_id13" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_13" id="sensor_name_13" size="50" value="Подающий трубопровод теплоснабжения буферного накопителя (Ттн1)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_13" id="sensor_min_13" size="5" value="30" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_13" id="sensor_max_13" size="5" value="60" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_13" id="sensor_on_13" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_14">
                                                <td style="text-align:right;">
                                                    <div>14
                                                        <div id="sensor_id14" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_14" id="sensor_name_14" size="50" value="Обратный трубопровод контура холодоснабжения (Х2)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_14" id="sensor_min_14" size="5" value="5" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_14" id="sensor_max_14" size="5" value="23" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_14" id="sensor_on_14" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_15">
                                                <td style="text-align:right;">
                                                    <div>15
                                                        <div id="sensor_id15" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_15" id="sensor_name_15" size="50" value="Подающий трубопровод контура холодоснабжения (Х1)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_15" id="sensor_min_15" size="5" value="5" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_15" id="sensor_max_15" size="5" value="20" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_15" id="sensor_on_15" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_16">
                                                <td style="text-align:right;">
                                                    <div>16
                                                        <div id="sensor_id16" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_16" id="sensor_name_16" size="50" value="Обратный трубопровод теплоснабжения буферного накопителя (Ттн2)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_16" id="sensor_min_16" size="5" value="30" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_16" id="sensor_max_16" size="5" value="55" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_16" id="sensor_on_16" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_17">
                                                <td style="text-align:right;">
                                                    <div>17
                                                        <div id="sensor_id17" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_17" id="sensor_name_17" size="50" value="Подающий трубопровод холодоснабжения накопительной емкости (Хтн1)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_17" id="sensor_min_17" size="5" value="0" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_17" id="sensor_max_17" size="5" value="30" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_17" id="sensor_on_17" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_18">
                                                <td style="text-align:right;">
                                                    <div>18
                                                        <div id="sensor_id18" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_18" id="sensor_name_18" size="50" value="Подающий трубопровод гелиоколлекторного поля теплоснабжения  ГВС (Тс1.1)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_18" id="sensor_min_18" size="5" value="20" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_18" id="sensor_max_18" size="5" value="80" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_18" id="sensor_on_18" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_19">
                                                <td style="text-align:right;">
                                                    <div>19
                                                        <div id="sensor_id19" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_19" id="sensor_name_19" size="50" value="Обратный трубопровод гелиоколлекторного поля теплоснабжения  ГВС (Тс1.2)"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_19" id="sensor_min_19" size="5" value="20" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_19" id="sensor_max_19" size="5" value="80" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_19" id="sensor_on_19" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_20">
                                                <td style="text-align:right;">
                                                    <div>20
                                                        <div id="sensor_id20" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_20" id="sensor_name_20" size="50" value="Обратный трубопровод холодоснабжения накопительной емкости (Хтн2)"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_20" id="sensor_min_20" size="5" value="0" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_20" id="sensor_max_20" size="5" value="30" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_20" id="sensor_on_20" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_21">
                                                <td style="text-align:right;">
                                                    <div>21
                                                        <div id="sensor_id21" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_21" id="sensor_name_21" size="50" value="Середина бойлера ГВС (Т)"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_21" id="sensor_min_21" size="5" value="35" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_21" id="sensor_max_21" size="5" value="80" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_21" id="sensor_on_21" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_22">
                                                <td style="text-align:right;">
                                                    <div>22
                                                        <div id="sensor_id22" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_22" id="sensor_name_22" size="50"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_22" id="sensor_min_22" size="5" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_22" id="sensor_max_22" size="5" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_22" id="sensor_on_22" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_23">
                                                <td style="text-align:right;">
                                                    <div>23
                                                        <div id="sensor_id23" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_23" id="sensor_name_23" size="50"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_23" id="sensor_min_23" size="5" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_23" id="sensor_max_23" size="5" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_23" id="sensor_on_23" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr id="sensor_16">
                                                <td style="text-align:right;">
                                                    <div>24
                                                        <div id="sensor_id24" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_name_24" id="sensor_name_24" size="50"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_min_24" id="sensor_min_24" size="5" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите минимальное допустимое значения для датчика">
                                                </td>
                                                <td>
                                                    <input type="number" max="200" min="-50" name="sensor_max_24" id="sensor_max_24" size="5" data-toggle="tooltip" data-placement="top" data-html="true"  title="Укажите максимальное допустимое значения для датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_24" id="sensor_on_24" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                                                               <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_on_1" id="sensor_on_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <br>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <br>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="char;" colspan="2">
                                    <table id="sensors_table" class="table">
                                        <caption align="center"><b>Дискретные датчики</b></caption>
                                        <tbody>
                                            <tr>
                                                <td id="numSensor">#</td>
                                                <td>Название датчика</td>
                                                <td style="text-align:center;">Задествован</td>
                                                <td style="text-align:center;">Инверт.</td>
                                                <td style="text-align:center;">Критическая<br> ошибка</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>1
                                                        <div id="sensor_dt_id1" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_1" id="sensor_dt_name_1" size="50" value="Низкий уровень СУГ (менее 20%). Газгольдер 1"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_1" id="sensor_dt_on_1" checked data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>2
                                                        <div id="sensor_dt_id2" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_2" id="sensor_dt_name_2" size="50" value="Высокий уровень СУГ (Более 85%). Газгольдер 1"  data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_2" id="sensor_dt_on_2" checked data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_2" id="sensor_inverse_2" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>3
                                                        <div id="sensor_dt_id3" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_3" id="sensor_dt_name_3" size="50" value="Низкий уровень СУГ (менее 20%). Газгольдер 2" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_3" id="sensor_dt_on_3" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_3" id="sensor_inverse_3" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>4
                                                        <div id="sensor_dt_id4" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_4" id="sensor_dt_name_4" size="50" value="Высокий уровень СУГ (Более 85%). Газгольдер 2" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_4" id="sensor_dt_on_4" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_4" id="sensor_inverse_4" checked data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>5
                                                        <div id="sensor_dt_id5" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_5" id="sensor_dt_name_5" size="50" value="Нарушено электроснабжение ГСН" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_5" id="sensor_dt_on_5" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_5" id="sensor_inverse_5" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>6
                                                        <div id="sensor_dt_id6" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_6" id="sensor_dt_name_6" size="50" value="Высокое давление газа после РД" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_6" id="sensor_dt_on_6" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_6" id="sensor_inverse_6" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>7
                                                        <div id="sensor_dt_id7" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_7" id="sensor_dt_name_7" size="50" value="Низкое давление газа после РД" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_7" id="sensor_dt_on_7" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_7" id="sensor_inverse_7" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>8
                                                        <div id="sensor_dt_id8" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_8" id="sensor_dt_name_8" size="50" value="Низкая температура в испарителе" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_8" id="sensor_dt_on_8" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_8" id="sensor_inverse_8" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>9
                                                        <div id="sensor_dt_id9" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_9" id="sensor_dt_name_9" size="50" value="Высокая температура в испарителе" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_9" id="sensor_dt_on_9" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_9" id="sensor_inverse_9" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>10
                                                        <div id="sensor_dt_id10" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_10" id="sensor_dt_name_10" size="50" value="Низкое давление воды на вводе" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_10" id="sensor_dt_on_10" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_10" id="sensor_inverse_10" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>11
                                                        <div id="sensor_dt_id11" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_11" id="sensor_dt_name_11" size="50" value="Высокое давление воды на вводе" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_11" id="sensor_dt_on_11" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_11" id="sensor_inverse_11" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>12
                                                        <div id="sensor_dt_id12" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_12" id="sensor_dt_name_12" size="50" value="Загазованность котельной (СО>20%ПДК)" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_12" id="sensor_dt_on_12" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_12" id="sensor_inverse_12" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>13
                                                        <div id="sensor_dt_id13" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_13" id="sensor_dt_name_13" size="50" value='Сигнал "Пожар"' data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_13" id="sensor_dt_on_13" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_13" id="sensor_inverse_13" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>14
                                                        <div id="sensor_dt_id14" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_14" id="sensor_dt_name_14" size="50" value="Аварийно низкий уровень" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_14" id="sensor_dt_on_14" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_14" id="sensor_inverse_14" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>15
                                                        <div id="sensor_dt_id15" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_15" id="sensor_dt_name_15" size="50" value="Аварийно высокий уровень" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_15" id="sensor_dt_on_15" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_15" id="sensor_inverse_15" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div>16
                                                        <div id="sensor_dt_id16" hidden=""></div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" name="sensor_dt_name_16" id="sensor_dt_name_16" size="50" value="Затопление котельной" data-toggle="tooltip" data-placement="top" data-html="true"  title="Данное поле для указания названия датчика">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_dt_on_16" id="sensor_dt_on_16" checked="true" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для изменения состояния датчика (включить/выключить отслеживание данных)">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_16" id="sensor_inverse_16" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если нормальном состоянии датчик должен передавать сигнал">
                                                </td>
                                                <td style="text-align:center;">
                                                    <input type="checkbox" name="sensor_inverse_1" id="sensor_inverse_1" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите если данный датчик является критически важным">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
        <br>
    </div>
  
        <!-- Colored mini FAB button -->
        <div id="button_panel" style="padding-bottom: 10px;" class="pull-right">
            <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab" onclick="loadTermData()" style="padding: 28px;margin: 15px" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для сброса заполненых данных и заполнения полей сохраненными данными с сервера"><i class="material-icons">autorenew</i></button>
            <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored" onclick="sentData()" style="padding: 28px;margin: 15px" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите для сохранения введенных настроек по объекту"><i class="material-icons">save</i></button>
       </div>
</div>



</div>



    











</div>




    </div>
    </div>
    </div>

    <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingFive">
    <h4 class="panel-title">
    <h3 style="margin-top: 0px; margin-bottom:0px" class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
    
        <i style="vertical-align:middle; font-size: 2em;" class="material-icons">people</i>  Пользователи - Добавление новых пользователей и редактирование существующих

    
    </h3>
    </h4>
    </div>
    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
    <div class="panel-body">
    

            <div class="container">
            <div id="alert" class="hidden"></div>
            <br>
            <h3 id="spisok">Список пользователей:</h2>
            <!-- <div class="table-responsive"  id="table"> -->
            <div id="table" class="col-md-10 col-sm-12">
            <table class="table table-hover table-condensed"><thead><tr class="success"><td><b>#</b></td><td><b>Login</b></td><td><b>Организация</b></td><td><b>Доступ</b></td></tr></thead><tbody><tr><td>1</td><td>Demo</td><td>Demo</td><td><label class="mdl-switch mdl-js-switch mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events is-checked is-upgraded" data-upgraded=",MaterialSwitch,MaterialRipple"><input type="checkbox" class="mdl-switch__input" id="switch-1"><span class="mdl-switch__label"></span><div class="mdl-switch__track"></div><div class="mdl-switch__thumb"><span class="mdl-switch__focus-helper"></span></div><span class="mdl-switch__ripple-container mdl-js-ripple-effect mdl-ripple--center" data-upgraded=",MaterialRipple"><span class="mdl-ripple"></span></span></label></td></tr><tr><td>2</td><td>yuryma</td><td>Энергополис</td><td><label class="mdl-switch mdl-js-switch mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events is-checked is-upgraded" data-upgraded=",MaterialSwitch,MaterialRipple"><input type="checkbox" class="mdl-switch__input" id="switch-1"><span class="mdl-switch__label"></span><div class="mdl-switch__track"></div><div class="mdl-switch__thumb"><span class="mdl-switch__focus-helper"></span></div><span class="mdl-switch__ripple-container mdl-js-ripple-effect mdl-ripple--center" data-upgraded=",MaterialRipple"><span class="mdl-ripple"></span></span></label></td></tr><tr><td>3</td><td>EgorK</td><td>Энергополис_Криков</td><td><label class="mdl-switch mdl-js-switch mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events is-checked is-upgraded" data-upgraded=",MaterialSwitch,MaterialRipple"><input type="checkbox" class="mdl-switch__input" id="switch-1"><span class="mdl-switch__label"></span><div class="mdl-switch__track"></div><div class="mdl-switch__thumb"><span class="mdl-switch__focus-helper"></span></div><span class="mdl-switch__ripple-container mdl-js-ripple-effect mdl-ripple--center" data-upgraded=",MaterialRipple"><span class="mdl-ripple"></span></span></label></td></tr><tr><td>4</td><td>alexwolf</td><td>Home</td><td><label class="mdl-switch mdl-js-switch mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events is-checked is-upgraded" data-upgraded=",MaterialSwitch,MaterialRipple"><input type="checkbox" class="mdl-switch__input" id="switch-1"><span class="mdl-switch__label"></span><div class="mdl-switch__track"></div><div class="mdl-switch__thumb"><span class="mdl-switch__focus-helper"></span></div><span class="mdl-switch__ripple-container mdl-js-ripple-effect mdl-ripple--center" data-upgraded=",MaterialRipple"><span class="mdl-ripple"></span></span></label></td></tr><tr><td>5</td><td>admin</td><td>Энергополис</td><td><label class="mdl-switch mdl-js-switch mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events is-checked is-upgraded" data-upgraded=",MaterialSwitch,MaterialRipple"><input type="checkbox" class="mdl-switch__input" id="switch-1"><span class="mdl-switch__label"></span><div class="mdl-switch__track"></div><div class="mdl-switch__thumb"><span class="mdl-switch__focus-helper"></span></div><span class="mdl-switch__ripple-container mdl-js-ripple-effect mdl-ripple--center" data-upgraded=",MaterialRipple"><span class="mdl-ripple"></span></span></label></td></tr><tr><td>6</td><td>Jassonn</td><td>Энергополис</td><td><label class="mdl-switch mdl-js-switch mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events is-checked is-upgraded" data-upgraded=",MaterialSwitch,MaterialRipple"><input type="checkbox" class="mdl-switch__input" id="switch-1"><span class="mdl-switch__label"></span><div class="mdl-switch__track"></div><div class="mdl-switch__thumb"><span class="mdl-switch__focus-helper"></span></div><span class="mdl-switch__ripple-container mdl-js-ripple-effect mdl-ripple--center" data-upgraded=",MaterialRipple"><span class="mdl-ripple"></span></span></label></td></tr><tr><td>7</td><td>kvg</td><td>Энергополис</td><td><label class="mdl-switch mdl-js-switch mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events is-checked is-upgraded" data-upgraded=",MaterialSwitch,MaterialRipple"><input type="checkbox" class="mdl-switch__input" id="switch-1"><span class="mdl-switch__label"></span><div class="mdl-switch__track"></div><div class="mdl-switch__thumb"><span class="mdl-switch__focus-helper"></span></div><span class="mdl-switch__ripple-container mdl-js-ripple-effect mdl-ripple--center" data-upgraded=",MaterialRipple"><span class="mdl-ripple"></span></span></label></td></tr></tbody></table>


            <a class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored center-block" href="#editUser" data-upgraded=",MaterialButton" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите на эту кнопку для добавления нового пользователя"><i class="material-icons">person_add</i></a>

            
           
                <br><hr><br>
             <h4 id="editUser" >Для просмотра детальных настроек пользователя, а так же возможности их изменения необходимо кликнуть на строку с интересующим пользователем, после чего на странице отобразится:</h4>

             <div>
                 
                <div >
                
                <br>
                <h3 id="editUser2">Редактирование пользователя:</h2>
                <!-- <div class="table-responsive"  id="table"> -->
                <div id="table">
    <div style="margin-bottom: 20px;">
        <button id="back" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab" data-upgraded=",MaterialButton" data-toggle="tooltip" data-placement="top" data-html="true"  title="Нажмите на эту кнопку для возврата на список всех пользователей"><i class="material-icons">keyboard_backspace</i></button>
    </div>
    <table class="table  table-condensed table-striped">
        <tbody>
            <tr>
                <td class="col-md-2" style="text-align: right;">Логин:</td>
                <td>
                    <input id="login" type="text" class="form-control" value="Demo" data-upgraded=",MaterialButton" data-toggle="tooltip" data-placement="top" data-html="true"  title="Логин пользователя, который возможно изменить">
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">Роль:</td>
                <td>
                    <select class="form-control" id="roleSelector" data-toggle="tooltip" data-placement="top" data-html="true"  title="Текущая роль пользователя, доступно для редактирования.<br> Список доступных ролей можно посмотерть <a href='#availableRoles'> ниже</a>">
                        <option value="ADMIN">ADMIN</option>
                        <option value="USER" selected>USER</option>
                        <option value="DISPATCHER">DISPATCHER</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">Компания:</td>
                <td>
                    <div class="form-group">
                        <input id="company" type="text" class="form-control" value="Demo Company" data-toggle="tooltip" data-placement="top" data-html="true"  title="Компания к которой относится  пользователя, доступно для редактирования">
                    </div>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">Доступ:</td>
                <td  data-toggle="tooltip" data-placement="left" data-html="true"  title='Доступ пользователя в систему "Dispatcher", доступно для редактирования'>
                    <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect mdl-js-ripple-effect--ignore-events is-checked is-upgraded" data-upgraded=",MaterialSwitch,MaterialRipple">
                        <input type="checkbox" class="mdl-switch__input" id="user_Demo"><span class="mdl-switch__label"></span>
                        <div class="mdl-switch__track"></div>
                        <div class="mdl-switch__thumb"><span class="mdl-switch__focus-helper"></span></div><span class="mdl-switch__ripple-container mdl-js-ripple-effect mdl-ripple--center" data-upgraded=",MaterialRipple"><span class="mdl-ripple"></span></span>
                    </label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">Доступные объекты:</td>
                <td>
                    <table class="table table-condensed" id="baseid_table">
                        <thead>
                            <tr class="success">
                                <td><b>Название</b></td>
                                <td><b>Адрес</b></td>
                                <td><b>BaseID</b></td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr id="860719023988417">
                                <td>Днепровое</td>
                                <td>
                                    <p>с. Днепровое, ул. Береговая</p><a target="_blank" href="https://www.google.com.ua/maps/place/48.246158,35.143702">Посмотреть на карте</a></td>
                                <td>860719023988417</td>
                                <td>
                                    <button class="btn btn-danger"  data-toggle="tooltip" data-placement="top" data-html="true"  title="При нажатии удаляет данный объект из списка доступных к просмотру для пользователей">Удалить</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button class="btn btn-success" id="addBut"  data-toggle="tooltip" data-placement="top" data-html="true"  title="При нажатии отображает список объектов, которые возможно добавить в список доступных к просмотру для пользователей">+</button>
                    <div id="newBase"></div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <p class="text-center">
                        <button class="btn btn-lg btn-danger " data-toggle="tooltip" data-placement="top" data-html="true"  title="Удаляет пользователя со всеми его настройками из системы">Удалить</button>
                        <button class="btn btn-lg btn-primary" style="margin-left: 30px;" data-toggle="tooltip" data-placement="top" data-html="true"  title="Сохраняет все изменения для текущего пользователя">Сохранить изменения</button>
                    </p>
                </td>
            </tr>
        </tbody>
    </table>
</div>



                <br><hr><br>

                <h4 id="availableRoles">Список доступных ролей:</h4>

                <table class="table table-striped text-center table-bordered">
               <tbody>
        <tr >
            <td><b>Доступные действия:</b></td>
            <td><b>USER</b></td>
            <td><b>DISPATCHER</b></td>
            <td><b>ADMIN</b></td>
        </tr>
        <tr class="success">
            <td>Просмотр объектов в режиме &quot;Просмотр&quot;</td>
            <td>только доступные для данного пользователя</td>
            <td>все существующие объекты</td>
            <td>все существующие объекты</td>
        </tr>
        <tr class="success">
            <td>Просмотр объектов в режиме &quot;Карта&quot;</td>
            <td>только доступные для данного пользователя</td>
            <td>все существующие объекты</td>
            <td>все существующие объекты</td>
        </tr>
        <tr>
            <td class="warning">Возможность изменять настройки по существующим объектам</td>
            <td class="danger"><b>✘</b></td>
            <td class="danger"><b>✘</b></td>
            <td class="success">для всех существующих объектов</td>
        </tr>
        <tr>
            <td class="warning">Возможность добавлять новые объекты</td>
            <td class="danger"><b>✘</b></td>
            <td class="danger"><b>✘</b></td>
            <td class="success"><b>✓</b></td>
        </tr>
        <tr>
            <td class="warning">Возможность просматривать список всех пользователей</td>
            <td class="danger"><b>✘</b></td>
            <td class="danger"><b>✘</b></td>
            <td class="success"><b>✓</b></td>
        </tr>
        <tr>
            <td class="warning">Возможность регистрировать новых пользователей</td>
            <td class="danger"><b>✘</b></td>
            <td class="danger"><b>✘</b></td>
            <td class="success"><b>✓</b></td>
        </tr>
    </tbody>



                                </div>


                </div>
                </div>
                </div>
             


    </div>
    </div>
    </div>
</sec:authorize>
    </div>

    <script>
    $(function () {$('[data-toggle="tooltip"]').tooltip()})
    </script>
    </div>
</sec:authorize>


    </body>

</html>