import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Object
  }

  connect() {
    console.log("test")
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    })
    this.#addMarkerToMap()
    this.#fitMapToBounds()
  }

  #addMarkerToMap() {

    const popup = new mapboxgl.Popup().setHTML(this.markersValue.info_window_html)

    // Create a HTML element for your custom marker
    const customMarker = document.createElement("div")
    customMarker.innerHTML = this.markersValue.marker_html

    new mapboxgl.Marker(customMarker)
      .setLngLat([ this.markersValue.lng, this.markersValue.lat ])
      .setPopup(popup)
      .addTo(this.map)
  }

  #fitMapToBounds() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markersValue.lng, this.markersValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
