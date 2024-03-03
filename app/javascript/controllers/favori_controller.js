import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets= ["favori_add", "favori_remove"]
  static values = {
    id: Number
  }

  connect() {
    console.log("ID:", this.idValue);
  }

  handleMouseEnter() {
    this.element.style.cursor = "pointer";
  }

  ajouterRetirer() {
    console.log("ID:", this.idValue);

    if (this.favori_addTarget.classList.contains("fa-regular")){
      this.favori_addTarget.classList.remove("fa-regular")
      this.favori_addTarget.classList.add("fa-solid")

      fetch(`/enterprises/${this.idValue}/add_to_favorites`, { method: 'GET' })
      .then(response => {
        if (!response.ok) {
          throw new Error('Erreur lors de l\'ajout aux favoris');
        }
        // Gérer la réponse si nécessaire
      })
      .catch(error => {
        console.error(error);
      });


    }else{
      this.favori_addTarget.classList.remove("fa-solid")
      this.favori_addTarget.classList.add("fa-regular")

      fetch(`/enterprises/${this.idValue}/remove_to_favorites`, { method: 'GET' })
      .then(response => {
        if (!response.ok) {
          throw new Error('Erreur lors de l\'ajout aux favoris');
        }
        // Gérer la réponse si nécessaire
      })
      .catch(error => {
        console.error(error);
      });

    }
  }

  retirer() {
    this.favori_removeTarget.classList.remove("fa-solid")
    this.favori_removeTarget.classList.add("fa-regular")
  }
}
