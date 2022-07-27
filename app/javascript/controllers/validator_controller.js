import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['validateParam']
  
  connect() {
    this.submitButtonTarget.hidden = true;
  }

  validate() {
    const inputData = {
      "label": this.validateParamTarget.label,
      "value": this.validateParamTarget.value
    }
    get(`preview/params?${inputData.label}&${inputData.value}`)
  }
}

//@preview_employee.errors.full_messages