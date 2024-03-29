import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  hideModal() {
    this.element.parentElement.removeAttribute("") // it might be nice to also remove the modal SRC
    this.element.remove()
  }
}
