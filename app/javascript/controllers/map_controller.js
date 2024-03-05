import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Object
  }

  connect() {
    let userPosition;

    const getUserPosition = new Promise((resolve, reject) => {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          userPosition = [position.coords.longitude, position.coords.latitude];
          resolve(userPosition);
          console.log(userPosition)
        });
      } else {
        reject(new Error("Geolocation is not supported by this browser"));
      }
    });

    getUserPosition.then((position) => {
      this.map.on('load', () => {
        console.log(position);

        // Ajoutez le chemin entre la position de l'utilisateur et celle du marqueur
        //this.addRoute(position, [this.markersValue.lng, this.markersValue.lat]);
      })
    }).catch((error) => {
      console.error(error);
    });

    console.log("test")
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    })
    this.addMarkerToMap();
    this.fitMapToBounds();

    var geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserLocation: true,
      showUserHeading: true
    });
    this.map.addControl(geolocate);

    geolocate.on('geolocate', function(event) {
      var userLocation = event.coords;
      console.log('Latitude: ' + userLocation.latitude);
      console.log('Longitude: ' + userLocation.longitude);
    });

  }

  addMarkerToMap() {
    const popup = new mapboxgl.Popup().setHTML(this.markersValue.info_window_html)
    const customMarker = document.createElement("div")
    customMarker.innerHTML = this.markersValue.marker_html

    new mapboxgl.Marker(customMarker)
      .setLngLat([this.markersValue.lng, this.markersValue.lat])
      .setPopup(popup)
      .addTo(this.map)
  }

  fitMapToBounds() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([this.markersValue.lng, this.markersValue.lat])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 13, duration: 0 })
  }

  // Fonction pour ajouter le chemin entre la position de l'utilisateur et celle du marqueur
  // addRoute(userPosition, markerPosition) {
  //   this.map.addSource('route', {
  //     'type': 'geojson',
  //     'data': {
  //       'type': 'Feature',
  //       'properties': {},
  //       'geometry': {
  //         'type': 'LineString',
  //         'coordinates': [
  //           userPosition,
  //           markerPosition
  //         ]
  //       }
  //     }
  //   });

  //   this.map.addLayer({
  //     'id': 'route',
  //     'type': 'line',
  //     'source': 'route',
  //     'layout': {
  //       'line-join': 'round',
  //       'line-cap': 'round'
  //     },
  //     'paint': {
  //       'line-color': '#094bb5',
  //       'line-width': 8
  //     }
  //   });
  // }
}
