import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modelSelect"]

  connect() {
    console.log("AI Provider controller connected")
  }

  loadModels(event) {
    console.log("Loading models for provider:", event.target.value)
    const providerId = event.target.value
    
    if (!providerId) {
      const frame = document.getElementById("ai-model-select")
      frame.innerHTML = `
        <select name="ai_agent[ai_model_id]" class="form-select" disabled>
          <option>Select an AI Provider first</option>
        </select>
      `
      return
    }

    fetch(`/ai_agents/models_for_provider?ai_provider_id=${providerId}`, {
      headers: {
        "Accept": "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => {
      console.log("Received response:", html)
      const frame = document.getElementById("ai-model-select")
      frame.innerHTML = html
    })
    .catch(error => {
      console.error("Error loading models:", error)
    })
  }
}
