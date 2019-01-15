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
        body {
            background: #333333;
        }
        textarea{
            height: 300px;
        }
        #leftMap p {
            font-size: 14px;
            margin: 5px;
        }
        #leftMap h3 {
            text-align: center;
            margin: 0;
            background: #3f7ebe;
            border-radius: 0 0 20px 20px;
        }
        #leftMap img{
            height: 50px;
            width: 100px;
            /*margin: 0 auto;*/
            padding: 0 0 0 20px;
        }

    </style>



    <!--http://esri.github.io/esri-leaflet/examples/geocoding-control.html-->


    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%--<link rel="shortcut icon" type="image/lng-icon" href="favicon-32x32.png" />--%>


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

    <title>Робоча Карта Львівської області</title>
</head>
<body>
<div class="informationAboutUser">
    <div style="color: white">
        <t:authorize access="isAuthenticated()">
            Ваш логін: <span class="username"><t:authentication property="principal.username"/></span>
        </t:authorize>
    </div>
    <div style="margin: 5px 50%">
        <t:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
            <a href="/logout" class="exit" style="text-decoration: none">Вийти</a>
        </t:authorize>
    </div>
</div>
<h1>Робоча карта Львівської області</h1>

<div id='jqxMenu' style='visibility: hidden;'>
    <ul class="nav">
        <li><a href="/">Перегляд</a></li>
        <li><a href="/user">Редагування гідрантів</a></li>
        <li id="openLeftMapObjects">Показати перелік об'єктів</li>
    </ul>
</div>


<div class="parent">
    <div id="leftMap" style="display: none; position: relative">
        <div id="leftMapTitle">
            <p>Перелік об'єктів:</p>
            <button id="closeLeftMap"></button>
        </div>
        <div id="leftMapMenu">
            <h3>Типи об'єктів:</h3>
            <p>1 - Аеродромний автомобіль</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/a.svg" alt="Аеродромний автомобіль">
            <p>2 - АЦ40</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/ac40.svg" alt="">
            <p>3 - Автодрабина</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/ad.svg" alt="">
            <p>4 - АПД</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/apd.svg" alt="">
            <p>5 - Насосно-рукавний</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/anr.svg" alt="">
            <p>6 - Пожежний автомобіль (загальне позначення)</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/pozh.svg" alt="">
            <p>7 - Пожежна машина на гусеничному ходу</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/avtgushod.svg" alt="">
            <p>8 - Пожежна автолабораторія</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/avtolab.svg" alt="">
            <p>9 - Пожежний автонасос</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/avtonas.svg" alt="">
            <p>10 - Автомобіль пінного гасіння</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/avtpingas.svg" alt="">
            <p>11 - Автомобіль порошкового гасіння 1</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/avtporgas.svg" alt="">
            <p>12 - Автомобіль порошкового гасіння</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/avtporgas1.svg" alt="">
            <p>13 - Автомобіль вуглекислотного гасіння</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/avtvuglgas.svg" alt="">
            <p>14 - Пожежний автомобіль газоводяного гасіння</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/g.svg" alt="">
            <p>15 - Пожежний автомобіль газодимозахисту</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/gdz.svg" alt="">
            <p>16 - ПАСГ 2 - пожежний автомобіль зі стаціонарною гребінкою</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/pasg2.svg" alt="">
            <p>17 - ПАТ -  пожежний авто підіймач телескопічний</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/pat.svg" alt="">
            <p>18 - ПКП - пожежний авто підіймач колінчастий</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/pkp.svg" alt="">
            <p>19 - Пожежна автонасосна станція</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/pns.svg" alt="">
            <p>20 - Рукавний пожежний автомобіль</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/r_new.svg" alt="">
            <p>21 - Пожежний штабний автомобіль</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/shtab.svg" alt="">
            <p>22 - Пожежний автомобіль технічної служби</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/t.svg" alt="">
            <p>23 - Пожежний водозахисний автомобіль</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/vz.svg" alt="">
            <p>24 - Пожежний автомобіль зв'язку та освітлення</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/zo.svg" alt="">
            <p>25 - ШТАБ</p>
                <img src="http://10.114.10.48:8080/kartagps/images/dsns/asu/dprch2018.svg" alt="">
        </div>
    </div>
    <%--<input type="hidden" name="id" id="idGidr">--%>
    <div id="map" style="width: 100%; border: none"></div>
    <div id="rightMap" style="display: none">
        <div class="latLng">
            <button id="getLatLon" disabled>Вказати нові координати</button>
            <button id="closeRightMap"><%--X--%></button>
        </div>
        <div id="rightMapMenu">
            <form action="/editFireTehn" method="post" id="formEditFiteTehn">
            <%--<form onsubmit="editFireTehn(event)" id="formEditFiteTehn">--%>
                <label for="nazva">Назва об'єкта: </label><input type="text" name="nazva" id="nazva" placeholder="Введіть назву..." required maxlength="140">
                <label for="info">Інформація: </label><input type="textarea" name="info" id="info" placeholder="info..." required maxlength="290">
                <label for="type">Тип: </label><input type="number" name="type" id="type" placeholder="type..." required min="1" max="25">
                <label for="lng">Довгота X</label><input type="text" name="lng" value="" id="lng" placeholder="Широта Х..." disabled <%--required--%>>
                <label for="lat">Довгота Y</label><input type="text" name="lat" value="" id="lat" placeholder="Довгота Y..." disabled<%--required--%>>
                <%--<label for="typ">Тип</label><input type="text" name="typ" id="typ" placeholder="Тип гідранта..." required maxlength="1">
                <label for="diametr">Діаметр</label><input type="text" name="diametr" id="diametr" placeholder="Діаметр гідранта..." required maxlength="3">
                <label for="spravnyi">Справність</label><input type="number" name="spravnyi" id="spravnyi" placeholder="Справність..." min="0" max="1" required>
                <label for="vkazivnyk">Вкзівник</label><input type="number" name="vkazivnyk" id="vkazivnyk" placeholder="Вкзівник..." min="0" max="1" required>--%>
                <input type="hidden" name="id" id="idFireTehn">
                <input type="submit" class="edit" value="ЗМІНИТИ">
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </form>
        </div>
    </div>
    <script>
        function editFireTehn(event) {
            console.log('submit', event.target);
            event.preventDefault();

        }
    </script>
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



<script src="js/userMapWork/var.js"></script>
<script src="js/userMapWork/mapserver.js"></script>
<script src="js/userMapWork/map.js"></script>

<%--<script src="js/myJS/welcome.js"></script>--%>

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

    $("#openLeftMapObjects").click(function () {


        $("#leftMap").show();


    })



</script>
</body>
</html>