/**
 * Created by AlexWolf on 12.09.15.
 * Last change by AlexWolf on 19.01.16
 */


var baseIdArray = [];
var dataBaseId;
var baseId;
var autoUpdate = true;

var  myTimer =  setInterval("onLoad()",15000);

//      Метод получения текущих данных с сервера
function getDataFronServer(){



    $.ajax( "/term/getset", {
//            $.ajax( "http://localhost:5555/term/getset", {

        beforeSend: function (xhr) {
            xhr.setRequestHeader('json', 'true');
            xhr.setRequestHeader('type', 'baseid_whith_set_data');
        },
        async: false,
        cache: true,
        type: 'POST',
        data: {},
        contentType: 'application/x-www-form-urlencoded',
        dataType: "json",
        success: success,
        error: error

    } );


    function success( BaseID_Data ) {

        baseIdArray = [];
        dataBaseId = BaseID_Data.BaseID_Data;



        for (var i = 0; i < dataBaseId.length; i++) {

            var baseWith = {};
            baseWith.id = dataBaseId[i].baseid.BaseID;
            baseWith.name = dataBaseId[i].baseid.name;
            baseWith.location = dataBaseId[i].baseid.location;
            baseWith.address = dataBaseId[i].baseid.address;
            baseWith.data = dataBaseId[i].data;
            baseWith.sensors = dataBaseId[i].baseid.sensors;
            baseWith.location = dataBaseId[i].baseid.location;
            baseWith.status = dataBaseId[i].baseid.status;
            baseWith.errors = countErrors(dataBaseId[i]);
            baseIdArray.push(baseWith);

        }


    }


    function error() {
        getDataFronServer();

    }

}


function onLoad(){

    getDataFronServer();
    if (baseId !== 'null'){
        setDataOnTable();

    } else {
        createTableSelectBaseId();
    }


}


function autoUpdateFun() {
    autoUpdate = !autoUpdate;


    if (autoUpdate){
        var update = document.getElementById('update');

        update.className = "material-icons update_on";
        onLoad();
        myTimer =  setInterval("onLoad()",15000);
    } else {
        var update = document.getElementById('update');
        update.className = "material-icons";
        clearInterval(myTimer);
        onLoad();
    }

}



