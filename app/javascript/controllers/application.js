import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug    = true
application.warnings = true
window.Stimulus      = application

export { application }
