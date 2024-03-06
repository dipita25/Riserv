import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static values = {
    longitude: Number,
    latitude: Number
  }

  static targets = ["userPosition", "input"];

  connect() {
      //this.getUserPosition();
  }

  getUserPosition() {
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition((position) => {
              this.userPositionValue = position.coords
              console.log(this.userPositionValue)
          });
      } else {
          // Gestion de l'absence de support pour la géolocalisation
      }
  }
}