//Отрисовка сводной таблицы с кол-вом аваний по объктам
function createTableSelectBaseId(){




    var main = document.getElementById('table_sensors_data');
    main.innerHTML = '';



    var nameOfTable = document.createElement('caption');
    var nameOfTableDiv = document.createElement('h3');
    nameOfTableDiv.textContent = 'Действующие объекты';
    nameOfTable.appendChild(nameOfTableDiv);

    var update = document.createElement("button");
    update.className = 'btn btn-link';
    update.id = 'update';
    update.href = '#';
    if (autoUpdate)  update.innerHTML = '<i class="material-icons update_on">update</i>'
    else update.innerHTML = '<i class="material-icons">update</i>';
    var clickHandlerUpdate = function () {
        console.log("autoUpdateFun()");
        return  autoUpdateFun();
    };
    update.onclick = clickHandlerUpdate;
    nameOfTableDiv.appendChild(update);




    var table = document.createElement('TABLE');
    table.id = 'myTable';
//    table.className = 'table_view_base';
    table.className = 'table table-hover';
    table.appendChild(nameOfTable);
    // table.style.width = "60%";


    var th1 = document.createElement("TH");
    var th2 = document.createElement("TH");
    var th3 = document.createElement("TH");
    var th4 = document.createElement("TH");
    var th5 = document.createElement("TH");
    th1.textContent = '#';
    th2.textContent = 'Название';
    th3.textContent = 'Адрес';
    th4.textContent = 'Кол-во аварий';
    th5.textContent = 'Время последней передачи';

    table.appendChild(th1);
    table.appendChild(th2);
    table.appendChild(th3);
    table.appendChild(th4);
    table.appendChild(th5);

    var num = 1;

    for (var i = 0; i < baseIdArray.length; i++){
        if (($.inArray(baseIdArray[i].id, baseList))>=0 || userRole == "ADMIN" || userRole == "DISPATCHER") {

            if (baseIdArray[i].status){
                rows = table.insertRow(-1);
                cell1 = rows.insertCell(-1);
                cell2 = rows.insertCell(-1);
                cell3 = rows.insertCell(-1);
                cell4 = rows.insertCell(-1);
                cell5 = rows.insertCell(-1);
                rows.id = 'table_row_' + i;
                cell1.textContent = num;
                cell1.style.textAlign = "center";
                cell2.textContent = baseIdArray[i].name;
                cell3.textContent = baseIdArray[i].address;
                cell4.textContent = baseIdArray[i].errors.count;
                cell4.style.textAlign = "center";

                var timeData = new Date(baseIdArray[i].data.time);
                cell5.textContent =  timeData.toLocaleDateString() + ", " + timeData.toLocaleTimeString();

                if (baseIdArray[i].errors.count != 0) {
                    //            rows.className = 'errors';
                    rows.className = 'warning';
                    if (baseIdArray[i].errors.criticalError) {
                        rows.className = 'danger';

                    }

                    if (baseIdArray[i].errors.noData) {
                        rows.className = 'info';
                    }
                } else {
                    rows.className = 'success';
                }

                var base = baseIdArray[i].id;

                var clickHandler = function (base) {
                    return function () {

                        baseId = base;
                        console.log(baseId);

                        setDataOnTable();
                    };

                };
                rows.onclick = clickHandler(base);
                num++;
            }
        }
    }
    if (baseList.length == 0 && userRole == "USER"){
        rows = table.insertRow(-1);
        cell1 =  rows.insertCell(-1);
        cell2 =  rows.insertCell(-1);
        cell3 =  rows.insertCell(-1);
        cell4 =  rows.insertCell(-1);
        rows.id = 'table_row_' + i;
        cell1.textContent = num;
        cell1.style.textAlign =  "center";
        cell2.textContent = "";
        cell3.textContent = "Нет доступных объектов";
        cell4.textContent = "";
        cell4.style.textAlign =  "center";
//          rows.className = 'errors';
        rows.className = 'danger';

    }
    main.appendChild(table);


}


function setSelector(){

    var selector = document.getElementById('selector');

    var baseIdSelect = document.createElement('SELECT');


    var baseIdcont  = document.createElement('OPTION');
    baseIdcont.setAttribute("value", '');
    var name = document.createTextNode('');
    baseIdcont.appendChild(name);
    baseIdSelect.appendChild(baseIdcont);
    //baseIdcont.disabled = true;

    for (var i =0; i < baseIdArray.length; i++){
        var titleBaseId = baseIdArray[i].name;
        var basId = baseIdArray[i].id;
        var baseIdcont  = document.createElement('OPTION');
        baseIdcont.setAttribute("value", basId);
        var name = document.createTextNode(titleBaseId);
        baseIdcont.appendChild(name);
        baseIdSelect.appendChild(baseIdcont);

    }


    baseIdSelect.addEventListener("change", function() {

        baseId = baseIdSelect.options[baseIdSelect.selectedIndex].value;
        if (baseId !== ''){
            setDataOnTable();

        }




    });

    if (baseId !== undefined){

        baseIdSelect.value = baseId;
        setDataOnTable();

    }

    selector.appendChild(baseIdSelect);
}



