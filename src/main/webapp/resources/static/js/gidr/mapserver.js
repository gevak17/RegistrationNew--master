/******************************************************************************************/
var crosshairs_enabled = false;
var marker;







map.on('popupopen', function (popup) {
    // console.log( popup.popup);
    var html = popup.popup.getContent();
    $("#div1").append($(html));
    $("#idGidr").val($("#fid").val().split(".")[1]);

    var findId = $("#fid").val().split(".")[1];

//////////-------------------------------------------
    console.log("!!!!!!!!!!!!!!!!!!!!!1")

    $.ajax({
        url: '/findOneGidrant-'+findId,
        type: 'GET',
        contentType: 'application/json',
        success: function (result) {
            console.log("ggggggggggggggggggg")
            if(result.id===undefined) {
                document.getElementById("lng").value= "";
                document.getElementById("lat").value= "";
                document.getElementById("street_txt").value= "";
                document.getElementById("bud").value= "";
                document.getElementById("zrazok").value= "";
                document.getElementById("diametr").value= "";
                document.getElementById("typ").value= "";
                document.getElementById("spravnyi").value= "";
                document.getElementById("vkazivnyk").value= "";
                $(".edit").css("background-color", "red");
                $("#notRigths").css("background-color", "red");
                $("#getLatLon").css("background-color", "red");

                $("#formEdit").children().attr("disabled", "disabled");//disabled all form
                document.getElementById("getLatLon").disabled = true;//disabled button get koordinates

                document.getElementById("notRigths").innerHTML = "У вас немає прав редагувати даний гідрант!!!";

            } else{
                var lng = result.lng;
                var lat = result.lat;
                var street = result.street_txt;
                var bud = result.bud;
                var zrazok = result.zrazok;
                var diametr = result.diametr;
                var typ = result.typ;
                var spravnyi = result.spravnyi;
                var vkazivnyk = result.vkazivnyk;
                var pidrozdilId = result.pidrozdil_id;

                document.getElementById("getLatLon").disabled = false;


                document.getElementById("lng").value = lng;
                document.getElementById("lng").disabled = false;
                document.getElementById("lat").value = lat;
                document.getElementById("lat").disabled = false;
                document.getElementById("street_txt").value = street;
                document.getElementById("street_txt").disabled = false;
                document.getElementById("bud").value = bud;
                document.getElementById("bud").disabled = false;
                document.getElementById("zrazok").value = zrazok;
                document.getElementById("zrazok").disabled = false;
                document.getElementById("diametr").value = diametr;
                document.getElementById("diametr").disabled = false;
                document.getElementById("typ").value = typ;
                document.getElementById("typ").disabled = false;
                document.getElementById("spravnyi").value = spravnyi;
                document.getElementById("spravnyi").disabled = false;
                document.getElementById("vkazivnyk").value = vkazivnyk;
                document.getElementById("vkazivnyk").disabled = false;
                document.getElementById("notRigths").innerHTML = "Ви можете редагувати цей гідрант";

                $("#notRigths").css("background-color", "lightgreen")
                $(".edit").css("background-color", "lightgreen");
                $("#getLatLon").css("background-color", "lightgreen");

            }
        },
        error: function() {
            alert("error");
        }
    });


    if (crosshairs_enabled === true || popup.popup == 91) {
        popup.popup.remove();
    }
});

// map.on('click',function (e) {
//     //alert(1);
//     //SELECT ST_PointFromText('POINT(-71.064544 42.28787)', 4326);
//     //console.log(e.latlng.toString());
//     if (crosshairs_enabled === true) {
//         showMarker(e.latlng.lat,e.latlng.lng);
// //       console.log('<#10>#>>ST_PointFromText(\'POINT('+e.latlng.lat+' '+e.latlng.lng+')\', 4326)');
//         console.log('<#10>'+e.latlng.lng+'>'+e.latlng.lat+'#>');
//         crosshairBut(false);
//     }
// });

map.on('click',function (e) {

    // document.getElementById("idGidr").value = '';
    // document.getElementById("lng").value = '';
    // document.getElementById("lat").value = '';
    // document.getElementById("street_txt").value = '';
    // document.getElementById("bud").value = '';
    // document.getElementById("zrazok").value = '';
    // document.getElementById("diametr").value = '';
    // document.getElementById("typ").value = '';
    // document.getElementById("spravnyi").value = '';
    // document.getElementById("vkazivnyk").value = '';
    //alert(1);
    //SELECT ST_PointFromText('POINT(-71.064544 42.28787)', 4326);
    //console.log(e.latlng.toString());
    if (crosshairs_enabled === true) {
        showMarker(e.latlng.lat,e.latlng.lng);
//       console.log('<#10>#>>ST_PointFromText(\'POINT('+e.latlng.lat+' '+e.latlng.lng+')\', 4326)');
//         console.log('<#10>'+e.latlng.lng+'>'+e.latlng.lat+'#>');
        crosshairBut(false);
        // console.log("Coordinates -   "+e.latlng.lng, e.latlng.lat)
        // coordinate(e.latlng.lng, e.latlng.lat);
        document.getElementById('lng').value = e.latlng.lng;
        document.getElementById('lat').value = e.latlng.lat;

        document.getElementById('lng1').value = e.latlng.lng;
        document.getElementById('lat1').value = e.latlng.lat;


    }

});









function crosshairBut(crosshairs_enable) {
    if (crosshairs_enable === true) {
        // enable crosshairs..
        L.DomUtil.addClass(map._container, 'crosshair-cursor-enabled');
        crosshairs_enabled = true;
    } else {
        // disable crosshairs..
        L.DomUtil.removeClass(map._container, 'crosshair-cursor-enabled');
        crosshairs_enabled = false;
    }
}









//function crosshairBut() {
//  if (crosshairs_enabled === false) {
//    // enable crosshairs..
//    crosshairBut(true);
//  } else {
//    // disable crosshairs..
//    crosshairBut(false);
//  }
//}

function showMarker(lat, lon){
	if(marker){
		marker.remove();
	}
	marker = L.marker([lat, lon]).addTo(map);
    map.panTo([lat, lon]);
}

function showMarkerZoom(lat, lon, zoom){
	//alert(zoom);
    showMarker(lat, lon);
	map.setView([lat, lon], zoom);	
    //map.panTo([lat, lon]);	    
}

function getLatLon(){
    crosshairBut(true);
}

// function getLatLonCenter(){
//     return map.getCenter();
// }

function refresh13(){
    console.log("refresh13:", map.getCenter().lng, map.getCenter().lat);
    map.panTo([map.getCenter().lat+0.0000000001, map.getCenter().lng+0.0000000001]);
    return "ok";
    
}
/******************************************************************************************/