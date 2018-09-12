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
    <style>
        body {
            margin: 0;

        }
        .body1{
            margin: 0 auto;
            overflow: hidden;
            background: url(https://image.ibb.co/cqFY0S/bg.jpg);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            height: 955px;

        }
        h1 {
            font-family: 'Noto Serif', serif;
            text-align: center;
            color: #fff;
            font-size: 44px;
            margin: 0;
        }
        h2{
            font-family: 'Noto Serif', serif;
            /*text-align: center;*/
            color: #fff;
        }
        h3{
            font-family: 'Noto Serif', serif;
            text-align: center;
            color: #786b59;
            margin: 5px;
            background: lightgrey;
            /*font-size: 52px;*/
        }
        .nav{
            margin: 10px auto 10px;
            display: flex;
            justify-content: space-around;;
            max-width: 800px;
        }
        .nav li{
            text-decoration: none;
            background-color: rgb(221, 213, 213);
            padding: 10px 16px ;
            list-style-type: none;
            border-radius: 6px;
        }

        .nav li:hover {
            background: #f19a20;
        }

        a{
            font-family: 'Noto Serif', serif;
            font-weight: 700;
            font-size: 18px;
            color: rgb(3, 7, 70);
            text-decoration: none;
        }

        #map {

            display: flex;
            width: 85%;
            height: 600px;
            margin: auto;
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

    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>

    <title>Карта ГУ ДСНС у Львівській області</title>

</head>
<body>


<div class="body1">
    <h1> Карта ГУ ДСНС у Львівській області </h1>
<%@include file="menu/menuMain.jsp"%>
<h2 style="text-align: center">Ця сторінка доступна лише для перегляду</h2>
    <h2 style="text-align: center">Увійдіть для можливості редагування гідрантів</h2>
    <div id='map'></div>
        <br>
        <br>
    <script src="js/view/var.js"></script>
    <script src="js/view/mapserver.js"></script>
    <script src="js/view/map.js"></script>

    <%@include file="head/footer.jsp"%>


