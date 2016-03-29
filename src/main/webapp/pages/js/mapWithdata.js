/**
 * Created by Alex on 27.09.15.
 */


var script = '<script type="text/javascript" src="./pages/js/markerclusterer';
      if (document.location.search.indexOf('compiled') !== -1) {
        script += '_compiled';
      }
      script += '.js"><' + '/script>';
      document.write(script);



var  map;
var markerCluster;
var markers = [];
var dataBaseIdOld = [];
var showAll = true;
var audio = new Audio(); // Создаём новый элемент Audio
audio.src = './pages/audio/Space Alarm.mp3'; // Указываем путь к звуку "клика"
audio.autoplay = false; // Автоматически не запускаем
audio.loop = false;
console.log(audio.duration );


//        var link = document.querySelector('link[rel="import"]').import;
//        var content = link.querySelector('.menu');;
//        var menu = document.getElementById('top_menu');
//            menu.appendChild(content);



/**
 *Переопределение методов для работы с кластерами. Иконка  и надпись в зависимости от наличия ошибок
 *Updates the cluster icon
 */
// Cluster.prototype.updateIcon = function() {
//   var zoom = this.map_.getZoom();
//   var mz = this.markerClusterer_.getMaxZoom();

//   if (mz && zoom > mz) {
//     // The zoom is greater than our max zoom so show all the markers in cluster.
//     for (var i = 0, marker; marker = this.markers_[i]; i++) {
//       marker.setMap(this.map_);
//     }
//     return;
//   }

//   if (this.markers_.length < this.minClusterSize_) {
//     // Min cluster size not yet reached.
//     this.clusterIcon_.hide();
//     return;
//   }

//   var numStyles = this.markerClusterer_.getStyles().length;
//   var sums = this.markerClusterer_.getCalculator()(this.markers_, numStyles);
//   this.clusterIcon_.setCenter(this.center_);
//   this.clusterIcon_.setSums(sums);
//   this.clusterIcon_.show();
// };


// *
//  * Переопределение метода отображения стиля иконки
//  * A cluster icon
//  *
//  * @param {Cluster} cluster The cluster to be associated with.
//  * @param {Object} styles An object that has style properties:
//  *     'url': (string) The image url.
//  *     'height': (number) The image height.
//  *     'width': (number) The image width.
//  *     'anchor': (Array) The anchor position of the label text.
//  *     'textColor': (string) The text color.
//  *     'textSize': (number) The text size.
//  *     'backgroundPosition: (string) The background postition x, y.
//  * @param {number=} opt_padding Optional padding to apply to the cluster icon.
//  * @constructor
//  * @extends google.maps.OverlayView
//  * @ignore
 
// function ClusterIcon(cluster, styles, opt_padding) {
//   cluster.getMarkerClusterer().extend(ClusterIcon, google.maps.OverlayView);

//   this.styles_ = styles;
//   this.padding_ = opt_padding || 0;
//   this.cluster_ = cluster;
//   this.center_ = null;
//   this.map_ = cluster.getMap();
//   this.div_ = null;
//   this.sums_ = null;
//   this.visible_ = false;

//   this.setMap(this.map_);
// }




/**
 *  The function for calculating the cluster icon image.
 *
 *  @param {Array.<google.maps.Marker>} markers The markers in the clusterer.
 *  @param {number} numStyles The number of styles available.
 *  @return {Object} A object properties: 'text' (string) and 'index' (number).
 *  @private
 */
function myClusterCalc(markers, numStyles) {

  var index = 0;
  var count = 0;
  var hasCritical = false;
    var hasNotCriticalError = false;
    var noData = false;

  for (var i = 0; i < markers.length; i++){
    if (markers[i].label != 0) count++;

    switch(markers[i].icon.error){
        case "critical":
        //index = 3;
        hasCritical = true;
        break;

        case "not critical":
        //index = 2;
            hasNotCriticalError = true;
        break;

        case "no data":
        //index = 6;
            noData = true;
        break;
       



    }
    

  }
  if (noData) {
      index = 6;
  }
    else if (hasCritical) {
      index = 3;
  } else if(hasNotCriticalError){
      index = 2;
  } else {
      index =1;
  }
  var dv = count;
  

  //index = Math.min(index, numStyles);
  return {
    text: count,
    index: index
  };
};










// Запуск звука ошибки
function soundErrorRun(){
    audio.load();
    audio.play();

}
// Остановка ошибки
function suondErrorStop(){
    audio.pause();
}




