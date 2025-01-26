import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  loadModels(event) {
    const providerId = event.target.value
    if (!providerId) {
      document.getElementById("ai-model-select").innerHTML = `
        <select class="form-select" disabled>
          <option>Select an AI Provider first</option>
        </select>
      `
      return
    }

    fetch(`/ai_agents/models_for_provider?ai_provider_id=${providerId}`, {
      headers: {
        "Accept": "text/vnd.turbo-stream.html",
        "Turbo-Frame": "ai-model-select"
      }
    })
  }
}
