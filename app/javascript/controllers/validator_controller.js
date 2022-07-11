import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['submitButton']
  
  connect() {
    this.submitButtonTarget.hidden = true;
  }

  submit() {
    //debugger
    this.submitButtonTarget.click()
    clearTimeout(this.timeout)
    this.timeout = setTimeout(()=> {
      this.submitButtonTarget.click()
    }, 500)
    console.log('checkpoint reached')
  }
}