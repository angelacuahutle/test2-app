import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['validateParam']
  
  connect() {
    this.validateParamTarget.hidden = true;
  }

  validate() {
    const label = this.validateParamTarget.name.match(/\[(.*?)\]/)[1];
    get(`employees/preview/?label=${label}=${this.validateParamTarget.value}`,{
      responseKind: 'turbo-stream'
    })
  }
}