//        Методы для работы с картой
function initMap(){



    var testOp = {
        zoom: 9,
        center: {lat: 48.464717, lng: 35.046183}
    };


    var block = document.getElementById("map");
    var centerLatLng = new google.maps.LatLng('48.4647,35.0461');

    map = new google.maps.Map(block, testOp);




    var b_width = document.documentElement.clientWidth;
    var b_height = document.documentElement.clientHeight - 90;
    block.style.width = b_width + "px"; // Устанавливаем новую ширину блока
    block.style.height = b_height + "px"; // Устанавливаем новую высоту блока



}


function addMarkerWithTimeout( baseWith,  timeout) {
    // console.log("Добавление маркера по объекту " + baseWith.name);

    var icon = {};
    icon.labelOrigin = new google.maps.Point(21, 21);
    icon.size = new google.maps.Size(42, 72);

    switch (baseWith.type) {
        case 'red' :

            icon.url = './pages/img/red.png';
            icon.error = "critical";

            break;
        case 'green':
            icon.url = './pages/img/green.png';
             icon.error = "no";
            break;
        case 'yelow':
            icon.url = './pages/img/yelow.png';
             icon.error = "not critical";
            break;
        case 'dark_blue':
            icon.url = './pages/img/dark_blue.png';
             icon.error = "no data";
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
            draggable:false

        });

        map.panTo(baseWith.location);



        var Message = document.createElement('div');



        var textMess = document.createElement('h4');
        textMess.id = "firstHeading";
        textMess.class = 'firstHeading';
        textMess.textContent = baseWith.name;
        Message.appendChild(textMess);

        if (baseWith.errors.length == 0) {
            var textMess = document.createElement('div');
            textMess.textContent = 'Объект работает нормально, аварий нет.';
            Message.appendChild(textMess);
        } else {

            soundErrorRun();
            var textMess = document.createElement('b');
            textMess.textContent = 'Текущие аварии:';
            Message.appendChild(textMess);

            for (var i = 0; i < baseWith.errors.length; i++) {
                var num = i +1;
                var textMess = document.createElement('div');
                textMess.textContent = num + ') ' + baseWith.errors[i];
                Message.appendChild(textMess);
            }

        }






        var textBr = document.createElement('br');
//                textBr.innerText = '<br>';
        Message.appendChild(textBr);
        var buttonDiv = document.createElement('div');
        buttonDiv.id =  'button_center';

        var buttonOk = document.createElement('button');
        buttonOk.textContent = 'Просмотреть все данные';
//                buttonOk.setAttribute('style','right: 45%');
//                buttonOk.id = 'button_center';
        buttonOk.className = "mdl-button mdl-js-button mdl-js-ripple-effect";

        buttonOk.addEventListener('click', function() {
            window.open("view?base_Id="+baseWith.ID );
        });


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



