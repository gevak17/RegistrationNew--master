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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


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
    <link rel="stylesheet" href="css/welcome.css" />

    <title>Карта ГУ ДСНС у Львівській області</title>

</head>
<body>

<div class="body1">
    <h1> Карта ГУ ДСНС у Львівській області </h1>
<%@include file="menu/menuMain.jsp"%>
<h2 style="text-align: center">Ця сторінка доступна лише для перегляду</h2>

    <t:authorize access="!hasAnyRole('ROLE_USER','ROLE_ADMIN')">
        <h2 style="text-align: center">Увійдіть для можливості редагування гідрантів</h2>
    </t:authorize>

        <div id='map'></div>

    <script src="js/view/var.js"></script>
    <script src="js/view/mapserver.js"></script>
    <script src="js/view/map.js"></script>

    <%--<%@include file="head/footer.jsp"%>--%>
</div>
</body>
</html>