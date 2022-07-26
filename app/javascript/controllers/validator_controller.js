import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['submitButton']
  
  connect() {
    this.submitButtonTarget.hidden = true;
  }

  submit() {
    this.submitButtonTarget.click()
    clearTimeout(this.timeout)
    this.timeout = setTimeout(()=> {
      this.submitButtonTarget.click()
    }, 500)
  }
}

//@preview_employee.errors.full_messages