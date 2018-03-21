
import { autocomplete } from './autocomplete';
import GMaps from 'gmaps/gmaps.js';
// documentation: https://hpneo.github.io/gmaps/examples.html

const mapElement = document.getElementById('map');

if (mapElement) {
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(10);
  } else {
    map.fitLatLngBounds(markers);
  }

  map.drawCircle({
    lat: markers[0].lat,
    lng: markers[0].lng,
    radius: markers[0].range * 1000
  });

}

autocomplete();



