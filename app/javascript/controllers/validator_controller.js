import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['validateParam']
  
  connect() {
    this.validateParamTarget.hidden = true;
  }

  validate() {
    setTimeout(2000);
    get(`employees/preview/?label=${this.validateParamTarget.name}&value=${this.validateParamTarget.value}`)
  }
}

//@preview_employee.errors.full_messages