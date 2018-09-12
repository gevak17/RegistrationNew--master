/*var mbAttr = 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
    '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
    'Imagery © <a href="http://mapbox.com">Mapbox</a>',
    mbUrl =
        'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw';

var grayscale = L.tileLayer(mbUrl, { id : 'mapbox.light', attribution : mbAttr }),
    streets = L.tileLayer(mbUrl, { id : 'mapbox.streets', attribution : mbAttr }),
    osmLayer = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
          attribution: '&copy; ' +
            '<a href="http://osm.org/copyright">OSM</a> contributors'
        }),
    comic = L.tileLayer(mbUrl, { id : 'mapbox.comic', attribution : mbAttr }),
    outdoors = L.tileLayer(mbUrl, { id : 'mapbox.outdoors', attribution : mbAttr }),
    high_contrast = L.tileLayer(mbUrl, { id : 'mapbox.high-contrast', attribution : mbAttr }),
    wheatpaste = L.tileLayer(mbUrl, { id : 'mapbox.wheatpaste', attribution : mbAttr }),
    pencil = L.tileLayer(mbUrl, { id : 'mapbox.pencil', attribution : mbAttr }),
    emerald = L.tileLayer(mbUrl, { id : 'mapbox.emerald', attribution : mbAttr }),
    streetsSatellite = L.tileLayer(mbUrl, { id : 'mapbox.streets-satellite', attribution : mbAttr });
/**/
/*
var deferred_google_layers = {
		roadmap: { name: "roadmap", js: ["https://maps.googleapis.com/maps/api/js?callback=L.Google.asyncInitialize&key=AIzaSyCs67B6VGVWsRRLR-yAqCIxv17ftVfYl-0"], init: function() {return new L.Google("ROADMAP", {detectRetina: true, edgeBufferTiles: 2}); }},
		roadmap: { name: "roadmap", js: ["https://maps.googleapis.com/maps/api/js?callback=L.Google.asyncInitialize&key=AIzaSyCs67B6VGVWsRRLR-yAqCIxv17ftVfYl-0"], init: function() {return new L.Google("ROADMAP", {detectRetina: true, edgeBufferTiles: 2}); }},
		satellite: { name: "satellite", js: ["https://maps.googleapis.com/maps/api/js?callback=L.Google.asyncInitialize&key=AIzaSyCs67B6VGVWsRRLR-yAqCIxv17ftVfYl-0"], init: function() {return new L.Google("SATELLITE", {detectRetina: true, edgeBufferTiles: 2}); }},
		hybrid: { name: "hybrid", js: ["https://maps.googleapis.com/maps/api/js?callback=L.Google.asyncInitialize&key=AIzaSyCs67B6VGVWsRRLR-yAqCIxv17ftVfYl-0"], init: function() {return new L.Google("HYBRID", {detectRetina: true, edgeBufferTiles: 2}); }},
		terrain: { name: "terrain", js: ["https://maps.googleapis.com/maps/api/js?callback=L.Google.asyncInitialize&key=AIzaSyCs67B6VGVWsRRLR-yAqCIxv17ftVfYl-0"], init: function() {return new L.Google("TERRAIN", {detectRetina: true, edgeBufferTiles: 2}); }}
	};
    /**/
//var googleLayer_roadmap = new L.Google('ROADMAP');
//var googleLayer_satellite = new L.DeferredLayer(deferred_google_layers.satellite);
//var googleLayer_hybrid = new L.DeferredLayer(deferred_google_layers.hybrid);
//var googleLayer_terrain = new L.DeferredLayer(deferred_google_layers.terrain);
/*
var curParam;
var x;
x = $.url().param('x');
if(!x){
   x =  24.02;
}
var y;
y = $.url().param('y');
if(!y){
   y = 49.8423;
}
curParam = $.url().param('zoom');
if(!curParam){
    curParam = 18;
}


var map = L.map('map', {
    center : [ y, x ],
    zoom : curParam,
    zoomDelta: 0.5,
    zoomSnap: 0,
    minZoom :7,
//    maxZoom :20,
//    measurecontrol:true,
    layers : [ osmLayer ] });
/**/


   L.control.scale().addTo(map);
   L.control.polylineMeasure({position:'topleft', imperial:false, clearMeasurementsOnStop: true, showMeasurementsClearControl: true}).addTo(map);

var baseLayers = {
    "OSM" : osmLayer,
    "Вулиці" : streets,

//    "googleLayer_roadmap": googleLayer_roadmap,

    "comic" : comic,
    "outdoors" : outdoors,
    "high-contrast" : high_contrast,
    "wheatpaste" : wheatpaste,
    "pencil" : pencil,
    "emerald" : emerald,
    "Сателіт" : streetsSatellite,
    "Grayscale" : grayscale
};

