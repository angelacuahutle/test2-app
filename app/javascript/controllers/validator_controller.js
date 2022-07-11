import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['submitButton']
  
  connect() {
    this.submitButtonTarget.hidden = true;
  }

  submit() {
    console.log('checkpoint reached')
    this.submitButtonTarget.click()
    clearTimeout(this.timeout)
    this.time = setTimeout(()=> {
    this.submitButtonTarget.click()
    }, 500)
  }
}
