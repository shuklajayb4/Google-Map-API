<%@ page isELIgnored ="false" %>
<%@ page import="java.util.ArrayList"%>
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
<script type="text/javascript">
   var latitude1 = <%= request.getAttribute("latitude1") %>;
   var longitude1 = <%= request.getAttribute("longitude1") %>;
   
   var latitude2 = <%= request.getAttribute("latitude2") %>;
   var longitude2 = <%= request.getAttribute("longitude2") %>;
   
   var latitudeArr = <%=request.getAttribute("latitudeArr") %>;
   var longitudeArr = <%=request.getAttribute("longitudeArr") %>;
  
</script>
<!-- <script src="js/mapscript.js"></script> -->
<script>
var map;

var latitude1 = '${latitude1}';
var longitude1 = '${longitude1}';

var latitude2 = '${latitude2}';
var longitude2 = '${longitude2}';


var latitudeArray=new Array();
var longitudeArray=new Array();


<% String[] latitudeCords=(String[])request.getAttribute("latitudeArr");

  for(int i=0; i < latitudeCords.length; i++){ %>
      var latCode='<%= latitudeCords[i] %>';           //--> without this doesnt work
      latitudeArray[<%= i %>] = latCode;      
  <%}%>
   
  
  <% 
  	String[] longitudeCodes = (String[])request.getAttribute("longitudeArr");
  for(int i=0; i < longitudeCodes.length; i++)
  { %>
	var lngCode='<%= longitudeCodes[i] %>';
	longitudeArray[<%=i%>] = lngCode;
  <%} %>
 
  
function init() {
	
	 var marker = [];
	 var i;
	
	var startLatLng = new google.maps.LatLng(parseFloat(latitude1), parseFloat(longitude1)); // LAX
    var endLatLng = new google.maps.LatLng(parseFloat(latitude2), parseFloat(longitude2)); // MSP
    
    var locs = [ ["34.052235", "-118.243683"], ["44.986656", "-93.258133"], ["51.0486", "-114.0708"], ["19.0760", "72.8777"]];
    
    map = new google.maps.Map(document.getElementById('map-canvas'), {
        center: startLatLng,
        zoom: 5
    });
    
   
    for (i = 0; i < locs.length; i++) {  
      marker[i] = new google.maps.Marker({
        position: new google.maps.LatLng(locs[i][0], locs[i][1]),
        map: map
      });
    }   
	
    for (i = 0; i < locs.length-1; i++) {  
	    var bounds = new google.maps.LatLngBounds();
	    bounds.extend(locs[i][0], locs[i][1]);	    
	    map.fitBounds(bounds);
    }
    
    google.maps.event.addListener(map, 'projection_changed', function () {
    	for (i = 0; i < locs.length; i++) {  
        //var e = new google.maps.Point(startLatLng.x - endLatLng.x, startLatLng.y - endLatLng.y);
        var e = new google.maps.Point(locs[i][0] - locs[i+1][0], locs[i][1] - locs[i+1][1]);
   
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
    	} // for ends
    }); //listener ends
    
} // init ends

google.maps.event.addDomListener(window, 'load', init);
</script>
</head>
<body>

<div id="map-canvas" style="border: 2px solid #3872ac;"></div>


</body>
</html>