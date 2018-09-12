<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="css/hover.css"/>


    <!--http://esri.github.io/esri-leaflet/examples/geocoding-control.html-->


    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%--<link rel="shortcut icon" type="image/x-icon" href="favicon-32x32.png" />--%>

    <link rel="stylesheet" href="js/leaflet/leaflet.css" />
    <link rel="stylesheet" href="js/leaflet/esri-leaflet-geocoder.css">
    <link rel="stylesheet" href="js/leaflet/leaflet-routing-machine.css" />
    <link rel="stylesheet" href="js/leaflet/Control.Geocoder.css" />
    <link rel="stylesheet" href="js/leaflet/MarkerCluster.css" />
    <link rel="stylesheet" href="js/leaflet/MarkerCluster.Default.css" />
    <link rel="stylesheet" href="js/leaflet/Leaflet.PolylineMeasure.css" />

    <script src="js/leaflet/leaflet.js"></script>
    <!-- Load Esri Leaflet from CDN -->
    <script src="js/leaflet/esri-leaflet.js"></script>
    <script src="js/leaflet/esri-leaflet-geocoder.js"></script>
    <script src="js/leaflet/leaflet.wms.js" data-main="app"></script>
    <script src="js/leaflet/routing-machine/leaflet-routing-machine.js"></script>
    <script src="js/leaflet/Control.Geocoder.js"></script>
    <script src="js/leaflet/leaflet.markercluster-src.js"></script>
    <script src="js/leaflet/Leaflet.PolylineMeasure.js"></script>
    <script src="js/leaflet/jquery-3.2.1.min.js"></script>
    <script src="js/leaflet/L.TileLayer.BetterWMS.js"></script>
    <script src="js/leaflet/purl.js"></script>

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>

<title>Карта Львівської області</title>

</head>
<body>


<div class="body1">
    <h1> Карта пожежних гідрантів </h1>
<%@include file="menu/menuEditGidr.jsp"%>


<div id="notRigths"></div>

<div class="parent">
    <div id='map'></div>

    <div class="right_map">
        <%--<p><span id="zminiti">Змінити гідрант</span></p>--%>
        <div class="latLng">
            <button id="getLatLon" disabled>Вказати нові координати</button>
        </div>
        <div id="create_map">
            <form action="/editGidrant" method="post" id="formEdit">
                Довгота X<input type="text" name="lng" value="" id="lng" placeholder="Широта Х..." required><br>
                Довгота Y<input type="text" name="lat" value="" id="lat" placeholder="Довгота Y..." required><br>
                Адресу<input type="text" name="street_txt" id="street_txt" placeholder="Введіть адресу..." required><br>
                Номер будинку<input type="text" name="bud" id="bud" placeholder="Номер будинку..." required><br>
                Зразок<input type="text" name="zrazok" id="zrazok" placeholder="Зразок гідранта..." required maxlength="1"><br>
                Тип<input type="text" name="typ" id="typ" placeholder="Тип гідранта..." required maxlength="1"><br>
                Діаметр<input type="text" name="diametr" id="diametr" placeholder="Діаметр гідранта..." required min="50" max="300"><br>
                Справність<input type="number" name="spravnyi" id="spravnyi" placeholder="Справність..." min="0" max="1" required><br>
                Вкзівник<input type="number" name="vkazivnyk" id="vkazivnyk" placeholder="Вкзівник..." min="0" max="1" required><br>
                <input type="hidden" name="id" id="idGidr">
                <input type="submit" class="edit" value="ЗМІНИТИ">
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </form>
        </div>

    </div>


    <%--<div id="saveForm">--%>
        <%--<h2>Додати новий</h2>--%>
        <%--<form action="/saveGidrant" method="post">--%>
            <%--<input type="text" id="lng1" name="lng" placeholder="lng..." required><br>--%>
            <%--<input type="text" id="lat1" name="lat" placeholder="lat..." required><br>--%>
            <%--<input type="text" name="street_txt"  placeholder="street_txt..." required><br>--%>
            <%--<input type="text" name="bud"  placeholder="bud..." required ><br>--%>
            <%--<input type="text" name="zrazok"  placeholder="zrazok..." required  size="1"><br>--%>
            <%--<input type="text" name="typ"  placeholder="typ..." required size="1"><br>--%>
            <%--<input type="text" name="diametr"  placeholder="diametr..." required><br>--%>
            <%--<input type="number" name="spravnyi"  placeholder="spravnyi..." min="0" max="1" required><br>--%>
            <%--<input type="number" name="vkazivnyk"  placeholder="vkazivnyk..." min="0" max="1" required><br>--%>
            <%--<br>--%>
            <%--<input type="submit" id="save" value="Зберегти">--%>
            <%--<input type="hidden"--%>
                   <%--name="${_csrf.parameterName}"--%>
                   <%--value="${_csrf.token}"/>--%>
        <%--</form>--%>
    <%--</div>--%>
</div>
<div class="dovidka">
    <div id="dovidka2" style="display: none">
        <h2>Для редагування параметрів гідранта необхідно зробити по ньому "Клік", після цього його дані
            запишуться у відповідні поля справа і вони будуть готові для редагування.</h2>
        <h3>Щоб змінити положення гідранта:</h3>
        <ul>
            <li>1. "НАТИСНІТЬ" на відповідний гідрант</li>
            <br>
            <li>2. Натисніть на кнопку <span class="edit">"Знайти координати"</span></li>
            <br>
            <li>3. Натисніть на поле карти, де ви хочете розмістити гідрант</li>
            <br>
            <li>4. Для ЗБЕРЕЖЕННЯ змін, натисніть на кнопку <span class="edit">"ЗМІНИТИ"</span></li>
            <br>
        </ul>
        <h3>Щоб змінити параметри гідранта:</h3>
        <ul>
            <li>1. "Клікніть" на відповідний гідрант</li>
            <br>
            <li>2. Перейдіть у відповідне поле й змініть значення (адреса, номер будинку, зразок, тип, діаметр, справність, вказівник)</li>
            <br>
            <li>3. Для ЗБЕРЕЖЕННЯ змін, натисніть на кнопку <span class="edit">"ЗМІНИТИ"</span></li>
            <br>
        </ul>
        <h3>ПРИМІТКА!<br>Поля <span class="spravnist_vkazivnik">"справність"</span> та <span class="spravnist_vkazivnik">"вказівник"</span> вказується нулем (0) і одиницею (1)<br><br>
            0 - не справний (не має)<br>
            1 - справний (є)</h3>
    </div>

</div>







<script src="js/gidr/var.js"></script>
<script src="js/gidr/mapserver.js"></script>
<script src="js/gidr/map.js"></script>



<script type="text/javascript">
    function toggle_show(id) {
        document.getElementById(id).style.display = document.getElementById(id).style.display == 'none' ? 'block' : 'none';
    }
</script>
<script type="application/javascript">


//----------------------------------------------------------------------
    $("#getLatLon").click(function(){
        getLatLon();
    });



</script>
<%@include file="head/footer.jsp"%>


