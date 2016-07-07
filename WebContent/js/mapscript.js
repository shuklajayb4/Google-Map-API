var map;

var latitude1 = '${latitude1}';
var longitude1 = '${longitude1}';


var latitude2 = '${latitude2}';
var longitude2 = '${longitude2}';

function init() {
	var startLatLng = new google.maps.LatLng(parseFloat(latitude1), parseFloat(longitude1)); // LAX
    var endLatLng = new google.maps.LatLng(parseFloat(latitude2), parseFloat(longitude2)); // MSP
	

    map = new google.maps.Map(document.getElementById('map-canvas'), {
        center: startLatLng,
        zoom: 5
    });

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
    });
}

google.maps.event.addDomListener(window, 'load', init);