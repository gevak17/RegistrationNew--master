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

var mbAttr = 'Карта Львівської області &copy;',
    mbUrl =
        'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw';

var grayscale = L.tileLayer(mbUrl, { id : 'mapbox.light', attribution : mbAttr }),
    streets = L.tileLayer(mbUrl, { id : 'mapbox.streets', attribution : mbAttr }),
    osmLayer = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
          attribution: mbAttr
        }),
    comic = L.tileLayer(mbUrl, { id : 'mapbox.comic', attribution : mbAttr }),
    outdoors = L.tileLayer(mbUrl, { id : 'mapbox.outdoors', attribution : mbAttr }),
    high_contrast = L.tileLayer(mbUrl, { id : 'mapbox.high-contrast', attribution : mbAttr }),
    wheatpaste = L.tileLayer(mbUrl, { id : 'mapbox.wheatpaste', attribution : mbAttr }),
    pencil = L.tileLayer(mbUrl, { id : 'mapbox.pencil', attribution : mbAttr }),
    emerald = L.tileLayer(mbUrl, { id : 'mapbox.emerald', attribution : mbAttr }),
    streetsSatellite = L.tileLayer(mbUrl, { id : 'mapbox.streets-satellite', attribution : mbAttr });

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


var map = L.map('map', { 
    center : [ y, x ], 
    zoom : curParam, 
    zoomDelta: 0.5,
    zoomSnap: 0,
    minZoom :7,
    //zoomAnimation:false,
//    maxZoom :20,
//    measurecontrol:true,
    layers : [ osmLayer ] });
 
