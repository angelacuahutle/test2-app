import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from "@rails/request.js"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['validateParam']
  
  connect() {
    this.validateParamTarget.hidden = true;
  }

  validatitor() {
    const inputData = {
      "label": this.validateParamTarget.name,
      "value": this.validateParamTarget.value
    }
    get(`preview/param${inputData.label}&${inputData.value}`)
  }
}

//@preview_employee.errors.full_messages