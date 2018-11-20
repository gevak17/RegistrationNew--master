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
    <style>
        .body1{
            background: #333333;
        }
    </style>



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

    <script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxwindow.js"></script>
    <script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxtabs.js"></script>
    <script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxinput.js"></script>
    <script type="text/javascript" src="js/jqx_6.1.0/scripts/demos.js"></script>


    <link rel="stylesheet" href="js/jqx_6.1.0/jqwidgets/styles/jqx.base.css" type="text/css" />
    <link rel="stylesheet" href="js/jqx_6.1.0/jqwidgets/styles/jqx.energyblue.css" type="text/css" />
    <link rel="stylesheet" href="js/jqx_6.1.0/jqwidgets/styles/jqx.orange.css" type="text/css" />

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>

<title>Карта Львівської області</title>

</head>
<body>


<div class="body1">
    <h1> Карта пожежних гідрантів </h1>
    <div id='jqxMenu' style='visibility: hidden; margin-left: 5px;'>
        <ul class="nav">
            <li><a href="/">Перегляд</a></li>
            <t:authorize access="hasRole('ROLE_ADMIN')">
                <li><a href="/admin">МЕНЕДЖЕР ПАРОЛІВ</a></li>
            </t:authorize>
            <t:authorize access="!hasAnyRole('ROLE_USER','ROLE_ADMIN')">
                <li><a href="/login">Увійти</a></li>
            </t:authorize>
            <t:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
                <li id="dovidkaButton">Довідка</li>
                <li id="pravaButton">Що я можу редагувати?</li>
                <li><a href="/logout">Вийти</a></li>
                <%--<div id="input">--%>
                <input id="findStreet" type="text" autofocus placeholder="Введіть назву вулиці:"/>
                    <%--<div id="search">--%>
                <img id="searchIcon" alt="search" src="css/icons/search.png" />
                    <%--</div>--%>
                <%--</div>--%>
            </t:authorize>
           <%-- <t:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
                &lt;%&ndash;id="dovidkaButton"&ndash;%&gt;
                <input type="button" id="dovidkaButton" value="Довідка">
                <input type="button" id="pravaButton" value="Що я можу редагувати?">
            </t:authorize>--%>

        </ul>
    </div>
<%--
    <div id='content'>

        <br/>
        <div id="input">
            &lt;%&ndash;<input type="text" placeholder="Введіть назву вулиці:"/>&ndash;%&gt;
            &lt;%&ndash;<div id="search">&ndash;%&gt;
                &lt;%&ndash;<img style="margin-top:3px;" alt="search" width="16" height="16"&ndash;%&gt;
                     &lt;%&ndash;src="https://a.academia-assets.com/images/flexible_premium_upgrade/candy/icons/search-lg@2x.png" />&ndash;%&gt;
            &lt;%&ndash;</div>&ndash;%&gt;
        </div>
    </div>--%>

<%--<div id="notRigths"></div>--%>
<div class="parent">
    <div id="leftMap" style="display: none">
        <div id="leftMapTitle">
            <button id="closeLeftMap"></button>
        </div>
        <div id="leftMapMenu">
            <span id="asd">65-24.0116258849317-49.840032723203</span><br>
        </div>
    </div>
    <div id="map" style="height: 80vh"></div>
    <div id="rightMap" style="display: none">
        <button id="closeRightMap"><%--X--%></button>
        <%--<p><span id="zminiti">Змінити гідрант</span></p>--%>
        <div class="latLng">
            <button id="getLatLon" disabled>Вказати нові координати</button>
        </div>
        <div id="rightMapMenu">
            <form action="/editGidrant" method="post" id="formEdit">
                <label for="lng">Довгота X</label><input type="text" name="lng" value="" id="lng" placeholder="Широта Х..." required>
                <label for="lat">Довгота Y</label><input type="text" name="lat" value="" id="lat" placeholder="Довгота Y..." required>
                <label for="streetTxt">Вулиця</label><input type="text" name="streetTxt" id="streetTxt" placeholder="Введіть адресу..." required>
                <label for="bud">Будинок</label><input type="text" name="bud" id="bud" placeholder="Номер будинку..." required maxlength="14">
                <label for="zrazok">Зразок</label><input type="text" name="zrazok" id="zrazok" placeholder="Зразок гідранта..." required maxlength="1">
                <label for="typ">Тип</label><input type="text" name="typ" id="typ" placeholder="Тип гідранта..." required maxlength="1">
                <label for="diametr">Діаметр</label><input type="text" name="diametr" id="diametr" placeholder="Діаметр гідранта..." required maxlength="3">
                <label for="spravnyi">Справність</label><input type="number" name="spravnyi" id="spravnyi" placeholder="Справність..." min="0" max="1" required>
                <label for="vkazivnyk">Вкзівник</label><input type="number" name="vkazivnyk" id="vkazivnyk" placeholder="Вкзівник..." min="0" max="1" required>
                <input type="hidden" name="id" id="idGidr"><br>
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
<div id="notRigths"></div>

<%--<div class="dovidka">
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

</div>--%>

    <div id='dovidkaWindow'>
        <div><span id="titleDovidka"></span></div>
        <div id="contentDovidka" style="display: none">
            <div class="dovidka">
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

            <hr>
            <input type="button" id="closeContentDovidka" value="close">
        </div>
    </div>
    <div id='pravaWindow'>
        <div><span id="titlePrava"></span></div>
        <div id="contentPrava"></div>
    </div>


<script src="js/gidr/var.js"></script>
<script src="js/gidr/mapserver.js"></script>
<script src="js/gidr/map.js"></script>

<script src="js/myJS/user.js"></script>



    <script type="application/javascript">
    function toggle_show(id) {
        document.getElementById(id).style.display = document.getElementById(id).style.display == 'none' ? 'block' : 'none';
    }

//----------------------------------------------------------------------
    $("#getLatLon").click(function(){
        getLatLon();
    });
//----------------------------------------------------------------------




</script>

<%--<script>
        function myFunction41() {
            var x41 = document.getElementById("adminrayon41");

            if (x41.style.display === "none") {
                x41.style.display = "block";
            } else {
                x41.style.display = "none";
            }
        }
        function myFunction42() {
            var x42 = document.getElementById("adminrayon42");
            if (x42.style.display === "none") {
                x42.style.display = "block";
            } else {
                x42.style.display = "none";
            }
        }
        function myFunction43() {
            var x43 = document.getElementById("adminrayon43");
            if (x43.style.display === "none") {
                x43.style.display = "block";
            } else {
                x43.style.display = "none";
            }
        }
        function myFunction44() {
            var x44 = document.getElementById("adminrayon44");
            if (x44.style.display === "none") {
                x44.style.display = "block";
            } else {
                x44.style.display = "none";
            }
        }
        function myFunction45() {
            var x45 = document.getElementById("adminrayon45");
            if (x45.style.display === "none") {
                x45.style.display = "block";
            } else {
                x45.style.display = "none";
            }
        }



</script>--%>

<%@include file="head/footer.jsp"%>


