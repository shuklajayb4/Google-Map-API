<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

        
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Google Maps</title>

<style>
     html, body, #map-canvas {
         height: 100%;
         width: 100%;
         margin: 0px;
         padding: 0px
     }
 </style>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCE2B2QxDXntesD2VvQiRehzjZAve84zBI"></script>

<script>
var map;

var latitude1 = '${latitude1}';
var longitude1 = '${longitude1}';

//latitude1 = parseFloat(latitude1);
//longitude1 = parseFloat(longitude1);

var latitude2 = '${latitude2}';
var longitude2 = '${longitude2}';

//latitude2 = parseFloat(latitude2);
//longitude2 = parseFloat(longitude2);

function init() {
	var startLatLng = new google.maps.LatLng(parseFloat(latitude1), parseFloat(longitude1)); // LAX
    var endLatLng = new google.maps.LatLng(parseFloat(latitude2), parseFloat(longitude2)); // MSP
	
	//var startLatLng = new google.maps.LatLng(34.052235, -118.243683); //LAX
    //var endLatLng = new google.maps.LatLng(44.986656, -93.258133); // MSP

    map = new google.maps.Map(document.getElementById('map-canvas'), {
        center: startLatLng,
        zoom: 5
    });

    //var p1 = new google.maps.LatLng(23.634501, -102.552783);
    //var p2 = new google.maps.LatLng(17.987557, -92.929147);

    //var p1 = new google.maps.LatLng(34.052235, -118.243683); // LAX
    //var p2 = new google.maps.LatLng(44.986656, -93.258133); //MSP

    var bounds = new google.maps.LatLngBounds();
    bounds.extend(startLatLng);
    bounds.extend(endLatLng);
    map.fitBounds(bounds);
    var markerP1 = new google.maps.Marker({
        position: startLatLng,

        map: map
    });
    var markerP2 = new google.maps.Marker({
        position: endLatLng,
        map: map
    });
    google.maps.event.addListener(map, 'projection_changed', function () {
        var startLatLng = map.getProjection().fromLatLngToPoint(markerP1.getPosition());
        var endLatLng = map.getProjection().fromLatLngToPoint(markerP2.getPosition());
        var e = new google.maps.Point(startLatLng.x - endLatLng.x, startLatLng.y - endLatLng.y);
        var m = new google.maps.Point(e.x / 2, e.y / 2);
        var o = new google.maps.Point(0, 7);
        var c = new google.maps.Point(m.x + o.x, m.y + o.y);
        var curveMarker2 = new google.maps.Marker({
            position: markerP1.getPosition(),
            icon: {
                path: "M 0 0 q " + c.x + " " + c.y + " " + e.x + " " + e.y,
                scale: 24,
                strokeWeight: 2,
                fillColor: '#009933',
                fillOpacity: 0,
                rotation: 180,
                anchor: new google.maps.Point(0, 0)
            }
        });
        curveMarker2.setMap(map);
        google.maps.event.addListener(map, 'zoom_changed', function () {
            var zoom = map.getZoom();
            var scale = 1 / (Math.pow(2, -zoom));
            var icon = {
                path: "M 0 0 q " + c.x + " " + c.y + " " + e.x + " " + e.y,
                scale: scale,
                strokeWeight: 2,
                fillColor: '#009933',
                fillOpacity: 0,
                rotation: 180,
                anchor: new google.maps.Point(0, 0)
            };
            curveMarker2.setIcon(icon);
        });
        3
    });
}

google.maps.event.addDomListener(window, 'load', init);
</script>

</head>
<body>
<%-- <blockquote>New Latitude1: <b> <%= request.getAttribute("latitude1") %> </b></blockquote>
<blockquote>New Longitude1: <b> <%= request.getAttribute("longitude1") %> </b></blockquote>

<blockquote>New Latitude2: <b> <%= request.getAttribute("latitude2") %> </b></blockquote>
<blockquote>New Longitude2: <b> <%= request.getAttribute("longitude2") %> </b></blockquote> --%>

<div id="map-canvas" style="border: 2px solid #3872ac;"></div>

</body>
</html>