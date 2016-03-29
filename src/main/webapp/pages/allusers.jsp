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
 
    <title>Управление пользователями</title>
 
    <!-- Bootstrap core CSS -->
    <link href="../pages/css/bootstrap.css" rel="stylesheet">
 
    <link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300' rel='stylesheet' type='text/css'>

	<link type="text/css" rel="stylesheet" href="../pages/css/main.css">
    
     <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->

     <script src="http://code.jquery.com/jquery-2.1.4.js" ></script>

     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">

     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha256-KXn5puMvxCw+dAYznun+drMdG1IFl3agK0p/pqT9KAo= sha512-2e8qq0ETcfWRI4HJBzQiA3UoyFk6tbNyG+qSaIBZLyW9Xf3sWZHN/lxe9fTh1U45DpPf07yj94KsUHHWe4Yk1A==" crossorigin="anonymous"></script>
	

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
 
<body onload="onLoadPage()">
 <%@include file="../pages/header.jsp" %>
<sec:authorize access="!isAuthenticated()">
	<div class="container otstup text-center">
            <p><a class="btn btn-lg btn-success " href="../login" role="button">Войти</a></p>
        </div>
</sec:authorize>

 <sec:authorize access="isAuthenticated()">
 
 
<div class="container"  >
<div id="alert" class="hidden"></div>
</br>
<h2 id="spisok">Список пользователей:</h2>
<!-- <div class="table-responsive"  id="table"> -->
<div  id="table">
    <script>


        var AllBaseId = [];
        var User;


        function onLoadPage(){

            loadFromServer();
            getBaseFromServer();
        }


        function loadFromServer(){
                $.ajax( "../user/getall", {
//            $.ajax( "/secure/user/getall", {
                cache: true,
                type: 'POST',
//                data: {},
                contentType: 'application/json',
                dataType: "json",
                success: success,
                error: error,
                async: false

            } );

        }


        function success(forecastData) {
            var userList = forecastData;
            var divForTable = document.getElementById('table');
            divForTable.innerHTML = '';
            var table = document.createElement('table');
            table.className = 'table table-hover table-condensed';
            console.log('success')
            divForTable.appendChild(table);

            for (var i = 0; i < userList.length; i++){
                var user = userList[i];
                if (i == 0) {
                    var header = table.createTHead();
                    var rows = header.insertRow(-1);
                    rows.className = "success";
                    var cell1 =  rows.insertCell(-1);
                    cell1.innerHTML = '<b>#</b>';
                    var cell2 =  rows.insertCell(-1);
                    cell2.innerHTML = '<b>Login</b>';
                    var cell3 = rows.insertCell(-1);
                    cell3.innerHTML = '<b>Организация</b>';
                    var cell4 = rows.insertCell(-1);
                    cell4.innerHTML = '<b>Доступ</b>';

                    var tbody = table.createTBody();
                    var rows = tbody.insertRow(-1);
                    var cell1 =  rows.insertCell(-1);
                    cell1.textContent = i+1;
                    var cell2 =  rows.insertCell(-1);
                    cell2.textContent = userList[i].login;
                    var cell3 = rows.insertCell(-1);
                    cell3.textContent = userList[i].company;
                    var cell4 = rows.insertCell(-1);
                    var labelForCheck = document.createElement('label');
                    labelForCheck.className = "mdl-switch mdl-js-switch mdl-js-ripple-effect";
                    labelForCheck.for = "switch-1";

                    var checkbox = document.createElement('input');
                    checkbox.type = 'checkbox';
                    //checkbox.disabled = true;
                    checkbox.className = 'mdl-switch__input';
                    checkbox.id = "switch-1";

                    checkbox.checked = userList[i].locked;
                    var spanForCheck = document.createElement('span');
                    spanForCheck.className = "mdl-switch__label";
                    labelForCheck.appendChild(checkbox);
                    labelForCheck.appendChild(spanForCheck);
                    cell4.appendChild(labelForCheck);

                    var clickHandler =  function(user) {
                        return function() {

                            createTableforUser(user);

                        };

                    };
                    rows.onclick = clickHandler(user);

                } else {
                    var rows = table.insertRow(-1);
                    var cell1 =  rows.insertCell(-1);
                    cell1.textContent = i+1;
                    var cell2 =  rows.insertCell(-1);
                    cell2.textContent = userList[i].login;
                    var cell3 = rows.insertCell(-1);
                    cell3.textContent = userList[i].company;
                    var cell4 = rows.insertCell(-1);
                    var labelForCheck = document.createElement('label');
                    labelForCheck.className = "mdl-switch mdl-js-switch mdl-js-ripple-effect";
                    labelForCheck.for = "switch-1";
                    var checkbox = document.createElement('input');
                    checkbox.type = 'checkbox';
                    checkbox.className = 'mdl-switch__input';
                    checkbox.id = "switch-1";

                    checkbox.checked = userList[i].locked;
                    var spanForCheck = document.createElement('span');
                    spanForCheck.className = "mdl-switch__label";
                    labelForCheck.appendChild(checkbox);
                    labelForCheck.appendChild(spanForCheck);
                    cell4.appendChild(labelForCheck);
                    var clickHandler =  function(user) {
                        return function() {

                            createTableforUser(user);

                        };

                    };
                    rows.onclick = clickHandler(user);


                }



            }

                    var buttonAddUser = document.createElement('a');
                    buttonAddUser.className = "mdl-button mdl-js-button mdl-button--fab mdl-button--colored center-block";
                    var textForButtonAddUser = document.createElement('i');
                    textForButtonAddUser.className = "material-icons";
                    textForButtonAddUser.textContent = "person_add";
                    buttonAddUser.appendChild(textForButtonAddUser);
                    buttonAddUser.role = "button";
                    buttonAddUser.href = '<c:url value="/user/" />';
                    divForTable.appendChild(buttonAddUser);

                 componentHandler.upgradeAllRegistered();
                 componentHandler.upgradeDom();

        }

        function error(data){
        	console.log(data);

        	 $().alert("Error!!!", {

//     

			});


            // alert("Error!!!")
        }


        function  createTableforUser(user) {

        	$("#spisok").text("Редактирование пользователя:");
            User = user;
            var divForTable = document.getElementById('table');
            divForTable.innerHTML = '';
            var buttonBack =  document.createElement('div');
            buttonBack.innerHTML  = '<button id="back" onclick="loadFromServer()()" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab"><i class="material-icons">keyboard_backspace</i></button>';
            buttonBack.style.marginBottom = "20px";

            var table = document.createElement('table');
            table.className = 'table  table-condensed table-striped';
            
            divForTable.appendChild(buttonBack);
            divForTable.appendChild(table);

            var rows = table.insertRow(-1);
            var cell1 =  rows.insertCell(-1);
            cell1.textContent = 'Логин:';
            cell1.className = "col-md-2";
			cell1.style.textAlign = "right";
            var cell2 =  rows.insertCell(-1);
            var loginInput = document.createElement("input");
            loginInput.id = "login";
            loginInput.type = "text";
            loginInput.className = 'form-control';
            loginInput.value =  user.login;
            cell2.appendChild(loginInput);
            var rows = table.insertRow(-1);
            var cell1 =  rows.insertCell(-1);
            cell1.textContent = 'Роль:';
			cell1.style.textAlign = "right";
            var cell2 =  rows.insertCell(-1);
            var roleSelector = document.createElement("SELECT");
            roleSelector.className = 'form-control';
            roleSelector.id = "roleSelector";
            var roles = ['ADMIN','USER','DISPATCHER'];
            for (var i = 0; i < roles.length; i++){
                var option = document.createElement("option");
                option.value = roles[i];
                option.text = roles[i];
                roleSelector.add(option);
            }



            roleSelector.value =  user.role;
            cell2.appendChild(roleSelector);
 			var rows = table.insertRow(-1);
            var cell1 =  rows.insertCell(-1);
            cell1.textContent = 'Компания:';
			cell1.style.textAlign = "right";
            var cell2 =  rows.insertCell(-1);
            var companyDiv = document.createElement('div');
            companyDiv.className = "form-group";
            var companyInput = document.createElement("input");
            companyInput.id = "company";
            companyInput.type = "text";
            companyInput.className = 'form-control';
            companyInput.value =  user.company;
            companyDiv.appendChild(companyInput);
            cell2.appendChild(companyDiv);

            var rows = table.insertRow(-1);
            var cell1 =  rows.insertCell(-1);
            cell1.textContent = 'Доступ:';
			cell1.style.textAlign = "right";
            var cell2 =  rows.insertCell(-1);

            var labelForCheck = document.createElement('label');
            labelForCheck.className = "mdl-switch mdl-js-switch mdl-js-ripple-effect";
            labelForCheck.for = "user_"+user.login;
            var checkbox = document.createElement('input');
            checkbox.type = 'checkbox';
            checkbox.className = 'mdl-switch__input';
            checkbox.id = "user_"+user.login;

            checkbox.checked = user.locked;
            var spanForCheck = document.createElement('span');
            spanForCheck.className = "mdl-switch__label";
            labelForCheck.appendChild(checkbox);
            labelForCheck.appendChild(spanForCheck);
            cell2.appendChild(labelForCheck);
            var rows = table.insertRow(-1);
            var cell1 =  rows.insertCell(-1);
            cell1.textContent = 'Доступные объекты:';
			cell1.style.textAlign = "right";
            var cell2 =  rows.insertCell(-1);
            var baseTable = document.createElement('table');
            baseTable.className = 'table table-condensed';
            baseTable.id = 'baseid_table';
            cell2.appendChild(baseTable);
            var header = baseTable.createTHead();
            var rowsH = header.insertRow(-1);
            rowsH.className = "success";
            // var cellH1 =  rowsH.insertCell(-1);
            // cellH1.innerHTML = '<b>#</b>';
            var cellH2 =  rowsH.insertCell(-1);
            cellH2.innerHTML = '<b>Название</b>';
            var cell3 = rowsH.insertCell(-1);
            cell3.innerHTML = '<b>Адрес</b>';
            var cell4 = rowsH.insertCell(-1);
            cell4.innerHTML = '<b>BaseID</b>';
            var cell5 = rowsH.insertCell(-1);
            cell5.innerHTML = '';

            var tbody = baseTable.createTBody();


            for (var j = 0; j < user.baseIdSet.length; j++){

                var rowsT = tbody.insertRow(-1);
                rowsT.id = user.baseIdSet[j].baseID;
//                rowsH.className = "success";
                // var cellT1 =  rowsT.insertCell(-1);
                // cellT1.textContent = j+1;
                var cellT2 =  rowsT.insertCell(-1);
                cellT2.textContent = user.baseIdSet[j].name;
                var cellT3 = rowsT.insertCell(-1);
                cellT3.innerHTML = '<p>'+user.baseIdSet[j].address + '</p>'
                    + '<a  target="_blank" href="https://www.google.com.ua/maps/place/'+user.baseIdSet[j].location +'">Посмотреть на карте</a>';
                var cellT4 = rowsT.insertCell(-1);
                cellT4.textContent = user.baseIdSet[j].baseID;
                var cell5 = rowsT.insertCell(-1);
                var buttonDel = document.createElement('button');
                buttonDel.className ='btn btn-danger';
                buttonDel.textContent = 'Удалить';
                buttonDel.addEventListener('click', deleteR, false );
                cell5.appendChild(buttonDel);



            }

            var buttonMore = document.createElement('button');
            buttonMore.className = 'btn btn-success';
            buttonMore.textContent = '+';
            buttonMore.id = "addBut"
            buttonMore.addEventListener('click', showNewBase, false );
            cell2.appendChild(buttonMore);
            var containerForNew = document.createElement('div');
            containerForNew.id = 'newBase';
            cell2.appendChild(containerForNew);

            var rows = table.insertRow(-1);
            var cell1 =  rows.insertCell(-1);
            // cell1.setAttribute('align','char;');
            cell1.setAttribute('colspan', '2');
            var buttonContainer = document.createElement('p');
            buttonContainer.className = 'text-center';
            // buttonContainer.role = 'group';

            var buttonDeleteUser = document.createElement('button');
            buttonDeleteUser.className = 'btn btn-lg btn-danger ';
            buttonDeleteUser.textContent = 'Удалить';
            buttonDeleteUser.onclick = deleteUser;

            var buttonSave = document.createElement('button');
            buttonSave.className = 'btn btn-lg btn-primary';
            buttonSave.textContent = 'Сохранить изменения';
            buttonSave.style.marginLeft = "30px";
            buttonSave.onclick = saveUser;


            // var propusk = document.createElement('div');

            
            buttonContainer.appendChild(buttonDeleteUser);
            buttonContainer.appendChild(buttonSave);
            cell1.appendChild(buttonContainer);

            componentHandler.upgradeDom();
            componentHandler.upgradeAllRegistered();




        }
        function deleteR(e) {
            var tr = e.target.parentNode.parentNode
            // buttonDel.parentNode.parentNode;
            document.getElementById('baseid_table').deleteRow(tr.rowIndex);
            console.log(tr);
            showNewBase();


        }


        function getBaseFromServer(){
            $.ajax( "http://52.11.54.112:5555/term/getset", {
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('json', 'true');
                    xhr.setRequestHeader('type', 'get');
                },
                cache: true,
                type: 'POST',
                data: {},
                contentType: 'application/x-www-form-urlencoded',
                dataType: "json",
                success: saveBaseid,
                error: error,
                async: false

            } );

            function saveBaseid(data){
                var BaseID = data.BaseID;
                AllBaseId = BaseID;

            }


        }



        function showNewBase(){

                getBaseFromServer();
                

                var containerForNew = document.getElementById('newBase');
                containerForNew.innerHTML = '';

                containerForNew.className = "visible";
                var nameForTable = document.createElement('b');
                nameForTable.textContent = "Доступные к добавлению объекты:"
                containerForNew.appendChild(nameForTable);
                var tableNewBase = document.createElement('table');
                containerForNew.appendChild(tableNewBase);
                tableNewBase.className = 'table table-condensed';
                tableNewBase.id = 'new_baseid_table';

                var header = tableNewBase.createTHead();
                var rowsH = header.insertRow(-1);
                rowsH.className = "success";
                // var cellH1 =  rowsH.insertCell(-1);
                // cellH1.innerHTML = '<b>#</b>';
                var cellH2 =  rowsH.insertCell(-1);
                cellH2.innerHTML = '<b>Название</b>';
                var cell3 = rowsH.insertCell(-1);
                cell3.innerHTML = '<b>Адрес</b>';
                var cell4 = rowsH.insertCell(-1);
                cell4.innerHTML = '<b>BaseID</b>';
                var cell5 = rowsH.insertCell(-1);
                cell5.innerHTML = '';
                var tbody = tableNewBase.createTBody();
                var currentBase =  document.getElementById('baseid_table').rows;
                console.log(currentBase);
                var count = 0;

                for (var a = 0; a < AllBaseId.length; a++){
                    console.log(AllBaseId[a].BaseID + " | " + currentBase.namedItem(AllBaseId[a].BaseID));
                    if (currentBase.namedItem(AllBaseId[a].BaseID) == null) {
                        count++;
                        var rowsT = tbody.insertRow(-1);
                        rowsT.id = AllBaseId[a].BaseID;
//                           rowsH.className = "success";
                        // var cellT1 = rowsT.insertCell(-1);
                        // cellT1.textContent = count;
                        var cellT2 = rowsT.insertCell(-1);
                        cellT2.textContent = AllBaseId[a].name;
                        var cellT3 = rowsT.insertCell(-1);
                        cellT3.innerHTML = '<p>' + AllBaseId[a].address + '</p>'
                            + '<a  target="_blank" href="https://www.google.com.ua/maps/place/' + AllBaseId[a].location + '">Посмотреть на карте</a>';
                        var cellT4 = rowsT.insertCell(-1);
                        cellT4.textContent = AllBaseId[a].BaseID;
                        var cell5 = rowsT.insertCell(-1);
                        var buttonDel = document.createElement('button');
                        buttonDel.className = 'btn btn-success';
                        buttonDel.textContent = '+';
                        buttonDel.addEventListener('click', addToUser, false);
                        cell5.appendChild(buttonDel);

                        var addBut = document.getElementById('addBut');
                        addBut.className = "btn btn-default";
                        addBut.textContent = "Скрыть";
                        addBut.removeEventListener('click', showNewBase, false );
                        addBut.addEventListener('click', invisibleNew, false );



                    }

                }

                if (count == 0) {
                    containerForNew.innerHTML = '';
                    var nameForTable = document.createElement('b');
                    nameForTable.textContent = "Нет доступных к добавлению объектов...";
                    containerForNew.appendChild(nameForTable);

                }




        }

        function addToUser(e){
            var table = document.getElementById('baseid_table');
            var tbody = table.tBodies.item(0);
            var tr = e.target.parentNode.parentNode
            document.getElementById('new_baseid_table').deleteRow(tr.rowIndex);
            console.log(tr);

            var rowsT = tbody.insertRow(-1);
            rowsT.innerHTML = tr.innerHTML;
            rowsT.id = tr.id;
            var cell5 = table.rows[table.rows.length-1].cells[table.rows[table.rows.length-1].cells.length-1];
            cell5.innerHTML = '';
            var buttonDel = document.createElement('button');
            buttonDel.className ='btn btn-danger';
            buttonDel.textContent = 'Удалить';
            buttonDel.addEventListener('click', deleteR, false );
            cell5.appendChild(buttonDel);







        }


        function invisibleNew() {
            var newBaseDiv = document.getElementById('newBase');
            newBaseDiv.className = "invisible";


            var buttonMore = document.getElementById('addBut');
            buttonMore.className = "btn btn-success";
            buttonMore.textContent = '+';
            buttonMore.id = "addBut";
            buttonMore.removeEventListener('click', invisibleNew, true );
            buttonMore.addEventListener('click', showNewBase, false );

        };




        function deleteUser(){

             var user = {
                id : User.id,
                password: User.password,
                time: User.time,
                company: User.company,
                login : User.login,
                role : User.role,
                locked : User.locked
                // baseIdSet: User.baseIdSet
            };



        	 $.ajax( "../user/delete", {


                cache: true,
                type: 'POST',

                contentType: 'application/json',
                dataType: "json",
                success: successDeleteUser,
                // error: error,
                data: JSON.stringify(user),
                async: false

            } );




        }


        function saveUser(){
            var baseIdSet = [];
            var currentBase =  document.getElementById('baseid_table').rows;

             for (var j = 0; j < AllBaseId.length; j++){

                    if(currentBase.namedItem(AllBaseId[j].BaseID) != null) {

                        var a = {

                            "name":AllBaseId[j].name,
                            "location":AllBaseId[j].location,
                            "address":AllBaseId[j].address,
                            "district":AllBaseId[j].district,
                            "status":AllBaseId[j].status,
                            "id":AllBaseId[j].ID,
                            "baseID":AllBaseId[j].BaseID
                        }
                        baseIdSet.push(a);

                    }
                }

            var user = {
                id : User.id,
                password: User.password,
                time: User.time,
                company: document.getElementById("company").value,
                login : document.getElementById("login").value,
                role : document.getElementById("roleSelector").value,
                locked : document.getElementById("user_"+User.login).checked,
                baseIdSet : baseIdSet
            };

            

            $.ajax( "../user/edit", {


                cache: true,
                type: 'POST',

                contentType: 'application/json',
                dataType: "json",
                success: successUser,
                error: error,
                data: JSON.stringify(user),
                async: false

            } );

        }

        function successUser(result){

        	$("#spisok").text("Список пользователей:");

            // alert("Все изменения сохранены");

            $("#alert").addClass("alert alert-success").removeClass("hidden").html('Все изменения сохранены!!!<span class="close">&times;</span>');
            $(function(){
   				 $(".close").click(function(){
     				 $("#alert").alert('close');
   					 });
				});




            loadFromServer();

			componentHandler.upgradeDom();
            componentHandler.upgradeAllRegistered();

        }


         function successDeleteUser(result){

        	$("#spisok").text("Список пользователей:");

            // alert("Все изменения сохранены");

            $("#alert").addClass("alert alert-success").removeClass("hidden").html('Пользователь '+ User.login+' удален!<span class="close">&times;</span>');
            $(function(){
   				 $(".close").click(function(){
     				 $("#alert").alert('close');
   					 });
				});




            loadFromServer();

             componentHandler.upgradeDom();
             componentHandler.upgradeAllRegistered();

        }


    
    </script>
    
    
    
</div>
</div>
</sec:authorize>
 
</body>
</html>