//Отображение информации по выбранному объекту
function setDataOnTable(){
    var main = document.getElementById('table_sensors_data');
    main.innerHTML = '';
    main.styleName = 'container'


    var buttonBack = document.createElement('button');
    buttonBack.onclick = function() {baseId = 'null'; createTableSelectBaseId()};
    buttonBack.innerHTML = '<i class="material-icons">keyboard_backspace</i>';
    main.appendChild(buttonBack);
    buttonBack.className = "mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab";
    buttonBack.style.top = "100px";
    buttonBack.style.left = "3%";
    buttonBack.style.position = "fixed";
    buttonBack.style.zIndex = 990;
    var divSensTable = document.createElement('div');
    divSensTable.className = 'otstup'
    var table = document.createElement('TABLE');
    //table.style.width = "60%";
    // table.style.top = "120px";
    divSensTable.appendChild(table);
    table.className = 'data_table  ';

    //if (baseId != undefined) {
    for (var i = 0; i < baseIdArray.length; i++){

        if (baseId == baseIdArray[i].id){


            var rows = table.insertRow(-1);
            var cell1 =  rows.insertCell(-1);
            var cell2 =  rows.insertCell(-1);
            // cell1.style.width = "50%";
            //                      cell2.style.width = "50%";

            var name = document.createElement('div');
            name.id = 'name';

            var bas_id = document.createElement('div');
            bas_id.id = 'id';
            bas_id.hidden = true;



            var name1 = document.createElement('div');
            name1.innerHTML = 'Название точки: ';
            name1.id = 'name1';
            name1.appendChild(bas_id);
            var sel = document.getElementById('selector');
            var name2 = document.createElement('div');
            //sel.cloneNode(true);
            name2.id = 'name2';
            //sel.innerHTML = '';
            //setSelector();


            name2.innerHTML = baseIdArray[i].name;
            cell1.appendChild(name1);
            cell2.appendChild(name2);


            //Address of point

            var address = document.createElement('div');
            var address1 = document.createElement('div');
            address1.innerHTML = 'Адрес точки: ';
            var address2 = document.createElement('input');
            address2.type = 'text';
            address2.name = 'address';
            address2.size = 50;
            address2.id = 'address';
            address2.disabled = true;
            address2.value = baseIdArray[i].address;



            rows = table.insertRow(-1);
            cell1 =  rows.insertCell(-1);
            cell2 =  rows.insertCell(-1);
            cell1.appendChild(address1);
            cell2.appendChild(address2);



            var location = document.createElement('div');
            var location1 = document.createElement('div');
            location1 .innerHTML = 'Геопозиция точки:';
            location1.id = 'loc1';
            var location2 = document.createElement('input');
            location2.type = 'text';
            location2.name = 'location';
            location2.size = 19;
            location2.id = 'loc2';
            location2.disabled = true;
            location2.value = baseIdArray[i].location;
            location.id = 'loc';

            var locMap = document.createElement('div');
//            locMap.id = 'map';


            rows = table.insertRow(-1);
            cell1 =  rows.insertCell(-1);
            cell2 =  rows.insertCell(-1);
            cell1.appendChild(location1);
            cell2.appendChild(location2);
            cell2.appendChild(locMap);



            var status1 = document.createElement('div');
            status1.innerHTML = 'Работает ';
            var status2 = document.createElement('input');
            status2.type = 'checkbox';
            status2.name = 'status';
            status2.checked = baseIdArray[i].status;
            status2.disabled = true;








            rows = table.insertRow(-1);
            cell1 =  rows.insertCell(-1);
            cell2 =  rows.insertCell(-1);
            cell1.appendChild(status1);
            cell2.appendChild(status2);



            if (userRole == "ADMIN"){
                var balance1 = document.createElement('strong');
                balance1.textContent = 'Текущий баланс:';
                var balance2 = document.createElement('strong');
                balance2.textContent = baseIdArray[i].data.balance + " грн."

                rows = table.insertRow(-1);
                cell1 =  rows.insertCell(-1);
                cell2 =  rows.insertCell(-1);
                cell1.appendChild(balance1);
                cell2.appendChild(balance2);


                var phoneNumber1 = document.createElement('strong');
                phoneNumber1.textContent = 'Номер телефона: ';
                var phoneNumber2 = document.createElement('strong');
                phoneNumber2.textContent = baseIdArray[i].data.location

                rows = table.insertRow(-1);
                cell1 =  rows.insertCell(-1);
                cell2 =  rows.insertCell(-1);
                cell1.appendChild(phoneNumber1);
                cell2.appendChild(phoneNumber2);

                if(typeof (baseIdArray[i].data.version) !== "undefined"){
                    var version1 = document.createElement('strong');
                    version1.textContent = 'Версия прошивки: ';
                    var version2 = document.createElement('strong');
                    version2.textContent = baseIdArray[i].data.version;

                    rows = table.insertRow(-1);
                    cell1 =  rows.insertCell(-1);
                    cell2 =  rows.insertCell(-1);
                    cell1.appendChild(version1);
                    cell2.appendChild(version2);

                }


            }

            var sensors = document.createElement('div');
            var sensorsName = document.createElement('div');
            sensorsName.innerHTML = '<b>Текущие показания:</b>';
            sensors.appendChild(sensorsName);



            rows = table.insertRow(-1);
            cell1 =  rows.insertCell(-1);
            cell1.appendChild(sensors);
            var lastT = document.createElement('div');
            var timeData = new Date(baseIdArray[i].data.time);
            var lastTimeData = document.createElement('label');
            lastTimeData.textContent = timeData.toLocaleTimeString() + ", " + timeData.toLocaleDateString();
            lastTimeData.style.marginRight = "40px";


            var buttonArchive = document.createElement('button');
            buttonArchive.type = "button";
            buttonArchive.textContent = "Перейти в Архив";
            buttonArchive.className = "mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect";
            buttonArchive.addEventListener('click', function() {
                window.open("archive?base_Id="+baseId );
            });
            cell2 =  rows.insertCell(-1);
            cell2.appendChild(lastT);
            lastT.appendChild(lastTimeData);
            lastT.appendChild(buttonArchive);



            //            Добавление таблицы для температурных датчиков

            var typeSensor = document.createElement('caption');
            //typeSensor.innerHTML = '<b>Температурные датчики:</b>';
            var tableSensor  = document.createElement('TABLE');
            tableSensor.id = 'sensors_table';
//                tableSensor.className = 'sensors_table';
            tableSensor.className = 'table table-hover';
            tableSensor.style.width = "100%";
//            tableSensor.setAttribute('style','border: 1px solid grey; border-collapse: collapse;');

            rows = table.insertRow(-1);
            cell1 =  rows.insertCell(-1);
//                cell2 =  rows.insertCell(-1);
            cell1.appendChild(typeSensor);
            cell1.setAttribute('align','char;');
            cell1.setAttribute('colspan', '2');
            cell1.appendChild(tableSensor);
            tableSensor.appendChild(typeSensor);

            var rowsSensor= tableSensor.insertRow(-1);
//                rowsSensor.className = 'sensors_head_table';
            rowsSensor.className ="active";
            var cellSensor1 =  rowsSensor.insertCell(-1);
            cellSensor1.id = 'numSensor'
            cellSensor1.textContent = '#';
//                cellSensor1.class = 'sensors_head_table';
//                cellSensor1.setAttribute('style','text-align:right;');
            var cellSensor2 =  rowsSensor.insertCell(-1);
            cellSensor2.textContent = 'Название датчика';

            var cellSensor3 =  rowsSensor.insertCell(-1);
            cellSensor3.textContent = 'Значение';
//                cellSensor3.setAttribute('style','text-align:center;');

            var cellSensor4 =  rowsSensor.insertCell(-1);
            cellSensor4.textContent = 'Действующий предел';
//                cellSensor4.setAttribute('style','text-align:center;');


            var num = 1;


            function drawSensTable(typeS) {
                for (var j = 0; j < baseIdArray[i].sensors.length; j++) {
                    var type = baseIdArray[i].sensors[j].type;
                    if (baseIdArray[i].sensors[j].used && type == typeS) {


                        var sensorNum = document.createElement('div');
                        sensorNum.textContent = '' + num;

                        var sensorName = document.createElement('div');
                        sensorName.textContent = baseIdArray[i].sensors[j].name;

                        var id = baseIdArray[i].sensors[j].sensorId;

                        var min = baseIdArray[i].sensors[j].min;
                        var max = baseIdArray[i].sensors[j].max;
                        var pred = document.createElement('div');


                        var nameOfSensor;
                        if (type == 'tm') {
                            nameOfSensor = 'term';

                        } else if (type == 'dt') {
                            nameOfSensor = 'signal';

                        }
                        nameOfSensor += id;

                        var data = baseIdArray[i].data[nameOfSensor];

                        var sensorData = document.createElement('div');
                        sensorData.textContent = data;

                        var color;

                        if (data >= min && data <= max) {
                            //green
//                            color = 'rgba(127, 255, 0, 0.43)';
                            color = 'success';
                            pred.textContent = min + ' < ... > ' + max;

                        } else if (data < min) {
                            //blue
//                            color = 'rgba(30, 144, 255, 0.71)';
                            color ='info';
                            pred.textContent = '< ' + min;
                        } else if (data > max) {
                            //red
//                            color = 'rgba(205, 92, 92, 0.7)';
                            color = 'warning';
                            if (baseIdArray[i].sensors[j].criticalError) color = 'danger';
                            pred.textContent = '> ' + max;
                        }

                        if (type == 'dt'){

                            if (data == min) {
//                                color = 'rgba(127, 255, 0, 0.43)';
                                color = 'success';
                                sensorData.textContent = '✓';

                            } else {
//                                color = 'rgba(205, 92, 92, 0.7)';
                                color = 'warning';
                                if (baseIdArray[i].sensors[j].criticalError) color = 'danger';
                                sensorData.textContent = '✘';
                            }

                            pred.textContent = '';
                        }


                        rowsSensor = tableSensor.insertRow(-1);
                        rowsSensor.className = color;
//                        rowsSensor.setAttribute('style', 'background-color : ' + color + '; opacity : 0,7');
                        cellSensor1 = rowsSensor.insertCell(-1);
                        cellSensor1.appendChild(sensorNum);
                        cellSensor1.setAttribute('style', 'text-align:right;');
                        cellSensor2 = rowsSensor.insertCell(-1);
                        cellSensor2.appendChild(sensorName);
                        cellSensor3 = rowsSensor.insertCell(-1);
                        cellSensor3.appendChild(sensorData);
                        cellSensor3.setAttribute('style', 'text-align:center;');
                        cellSensor4 = rowsSensor.insertCell(-1);
                        cellSensor4.appendChild(pred);
                        cellSensor4.setAttribute('style', 'text-align:center;');
                        //cellSensor4.setAttribute('style', 'background-color : ' + color + '; opacity : 0,7');

                        num++;
                    }
                }



            }

            drawSensTable('tm');
            drawSensTable('dt');




        }
    }

    //}
    main.appendChild(divSensTable);

}