// var tms_ne =
// L.tileLayer('http://10.114.10.48:8080/geoserver/gwc/service/tms/1.0.0/Karta:zona_torf@EPSG:4326@png/{z}/{x}/{y}.png',
// {
//    tms: true
//});

// Tile mode (Uses L.WMS.TileLayer)
var rootUrl = 'http://10.114.10.48:8080/geoserver/wms';
// var rootUrl = 'http://'+location.host+'/geoserver/wms';
var rootImageUrl = 'http://10.114.10.48:8080/kartagps/images/dsns';
// var rootImageUrl = 'http://'+location.host+'/kartagps/images/dsns';
var torfSrc = L.WMS.source(
    rootUrl, { transparent : true, format : 'image/png', feature_count : 50, tiled : true, info_format : 'text/html' });
torfSrc.setOpacity(0.5);
var toLayer = torfSrc.getLayer("zona_torf");

var sourceInfo = L.WMS.Source.extend({
    'showFeatureInfo': function(latlng, info) {
        if (!this._map) {
            return;
        }
        // do whatever you like with info
        //console.log(info)        
        var el = document.createElement( 'html' );
        el.innerHTML = info;
        if(el.getElementsByTagName("body")[0].innerText.trim().length){
            this._map.openPopup(info, latlng);

            // this._map.close();//!!!!!!!!!!!!!!!!!

        }
//        console.log(el.getElementsByTagName("body")[0].innerText.trim().length); // Live NodeList of your anchor elements
        
    }
});
var srcNoTiledInfo = new sourceInfo(
        rootUrl, { transparent : true, format : 'image/png', feature_count : 50, srsName : 'EPSG:4326', srs : 'EPSG:4326', info_format : 'text/html'  });
// var rayon_stat =  L.tileLayer.betterWms(rootUrl, {
//        layers: 'rayon_stat',
//        transparent: true,
//        format: 'image/png'
//      });
// var gidrant = L.tileLayer.betterWms(rootUrl, {
//        layers: 'gidrant',
//        transparent: true,
//        format: 'image/png'
//      });
var rayon_stat_view = torfSrc.getLayer("rayon_stat_view");
var rayon_stat = torfSrc.getLayer("rayon_stat");
var gidrant = srcNoTiledInfo.getLayer("gidrant_hevak");
gidrant.addTo(map);

var vodopost = srcNoTiledInfo.getLayer("vodopost");
vodopost.addTo(map);

var tpv = torfSrc.getLayer("tpv");
var boundary= torfSrc.getLayer("boundary-polygon");