//      Метод получения данных с сервера и отображения на карте
function getDataFronServer(){



    $.ajax( "../term/getset", {
//            $.ajax( "http://localhost:5555/term/getset", {

        beforeSend: function (xhr) {
            xhr.setRequestHeader('json', 'true');
            xhr.setRequestHeader('type', 'baseid_whith_set_data');
        },

        cache: true,
        type: 'POST',
        data: {},
        contentType: 'application/x-www-form-urlencoded',
        dataType: "json",
        success: success,
        error: error

    } );


    function success( BaseID_Data ) {


      

        var dataBaseId = BaseID_Data.BaseID_Data;
        var baseIdArray;
        baseIdArray = [];
          var currTime = new Date().getTime();

        for (var i = 0; i < dataBaseId.length; i++) {
           if (($.inArray(dataBaseId[i].baseid.BaseID, baseList))>=0 || userRole == "ADMIN" || userRole == "DISPATCHER") {
               if (dataBaseId[i].baseid.status){

                   var baseWith = {};
                   baseWith.name = dataBaseId[i].baseid.name;
                   baseWith.location = dataBaseId[i].baseid.location;
                   baseWith.ID = dataBaseId[i].baseid.BaseID;
                   var errorsCount = 0;
                   var errors = [];
                   var errorNoSignal = false;
                   baseWith.criticalError = false;

                   var lastData = new Date(dataBaseId[i].data.time).getTime();
                   if ((currTime - lastData) > 901000) {
                       errors.push("Не передаются данные");
                       errorNoSignal = true;
                       errorsCount++;
                   }


                   for (var j = 0; j < dataBaseId[i].baseid.sensors.length; j++) {
                       var sensor = dataBaseId[i].baseid.sensors[j];
                       var num = sensor.sensorId;
                       if (sensor.used) {
                           if (sensor.type == 'tm') {

                               var temp = dataBaseId[i].data['term' + num];

                               if (sensor.min > temp) {


                                   errorsCount++;
                                   errors.push('Температура датчика "' + sensor.name + '" меньше чем ' + sensor.min + '°С.');
                                   if (sensor.criticalError) baseWith.criticalError = sensor.criticalError;

                               } else if (sensor.max < temp) {
                                   errorsCount++;
                                   errors.push('Температура датчика "' + sensor.name + '" больше чем ' + sensor.max + '°С.');
                                   if (sensor.criticalError) baseWith.criticalError = sensor.criticalError;
                               }


                           } else if (sensor.type == 'dt') {
                               var signal = dataBaseId[i].data['signal' + num];
                               if (signal == sensor.max) {

                                   errorsCount++;
                                   errors.push(sensor.name);
                                   if (sensor.criticalError) baseWith.criticalError = sensor.criticalError;

                               }


                           }
                       }

                   }


                   var location = {};
                   var split_loc = baseWith.location.split(',');
                   location.lat = parseFloat(split_loc[0]);
                   location.lng = parseFloat(split_loc[1]);
                   if (isNaN(location.lat) || isNaN(location.lng)) {
                       continue;
                   }
    //                        new google.maps.LatLng(baseWith.location);
                   baseWith.location = location;
                   baseWith.errorsCount = errorsCount;
                   baseWith.errors = errors;

                   var type;
                   var needAdd;
                   if (errorsCount > 0 || errorNoSignal) {
                       if (errorsCount > 9) {

                           baseWith.errorsCount = 'A';
                           baseWith.name += '. Аварий: ' + errorsCount;
                       }

                       type = 'yelow';

                       if (baseWith.criticalError) {
                           type = 'red';
                       }

                       if (errorNoSignal) {
                           baseWith.errorsCount = 'E';
                           type = 'dark_blue';
                       }

                       needAdd = true;
                   }
                   else {
                       type = 'green';
                       if (showAll) {
                           needAdd = true;
                       } else {
                           needAdd = false;
                       }
                   }


                   baseWith.type = type;


                   if (needAdd) {
                       baseIdArray.push(baseWith);


                       if (dataBaseIdOld.length != 0) {


                           var nayden = false;

                           for (var jj = 0; jj < dataBaseIdOld.length; jj++) {

                               //                            console.log('Поиск имени: ' + baseWith.name);
                               if (baseWith.name === dataBaseIdOld[jj].name) {

                                   nayden = true;
                                   // console.log('Нашли имя: ' + baseWith.name);
                                   if (baseWith.errors.toString() != dataBaseIdOld[jj].errors.toString()) {
                                       //                                if (baseWith.errorsCount != dataBaseIdOld[jj].errorsCount) {
                                       nayden = false;

                                   }

                               } else {

                                   //                                console.log('нет записей об ошибках');

                               }
                           }

                           if (!nayden) {

                               addMarkerWithTimeout(baseWith, 100);
                           }
                       } else {
                           addMarkerWithTimeout(baseWith, 100);
                       }
                   }
                 }
          }
        }

        dataBaseIdOld = [];
        for (var i = 0; i < baseIdArray.length; i++) {
            var ob = {};
            var current = baseIdArray[i];
            for (var key in current) {
                ob[key] = current[key];
            }
            dataBaseIdOld.push(ob);
        }

//                console.log(baseIdArray);

    }


 markers.sort();

        if ( typeof markerCluster !== "undefined" ){

            markerCluster.clearMarkers();
            markerCluster.repaint();

            } 

 markerCluster = new MarkerClusterer(map, markers);

 markerCluster.setCalculator(myClusterCalc);
 markerCluster.setMinClusterSize(2);





}

function error() {
}



function clearMarker(marker) {
    
   
    for (var i = 0; i < markers.length; i++) {
        var localMarker = markers[i];
//                console.log(localMarker.position.toString());
//                console.log(marker.position.toString());

 if ( typeof localMarker !== "undefined" ){

        if ( localMarker.position.toString() ===  marker.position.toString() && localMarker.title === marker.title) {
             console.log("Удаляем: " + marker.title.toString());
             delete markers[i];
           
            localMarker.setMap(null);
          

        }
    }
}

   
}

function showAllChange(){
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

    getDataFronServer();

    dataBaseIdOld = [];


}






function onLoad(){
    initMap();
    getDataFronServer();
    setInterval("getDataFronServer()",15000);
}