//Подсчет кол-ва ошибок и их типа по объкту
function countErrors(baseId){

    var error = { count : 0,
        criticalError : false};


    for (var j = 0; j < baseId.baseid.sensors.length; j++) {
        var type = baseId.baseid.sensors[j].type;
        if (baseId.baseid.sensors[j].used) {

            var id = baseId.baseid.sensors[j].sensorId;

            var nameOfSensor;
            if (type == 'tm') {
                nameOfSensor = 'term';

            } else if (type == 'dt') {
                nameOfSensor = 'signal';

            }
            nameOfSensor += id;
            var min = baseId.baseid.sensors[j].min;
            var max = baseId.baseid.sensors[j].max;
            var data = baseId.data[nameOfSensor];
            var criticalError = baseId.baseid.sensors[j].criticalError;


            if (type == 'tm') {
                if (data < min || data > max) {
                    error.count++;
                    if(criticalError) error.criticalError = criticalError;
                }
            } else if (type == 'dt') {

                if (data != min) {
                    error.count++;
                    if(criticalError) error.criticalError = criticalError;

                }
            }



        }


    }
    var currTime = new Date().getTime();
    var lastData = new Date(baseId.data.time).getTime();
    if ((currTime - lastData) > 901000) {
        error.count = "Не передаются данные";
        error.noData = true;

    }

    return error;
}


function setTextContent(element, text) {
    while (element.firstChild!==null)
        element.removeChild(element.firstChild); // remove all existing content
    element.appendChild(document.createTextNode(text));
}