/*
//------------------------markerClusterGroup-----------------------------------
// var markers = L.markerClusterGroup({ disableClusteringAtZoom : 17 });
var tehnica = L.markerClusterGroup();

var defaultParameters = {
    service : 'WFS',
    version : '1.0.0',
    request : 'GetFeature',
    maxFeatures : 3000,
    // outputFormat : 'text/javascript',
    format_options : 'callback: getJson',
    srsName : 'EPSG:4326'
};

// console.log(rootUrl + L.Util.getParamString(parameters));
$.ajax({
    jsonp : false,
    url : rootUrl +
        L.Util.getParamString(L.Util.extend({
            service : 'WFS',
            version : '1.0.0',
            request : 'GetFeature',
            maxFeatures : 3000,
            outputFormat : 'text/javascript',
            format_options : 'callback: getJson',
            typeName : 'Karta:tehnica_view',
            srsName : 'EPSG:4326'
        })),
    dataType : 'jsonp',
    jsonpCallback : 'getJson',
    success : handleJson
});

// var group = new L.featureGroup().addTo(map);
// var geojsonlayer;
function handleJson(data)
{
    //    console.log(data);
    //    geojsonlayer = L.geoJson(data, {

    L.geoJson(data, {
         onEachFeature : function(feature, my_Layer) {
             //						my_Layer.bindPopup("str.1: "+feature.properties.name+"<br />cat:
             //"+feature.properties.cat);
             my_Layer.bindPopup("Назва: " + feature.properties.name + "<br />" + feature.properties.name);
             if(feature.properties.name) {
                 my_Layer.bindTooltip(
                     feature.properties.name, { permanent : true, className : "my-label", offset : [ 0, 0 ] });
             }
         },
         pointToLayer : function(feature, latlng) {
             // return L.circleMarker(latlng, geojsonMarkerOptions);
             /!*return L.circleMarker(latlng ,{
                     radius: 30,
//                                    fillColor: "#ff7800",
//                                    color: "#000",
//                                    weight: 1,
                     opacity: 1,
                     fillOpacity: 0.8,
                 });*!/
             var greenIcon = L.icon({
//        iconUrl : rootImageUrl + '/arch/a1.svg',
                iconUrl :rootImageUrl + '/'+feature.properties.pict_file,
                //        shadowUrl: rootImageUrl+'/arch/a1.svg',
                iconSize : [ 60, 60 ], // size of the icon
//                iconSize : [ feature.properties.w, feature.properties.h ], // size of the icon
                                        //        shadowSize:   [50, 64], // size of the shadow
                //        iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
                //        shadowAnchor: [4, 62],  // the same for the shadow
                popupAnchor : [ -3, -6 ] // point from which the popup should open relative to the iconAnchor
            });

             return L.marker(latlng, { icon : greenIcon });
             // return L.marker(latlng);
         }
     }).addTo(tehnica);
}
function getJson(data)
{
    //    console.log("callback function fired");
}


var gidrantcluster = L.markerClusterGroup();

// console.log(rootUrl + L.Util.getParamString(parameters));
$.ajax({
    jsonp : false,
    url : rootUrl + L.Util.getParamString(L.Util.extend({
            service : 'WFS',
            version : '1.0.0',
            request : 'GetFeature',
            maxFeatures : 10000,
            // outputFormat : 'text/javascript',
            format_options : 'callback: getJsonGidrant',
            typeName : 'Karta:gidrant',
            srsName : 'EPSG:4326'
        })),
    dataType : 'jsonp',
    jsonpCallback : 'getJsonGidrant',
    success : handleJsonGidrant
});

// var group = new L.featureGroup().addTo(map);
// var geojsonlayer;
function handleJsonGidrant(data)
{
    //    console.log(data);
    //    geojsonlayer = L.geoJson(data, {
    var greenIcon = L.icon({
        iconUrl : rootImageUrl + '/gidr01.svg',
        //        shadowUrl: rootImageUrl+'/arch/a1.svg',
        iconSize : [ 30, 20 ], // size of the icon
                                //        shadowSize:   [50, 64], // size of the shadow
        //        iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
        //        shadowAnchor: [4, 62],  // the same for the shadow
        popupAnchor : [ -3, -6 ] // point from which the popup should open relative to the iconAnchor
    });
    L.geoJson(data, {
         onEachFeature : function(feature, my_Layer) {
             //						my_Layer.bindPopup("str.1: "+feature.properties.name+"<br />cat:
             //"+feature.properties.cat);
             my_Layer.bindPopup("Назва: " + feature.properties.street_txt + " " + feature.properties.bud);
             if(feature.properties.name) {
                 my_Layer.bindTooltip(
                     feature.properties.name, { permanent : true, className : "my-label", offset : [ 0, 0 ] });
             }
         },
         pointToLayer : function(feature, latlng) {
             // return L.circleMarker(latlng, geojsonMarkerOptions);
             /!*return L.circleMarker(latlng ,{
                     radius: 30,
//                                    fillColor: "#ff7800",
//                                    color: "#000",
//                                    weight: 1,
                     opacity: 1,
                     fillOpacity: 0.8,
                 });*!/
             return L.marker(latlng, { icon : greenIcon });
             // return L.marker(latlng);
         }
     }).addTo(gidrantcluster);
}
function getJsonGidrant(data)
{
        console.log("callback function fired");
}

//------------------------markerClusterGroup-----------------------------------*/

var overlays = {
    /*"Оперативні плани пожежогасіння" : torfSrc.getLayer("plan03"),
    //    "Гідранти" : torfSrc.getLayer("gidrant"),
    "Межі районів" : 	boundary,*/
    "Гідранти" : gidrant,
	// "Кластер гідрантів" : gidrantcluster,
	/*"Інше протипожежне водопостачання" : vodopost,
	"Торфполя" : torfSrc.getLayer("zona_torf"),
    "Хімічно-небезпечні об'єкти" : torfSrc.getLayer("cz_hno"),
    "ПРУ" : torfSrc.getLayer("cz_pru"),
    "Захисні споруди" : torfSrc.getLayer("cz_zahysni_sporudy"),
    "Підвали" : torfSrc.getLayer("cz_pidval"),
    "Переміщення АТО" : torfSrc.getLayer("cz_pereselennya_ato_v"),
    "Переміщення Крим" : torfSrc.getLayer("cz_pereselennya_krym_v"),
    "Торфополя" : torfSrc.getLayer("zona_torf"),
    "Координати підрозділів" : torfSrc.getLayer("dprch"),
	//    "Підтоплення" : torfSrc.getLayer("pavodok"),
    "Можливе підтоплення" : torfSrc.getLayer("mogl_pavodok"),
    "Підтоплення" : torfSrc.getLayer("pavodok_view"),
    //	"Інформація по затопленнях" : torfSrc.getLayer("rayon_stat"),
    "Інформація по затопленнях" : rayon_stat,
    "Затоплені райони" : rayon_stat_view,
    // "Розташування техніки" : tehnica,
	"ТПВ": tpv,*/
	"Межі виїзду підрозділів ТЕСТ": torfSrc.getLayer("mezhi_vyizdu_dprch")

};


