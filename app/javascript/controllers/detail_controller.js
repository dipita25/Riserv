import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets= ["div"]
  static values = {
    id: Number
  }

  connect() {
    console.log("ID:", this.idValue);
  }

  handleMouseEnter() {
    console.log("detail enter mouse");
    this.element.style.cursor = "pointer";
  }

  getDetails(){
    console.log("redirect");
    window.location.href = `/enterprises/${this.idValue}/services`
  }

}
