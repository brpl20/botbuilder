// app/javascript/controllers/nested_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fields", "template"]

  add(event) {
    event.preventDefault()

    // Replace 'NEW_RECORD' with a unique timestamp to avoid conflicts
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.fieldsTarget.insertAdjacentHTML("beforeend", content)
  }

  remove(event) {
    event.preventDefault()

    const wrapper = event.target.closest(".nested-fields")
    if (wrapper.dataset.newRecord === "true") {
      wrapper.remove() // Remove new records directly
    } else {
      // Mark existing records for destruction
      wrapper.querySelector("input[name*='_destroy']").value = "1"
      wrapper.style.display = "none" // Hide the field
    }
  }
}