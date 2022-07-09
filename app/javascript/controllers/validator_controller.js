import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['submitbutton']
  connect() {
    this.submitButtonTarget.hidden = true;
  }
}