var lastDate = 5;
var table = document.createElement('table');
table.innerHTML = '<tbody><tr>';
for (i = 1; i < lastDate; i++) {
    table.innerHTML += '<td>222</td>';
}
table.innerHTML += '</tr></tbody>';
/**/


//--------------------------Geocoding------------------------------------------
// var searchControl = L.esri.Geocoding.geosearch().addTo(map);
var nomi = new L.Control.Geocoder.Nominatim();

var geocoder = L.Control.geocoder({ defaultMarkGeocode : false, geocoder : nomi });

geocoder.on('markgeocode', function(e) {
            var bbox = e.geocode.bbox;
            var poly =
                L.polygon([ bbox.getSouthEast(), bbox.getNorthEast(), bbox.getNorthWest(), bbox.getSouthWest() ]);
            //.addTo(map);/**/
            map.fitBounds(poly.getBounds());
        }).addTo(map);

// var markers = L.markerClusterGroup();
// markers.addLayer(torfSrc.getLayer("tehnica"));
// markers.on('clusterclick', function (a) { alert('Cluster Clicked'); });
// markers.on('click', function (a) { alert('Marker Clicked'); });
// map.addLayer(markers);

//--------------------------Geocoding------------------------------------------

// if(src.startsWith("JavaScript", Qt::CaseInsensitive)){
//        ui->webView->page()->mainFrame()->evaluateJavaScript(src);
//    }else if(src.startsWith("saveImage#", Qt::CaseInsensitive)){
//        saveWebImage(src.mid(10));
//    }
// 1251
// saveImage#1.bmp
// javascript:codeAddress('Львів')
// javascript:codeAddress('6,підвальна,Львів')
// javascript:codeAddress('дпрч-31')
// javascript:codeAddress('Стрий')
function codeAddress(address)
{
    nomi.geocode(address, function(results) {
        var r = results[0];
        if(r) {
            var bbox = r.bbox;
            var poly =
                L.polygon([ bbox.getSouthEast(), bbox.getNorthEast(), bbox.getNorthWest(), bbox.getSouthWest() ]);
            //.addTo(map);/**/
            map.fitBounds(poly.getBounds());
        }

    });
}

L.control.layers(baseLayers, overlays).addTo(map);

//-------------------route-------------------------------------------------
var ReversablePlan = L.Routing.Plan.extend({
    createGeocoders : function() {
        // var container = L.Routing.Plan.prototype.createGeocoders.call(this),
        //   reverseButton = createButton('↑↓', container);
        var container = L.Routing.Plan.prototype.createGeocoders.call(this);
        return container;
    }
});

var plan = new ReversablePlan([], { geocoder : new L.Control.Geocoder.Nominatim(), routeWhileDragging : true });

var control = L.Routing.control({
    routeWhileDragging : true,
    collapsible : true,
    router: L.Routing.mapbox('pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw'),
    plan : plan
});
control.addTo(map);
control.hide();

function createButton(label, container)
{
    var btn = L.DomUtil.create('button', '', container);
    btn.setAttribute('type', 'button');
    btn.innerHTML = label;
    return btn;
}
/*
map.on('click', function(e) {
    var container = L.DomUtil.create('div'),
        startBtn = createButton('Start from this location', container),
        destBtn = createButton('Go to this location', container);

    L.popup()
        .setContent(container)
        .setLatLng(e.latlng)
        .openOn(map);
        L.DomEvent.on(startBtn, 'click', function() {
        control.spliceWaypoints(0, 1, e.latlng);
        map.closePopup();
    });
        L.DomEvent.on(destBtn, 'click', function() {
        control.spliceWaypoints(control.getWaypoints().length - 1, 1, e.latlng);
        map.closePopup();
    });
});
 /**/
//-------------------route-------------------------------------------------

function onLocationFound(e)
{
    var radius = e.accuracy / 2;

    L.marker(e.latlng).addTo(map).bindPopup("You are within " + radius + " meters from this point").openPopup();

    L.circle(e.latlng, radius).addTo(map);
}

function onLocationError(e)
{
    alert(e.message);
    //                alert('!!!!!!!!!!!!!!!!!!!!!!!!');
}

map.on('locationfound', onLocationFound);
map.on('locationerror', onLocationError);

//	map.locate({setView: true, maxZoom: 18});
